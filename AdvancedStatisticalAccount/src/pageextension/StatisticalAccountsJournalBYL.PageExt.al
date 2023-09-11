pageextension 50001 StatisticalAccountsJournalBYL extends "Statistical Accounts Journal"
{
    layout
    {
        addlast(content)
        {
            field("G/L Entry No."; Rec."G/L Entry No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specify the G/L Entry No.';
            }

            field("Stat. Acc. Unit of Measure"; Rec."Stat. Acc. Unit of Measure")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Unit of Measure for the entry';
            }
        }
    }
}