page 50100 "BC CPL Item API"
{
    APIGroup = 'app1';
    APIPublisher = 'ImeshNirmal';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'bcCPLItemAPI';
    DelayedInsert = true;
    EntityName = 'item';
    EntitySetName = 'items';
    PageType = API;
    SourceTable = Item;

    // ODataKeyFields allows clients to request a specific record, e.g., /items(1996-S)
    // We use SystemId because it is a unique, immutable GUID for every record
    //ODataKeyFields = SystemId;


    // In the layout section, you define which fields from the SourceTable you want to expose.
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                // field(id; Rec.SystemId)
                // {
                //     Caption = 'System ID';
                //     Editable = false;
                // }
                field("no"; Rec."No.")
                {
                    Caption = 'Item Number';
                    Editable = false;
                }
                field("description"; Rec.Description)
                {
                    Caption = 'Description';
                }
                field("baseUnitOfMeasure"; Rec."Base Unit of Measure")
                {
                    Caption = 'Base Unit of Measure';
                }
                field(unitPrice; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                }
            }
        }
    }
}
