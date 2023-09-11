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
        field(50002; "Stat. Acc. Unit of Measure"; Code[10])
        {
            Caption = 'Unit of Measure';
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure".Code;
        }

        modify("Type")
        {
            trigger OnAfterValidate()
            begin
                if rec.Type <> rec.Type::"G/L Account" then begin
                    Rec."Statistical Account No." := '';
                    Rec."Statistical Amount" := 0;
                    Rec."Stat. Acc. Unit of Measure" := '';
                end;
            end;
        }
    }
}