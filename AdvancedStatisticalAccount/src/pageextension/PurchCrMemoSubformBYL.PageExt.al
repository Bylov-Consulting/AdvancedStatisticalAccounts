pageextension 50005 PurchCrMemoSubformBYL extends "Purch. Cr. Memo Subform"
{
    layout
    {
        addlast(Control1)
        {
            field("Statistical Account No."; Rec."Statistical Account No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specify the Statistical Account No.';
                Enabled = Rec.Type = rec.Type::"G/L Account";
            }

            field("Statistical Amount"; Rec."Statistical Amount")
            {
                ApplicationArea = All;
                ToolTip = 'Specify the Statistical Amount';
                Enabled = Rec.Type = rec.Type::"G/L Account";
            }
            field("Stat. Acc. Unit of Measure"; Rec."Stat. Acc. Unit of Measure")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Unit of Measure for the entry';
                Enabled = Rec.Type = rec.Type::"G/L Account";
            }
        }
    }
}