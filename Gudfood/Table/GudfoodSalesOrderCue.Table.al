table 50105 GudfoodSalesOrderCue
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
            Caption = 'Current Number of Orders';
            FieldClass = FlowField;
            CalcFormula = count(GudfoodOrderHeader);
        }
        field(3; "Total Number of Orders"; Integer)
        {
            Caption = 'Total Number of Orders';
            FieldClass = FlowField;
            CalcFormula = count(PostedGudfoodOrderHeader);
        }
        field(4; "Number of Gudfood Items"; Integer)
        {
            Caption = 'Number of Gudfood Items';
            FieldClass = FlowField;
            CalcFormula = count(GudfoodItem);
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