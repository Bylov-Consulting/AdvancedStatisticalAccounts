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

            field("Source Type"; Rec."Source Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Source Type of the entry';
            }

            field("Stat. Acc. Unit of Measure"; Rec."Stat. Acc. Unit of Measure")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Unit of Measure for the entry';
            }
        }
    }
}