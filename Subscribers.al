codeunit 50130 Subscribers
{
    #region Change fields on Teams card
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Page Summary Provider", 'OnAfterGetSummaryFields', '', false, false)]
    local procedure MyProcedure(PageId: Integer; RecId: RecordId; var FieldList: List of [Integer])
    var
        _item: Record Item;
    begin
        if PageId <> Page::"Item Card" then
            exit;

        // Add part no
        FieldList.Add(_item.FieldNo(_item.PartNo));

    end;
    #endregion

    #region Add /Remove Recommended Content
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Page Action Provider", 'OnAfterGetPageActions', '', true, true)]
    local procedure AddMyPageToRecommendedContent(PageId: Integer; IncludeViews: Boolean; var ItemsJsonArray: JsonArray)
    begin
        AddRecommendedPage(ItemsJsonArray, 'GLE', GetUrl(ClientType::Web, CompanyName(), ObjectType::Page, Page::"General Ledger Entries"));
        AddRecommendedPage(ItemsJsonArray, 'FA List', GetUrl(ClientType::Web, CompanyName(), ObjectType::Page, Page::"Fixed Asset List"));
    end;

    local procedure AddRecommendedPage(var ActionsArray: JsonArray; Caption: Text; Url: Text)
    var
        ActionsJsonObject: JsonObject;
    begin
        ActionsJsonObject.Add('caption', Caption);
        ActionsJsonObject.Add('Url', Url);
        ActionsArray.Add(ActionsJsonObject);
    end;
    #endregion
}