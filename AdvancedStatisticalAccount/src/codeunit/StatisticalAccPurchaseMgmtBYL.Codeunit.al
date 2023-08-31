codeunit 50002 StatisticalAccPurchaseMgmtBYL
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", OnAfterFinalizePosting, '', false, false)]
    local procedure OnAfterFinalizePostingPostStatisticalAccountEntries()
    begin

    end;
}