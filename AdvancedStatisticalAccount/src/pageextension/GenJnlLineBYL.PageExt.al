pageextension 50000 GenJnlLineBYL extends "General Journal"
{
    layout
    {
        addlast(Control1)
        {
            field("Statistical Account No."; Rec."Statistical Account No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specify the Statistical Account No.';
            }

            field("Statistical Amount"; Rec."Statistical Amount")
            {
                ApplicationArea = All;
                ToolTip = 'Specify the Statistical Amount';
            }

        }

    }
}