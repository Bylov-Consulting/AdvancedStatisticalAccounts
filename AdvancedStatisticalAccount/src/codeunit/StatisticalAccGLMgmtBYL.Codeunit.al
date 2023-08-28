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
    local procedure OnAfterGLFinishPostingPostStatisticalLedgerEntry(GLEntry: Record "G/L Entry"; var GenJnlLine: Record "Gen. Journal Line"; Balancing: Boolean)
    var
        TempStatAccJournalLine: Record "Statistical Acc. Journal Line" temporary;
        StatAccJnlLinePost: Codeunit "Stat. Acc. Jnl. Line Post BYL";

    begin
        if Balancing = true then
            exit;
        // Init line
        TempStatAccJournalLine.init();
        TempStatAccJournalLine."Journal Batch Name" := 'DEFAULT'; // TODO Fix this to be dynamic
        TempStatAccJournalLine."Line No." := 10000;
        TempStatAccJournalLine."Posting Date" := GenJnlLine."Posting Date";
        TempStatAccJournalLine."Statistical Account No." := GenJnlLine."Statistical Account No.";
        TempStatAccJournalLine.Description := GenJnlLine.Description;
        TempStatAccJournalLine.Amount := GenJnlLine."Statistical Amount";
        TempStatAccJournalLine."Shortcut Dimension 1 Code" := GenJnlLine."Shortcut Dimension 1 Code";
        TempStatAccJournalLine."Shortcut Dimension 2 Code" := GenJnlLine."Shortcut Dimension 2 Code";
        TempStatAccJournalLine."Dimension Set ID" := GenJnlLine."Dimension Set ID";
        TempStatAccJournalLine."G/L Entry No." := GLEntry."Entry No.";
        // Insert Line
        TempStatAccJournalLine.Insert();
        // Post Statistical Ledger Entry
        StatAccJnlLinePost.Run(TempStatAccJournalLine);
    end;
}