enum 50000 StatisticalAccountSourceType
{
    Extensible = true;

    value(0; "G/L")
    {
        Caption = 'G/L';
    }

    value(1; Purchase)
    {
        Caption = 'Purchase';
    }

    value(2; Sales)
    {
        Caption = 'Sales';
    }
}