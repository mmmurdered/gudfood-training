table 50105 "Gudfood Sales Order Cue"
{
    CaptionML = ENU = 'Gudfood Sales Order Cue';

    fields
    {
        field(1; "Primary Key"; code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Number of Orders"; Integer)
        {
            CaptionML = ENU = 'Orders', UKR = 'Замовлення';
            FieldClass = FlowField;
            CalcFormula = count("Gudfood Order Header");
        }
        field(3; "Total Number of Orders"; Integer)
        {
            CaptionML = ENU = 'Posted Orders', UKR = 'Опубліковані замовлення';
            FieldClass = FlowField;
            CalcFormula = count("Posted Gudfood Order Header");
        }
        field(4; "Number of Gudfood Items"; Integer)
        {
            CaptionML = ENU = 'Gudfood Items', UKR = 'Товари Гудфуд';
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