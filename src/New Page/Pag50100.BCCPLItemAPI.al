page 50100 "BC CPL Item API"
{
    APIGroup = 'essentials';
    APIPublisher = 'ImeshNirmal';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'bcCPLItemAPI';
    DelayedInsert = true;
    EntityName = 'item';
    EntitySetName = 'items';
    PageType = API;
    SourceTable = Item;


    // In the layout section, you define which fields from the SourceTable you want to expose.
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                // We are exposing four fields here: Item No., Description, Base Unit of Measure, and Type.
                field("no"; Rec."No.")
                {
                }
                field("description"; Rec.Description)
                {
                }
                field("baseUnitOfMeasure"; Rec."Base Unit of Measure")
                {
                }
                field("type"; Rec.Type)
                {
                }
            }
        }
    }
}
