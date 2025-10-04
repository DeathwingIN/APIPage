page 50101 CustomerAPI
{
    APIGroup = 'app1';
    APIPublisher = 'ImeshNirmal';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'customerAPI';
    DelayedInsert = true;
    EntityName = 'customer';
    EntitySetName = 'customer';
    PageType = API;
    SourceTable = Customer;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("no"; Rec."No.")
                {
                    Caption = 'Customer Number';
                    Editable = false;
                }
                field("name"; Rec.Name)
                {
                    Caption = 'Name';
                }
                field("address"; Rec.Address)
                {
                    Caption = 'Address';
                }
                field("city"; Rec.City)
                {
                    Caption = 'City';
                }
                field("phoneNo"; Rec."Phone No.")
                {
                    Caption = 'Phone No';
                }
                field("eMail"; Rec."E-Mail")
                {
                    Caption = 'E-Mail';
                }
            }
        }
    }
}
