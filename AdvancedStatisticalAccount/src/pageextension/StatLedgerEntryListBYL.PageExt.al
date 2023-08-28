pageextension 50002 "Stat. Ledger Entry List BYL" extends "Statistical Ledger Entry List"
{
    layout
    {
        addlast(Content)
        {
            field("G/L Entry No."; Rec."G/L Entry No.")
            {
                ApplicationArea = All;
                ToolTip = 'G/L Entry No. of associated General Ledger Entry';
            }
        }
    }
}