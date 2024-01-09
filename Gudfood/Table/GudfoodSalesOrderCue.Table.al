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
            CaptionML = ENU = 'Current Number of Orders', UKR = 'Поточна кількість замовлень';
            FieldClass = FlowField;
            CalcFormula = count(GudfoodOrderHeader);
        }
        field(3; "Total Number of Orders"; Integer)
        {
            CaptionML = ENU = 'Total Number of Orders', UKR = 'Загальна кількість замовлень';
            FieldClass = FlowField;
            CalcFormula = count(PostedGudfoodOrderHeader);
        }
        field(4; "Number of Gudfood Items"; Integer)
        {
            CaptionML = ENU = 'Number of Gudfood Items', UKR = 'Кількість товарів Гудфуд';
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