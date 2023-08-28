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
        }
    }
}