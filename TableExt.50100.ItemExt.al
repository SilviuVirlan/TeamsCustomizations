tableextension 50130 ItemExtSV extends Item
{
    fields
    {
        field(50100; PartNo; Text[20])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}