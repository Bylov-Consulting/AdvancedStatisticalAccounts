tableextension 50000 StatisticalLedgerEntryBYL extends "Statistical Ledger Entry"
{
    fields
    {
        field(50000; "G/L Entry No."; Integer)
        {
            Caption = 'G/L Entry No.';
            DataClassification = ToBeClassified;
            TableRelation = "G/L Entry"."Entry No.";
        }
        field(50001; "Source Type"; Enum StatisticalAccountSourceType)
        {
            Caption = 'Source Type';
            DataClassification = ToBeClassified;
        }
    }
}