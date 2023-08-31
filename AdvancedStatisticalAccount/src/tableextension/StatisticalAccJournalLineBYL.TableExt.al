tableextension 50002 StatisticalAccJournalLineBYL extends "Statistical Acc. Journal Line"
{
    fields
    {
        field(50000; "G/L Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Entry"."Entry No.";
        }

        field(50001; "G/L Register No."; Integer)
        {
            Caption = 'G/L Register No.';
            DataClassification = ToBeClassified;
            TableRelation = "G/L Register"."No.";
        }

    }

}