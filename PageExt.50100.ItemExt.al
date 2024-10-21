pageextension 50130 ItemCardExt extends "Item Card"
{
    layout
    {
        addafter(Description)
        {
            field(PartNo; Rec.PartNo)
            {
                Caption = 'Part No.';
                ApplicationArea = All;
            }
        }

    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}