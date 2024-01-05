table 50100 GudfoodItem
{
    CaptionML = UKR = 'Gudfood товар', ENU = 'Goodfud Item';
    TableType = Normal;
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Code; Code[20])
        {
            CaptionML = UKR = 'Код', ENU = 'Code';
            DataClassification = ToBeClassified;
        }

        field(10; Description; Text[100])
        {
            CaptionML = UKR = 'Опис', ENU = 'Description';
            DataClassification = ToBeClassified;

        }

        field(20; "Unit Price"; Decimal)
        {
            CaptionML = UKR = 'Ціна за одиницю', ENU = 'Unit Price';
            DataClassification = ToBeClassified;

        }

        field(30; Type; Option)
        {
            CaptionML = UKR = 'Тип товару', ENU = 'Item Type';
            OptionMembers = " ","Salat","Burger","Capcake","Drink";
        }

        field(40; "Qty. Ordered"; Decimal)
        {
            CaptionML = UKR = 'Кількість замовлених', ENU = 'Quantity Ordered';
            FieldClass = FlowField;
            CalcFormula = sum(PostedGudfoodOrderline.Quantity where("Item No." = field(Code)));
        }

        field(41; "Qty. in Order"; Decimal)
        {
            CaptionML = UKR = 'Кількість активних замовлень', ENU = 'Quantity in Order';
            FieldClass = FlowField;
            CalcFormula = sum(GudfoodOrderLine.Quantity where("Item No." = field(Code)));
        }

        field(50; "Shelf Life"; Date)
        {
            CaptionML = UKR = 'Термін придатності', ENU = 'Shelf Life';
            DataClassification = ToBeClassified;

        }

        field(60; Picture; MediaSet)
        {
            CaptionML = UKR = 'Зображення', ENU = 'Picture';
            DataClassification = ToBeClassified;

        }

    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

    var
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit "NoSeriesManagement";

    trigger OnInsert()
    begin
        if Code = '' then begin
            SalesReceivablesSetup.GET;
            Code := NoSeriesMgt.GetNextNo('FUD', WorkDate(), true);
        end;
    end;
}