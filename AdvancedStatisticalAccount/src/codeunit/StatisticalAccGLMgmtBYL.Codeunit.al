codeunit 50000 "Statistical Acc. G/L Mgmt. BYL"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Check Line", OnAfterCheckGenJnlLine, '', false, false)]
    local procedure OnBeforeGenJnlPostBatchRunCheckStatisticalAccount(var GenJournalLine: Record "Gen. Journal Line")
    var
        TempStatAccJournalLine: Record "Statistical Acc. Journal Line" temporary;
        StatAccJnlCheckLine: Codeunit "Stat. Acc. Jnl Check Line";
    begin
        TempStatAccJournalLine.Init();
        TempStatAccJournalLine."Statistical Account No." := GenJournalLine."Statistical Account No.";
        TempStatAccJournalLine.Amount := GenJournalLine."Statistical Amount";
        StatAccJnlCheckLine.Run(TempStatAccJournalLine);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Stat. Acc. Jnl. Line Post BYL", OnAfterTransferStatisticalAccJournalLineTo, '', false, false)]
    local procedure OnAfterTransferStatisticalAccJournalLineTo(var StatisticalLedgerEntry: Record "Statistical Ledger Entry"; var StatisticalAccJournalLine: Record "Statistical Acc. Journal Line")
    begin
        StatisticalLedgerEntry."G/L Entry No." := StatisticalAccJournalLine."G/L Entry No.";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", OnAfterPostGLAcc, '', false, false)]
    local procedure OnAfterGLFinishPostingPostStatisticalLedgerEntry(GLEntry: Record "G/L Entry"; var GenJnlLine: Record "Gen. Journal Line"; Balancing: Boolean; sender: Codeunit "Gen. Jnl.-Post Line")
    var
        StatAccJournalLine: Record "Statistical Acc. Journal Line";
        //StatAccJnlLinePost: Codeunit "Stat. Acc. Jnl. Line Post BYL";
        GLRegNo: Record "G/L Register";
        LastLineNo: integer;

    begin

        if Balancing = true then
            exit;

        sender.GetGLReg(GLRegNo);

        LastLineNo := 0;
        StatAccJournalLine.SetRange("Journal Template Name", StatAccJournalLine."Journal Template Name");
        StatAccJournalLine.SetRange("Journal Batch Name", StatAccJournalLine."Journal Batch Name");
        if StatAccJournalLine.FindLast() then
            LastLineNo := StatAccJournalLine."Line No.";
        // Init line
        StatAccJournalLine.init();
        StatAccJournalLine."Journal Batch Name" := 'DEFAULT'; // TODO Fix this to be dynamic
        StatAccJournalLine."Line No." := LastLineNo + 10000;
        StatAccJournalLine."Posting Date" := GenJnlLine."Posting Date";
        StatAccJournalLine."Statistical Account No." := GenJnlLine."Statistical Account No.";
        StatAccJournalLine.Description := GenJnlLine.Description;
        StatAccJournalLine.Amount := GenJnlLine."Statistical Amount";
        StatAccJournalLine."Shortcut Dimension 1 Code" := GenJnlLine."Shortcut Dimension 1 Code";
        StatAccJournalLine."Shortcut Dimension 2 Code" := GenJnlLine."Shortcut Dimension 2 Code";
        StatAccJournalLine."Dimension Set ID" := GenJnlLine."Dimension Set ID";
        StatAccJournalLine."G/L Entry No." := GLEntry."Entry No.";
        StatAccJournalLine."G/L Register No." := GLRegNo."No.";
        StatAccJournalLine."Source Type" := StatAccJournalLine."Source Type"::"G/L";
        // Insert Line
        StatAccJournalLine.Insert();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Batch", OnProcessLinesOnAfterPostGenJnlLines, '', false, false)]
    local procedure OnProcessLinesOnAfterPostGenJnlLinesPostStatisticalAccountEntries(GLRegister: Record "G/L Register"; var GenJournalLine: Record "Gen. Journal Line"; PreviewMode: Boolean; var GLRegNo: Integer)
    var
        StatAccJournalLine: Record "Statistical Acc. Journal Line";
        StatAccPostBatch: Codeunit "Stat. Acc. Post. Batch";
    begin
        if PreviewMode then
            exit;
        StatAccJournalLine.SetRange("G/L Register No.", GLRegNo);
        if StatAccJournalLine.FindFirst() then
            StatAccPostBatch.Run(StatAccJournalLine);
    end;
}