tableextension 50002 StatisticalAccJournalLineBYL extends "Statistical Acc. Journal Line"
{
    fields
    {
        field(50000; "G/L Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Entry"."Entry No.";
        }
    }

}