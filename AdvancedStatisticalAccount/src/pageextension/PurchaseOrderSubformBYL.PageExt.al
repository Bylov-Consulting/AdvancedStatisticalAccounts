pageextension 50003 PurchaseOrderSubformBYL extends "Purchase Order Subform"
{
    layout
    {
        addlast(content)
        {
            field("Statistical Account No."; Rec."Statistical Account No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specify the Statistical Account No.';
                Editable = REc.Type = rec.Type::"G/L Account";
            }

            field("Statistical Amount"; Rec."Statistical Amount")
            {
                ApplicationArea = All;
                ToolTip = 'Specify the Statistical Amount';
                Editable = REc.Type = rec.Type::"G/L Account";
            }
        }
    }
}