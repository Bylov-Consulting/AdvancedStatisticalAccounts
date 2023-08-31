tableextension 50003 PurchaseLineBYL extends "Purchase Line"
{
    fields
    {
        field(50000; "Statistical Account No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Statistical Account"."No.";
        }
        field(50001; "Statistical Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            AutoFormatType = 1;
        }

        modify("Type")
        {
            trigger OnAfterValidate()
            begin
                Rec."Statistical Account No." := '';
                Rec."Statistical Amount" := 0;
            end;
        }
    }
}