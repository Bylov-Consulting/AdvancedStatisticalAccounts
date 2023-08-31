/*table 50000 "Advanced Stat. Acc. Setup"
{

    fields
    {
        field(1; "Primary Key"; Code[10])
        {

        }

        field(2; "Journal Batch Name"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Statistical Acc. Journal Batch";
        }

    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    var
        RecordHasBeenRead: Boolean;

    procedure GetRecordOnce()
    begin
        if RecordHasBeenRead then
            exit;
        Get();
        RecordHasBeenRead := true;
    end;

    procedure InsertIfNotExists()
    begin
        Reset();
        if not Get() then begin
            Init();
            Insert(true);
        end;
    end;


}*/