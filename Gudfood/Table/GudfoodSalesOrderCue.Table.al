table 50105 "Gudfood Sales Order Cue"
{
    Caption = 'Gudfood Sales Order Cue';

    fields
    {
        field(1; "Primary Key"; code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Number of Orders"; Integer)
        {
            Caption = 'Gudfood Orders';
            FieldClass = FlowField;
            CalcFormula = count("Gudfood Order Header");
        }
        field(3; "Total Number of Orders"; Integer)
        {
            Caption = 'Posted Gudfood Orders';
            FieldClass = FlowField;
            CalcFormula = count("Posted Gudfood Order Header");
        }
        field(4; "Number of Gudfood Items"; Integer)
        {
            Caption = 'Gudfood Items';
            FieldClass = FlowField;
            CalcFormula = count("Gudfood Item");
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}