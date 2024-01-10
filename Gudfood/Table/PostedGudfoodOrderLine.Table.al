table 50104 "Posted Gudfood Order Line"
{
    CaptionML = UKR = 'Опублікований Рядок Замовлення Гудфуд', ENU = 'Posted Gudfood Order Line';

    fields
    {
        field(1; "Order No."; Code[20])
        {
            CaptionML = UKR = 'Номер замовлення', ENU = 'Order No.';
        }
        field(2; "Line No."; Integer)
        {
            CaptionML = UKR = 'Номер рядку', ENU = 'Line No.';
        }
        field(10; "Sell- to Customer No."; Code[20])
        {
            CaptionML = UKR = 'Номер клієнта', ENU = 'Sell- to Customer No.';
        }
        field(20; "Date Created"; Date)
        {
            CaptionML = UKR = 'Дата створення', ENU = 'Date created';

        }
        field(30; "Item No."; Code[20])
        {
            CaptionML = UKR = 'Номер товару', ENU = 'Item No.';
            TableRelation = "Gudfood Item".Code where(Code = field("Item No."));
        }
        field(31; "Item Type"; Option)
        {
            CaptionML = UKR = 'Тип товару', ENU = 'Item Type';
            OptionMembers = " ","Salat","Burger","Capcake","Drink";
            FieldClass = FlowField;
            CalcFormula = lookup("Gudfood Item".Type where(Code = field("Item No.")));
        }
        field(40; Description; Text[100])
        {
            CaptionML = UKR = 'Опис товару', ENU = 'Description';
        }
        field(50; Quantity; Decimal)
        {
            CaptionML = UKR = 'Кількість', ENU = 'Quantity';
        }
        field(60; "Unit Price"; Decimal)
        {
            CaptionML = UKR = 'Ціна за одиницю', ENU = 'Unit Price';
        }
        field(70; Amount; Decimal)
        {
            CaptionML = UKR = 'Кількість', ENU = 'Amount';
        }
    }

    keys
    {
        key(PK; "Order No.", "Line No.")
        {
            Clustered = true;
        }
    }
}