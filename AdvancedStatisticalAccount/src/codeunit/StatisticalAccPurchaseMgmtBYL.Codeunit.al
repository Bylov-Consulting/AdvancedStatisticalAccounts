codeunit 50002 StatisticalAccPurchaseMgmtBYL
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", OnPostInvoicePostBufferLineOnAfterCopyFromInvoicePostBuffer, '', false, false)]
    local procedure OnPostInvoicePostBufferLineOnAfterCopyFromInvoicePostBufferSetStatAccFields(var GenJnlLine: Record "Gen. Journal Line"; var TempPurchLineGlobal: Record "Purchase Line")
    begin
        GenJnlLine."Statistical Account No." := TempPurchLineGlobal."Statistical Account No.";
        GenJnlLine."Statistical Amount" := TempPurchLineGlobal."Statistical Amount";
        GenJnlLine."Stat. Acc. Unit of Measure" := TempPurchLineGlobal."Stat. Acc. Unit of Measure";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", OnAfterPostPurchaseDoc, '', false, false)]
    local procedure OnAfterPostPurchaseDocPostStatAccJournal(var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line")
    var
        GLRegister: Record "G/L Register";
        StatAccJournalLine: Record "Statistical Acc. Journal Line";
        StatAccPostBatchBYL: Codeunit "Stat. Acc. Post. Batch BYL";
    begin
        GenJnlPostLine.GetGLReg(GLRegister);
        StatAccJournalLine.SetRange("G/L Register No.", GLRegister."No.");
        if StatAccJournalLine.FindFirst() then
            StatAccPostBatchBYL.Run(StatAccJournalLine);
    end;
}