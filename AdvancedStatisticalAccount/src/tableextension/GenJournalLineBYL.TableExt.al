tableextension 50001 GenJournalLineBYL extends "Gen. Journal Line"
{
    fields
    {
        field(50000; "Statistical Account No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Statistical Account"."No.";
        }
        field(50001; "Statistical Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            AutoFormatType = 1;
        }
    }
}