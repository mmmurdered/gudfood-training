table 50104 PostedGudfoodOrderline
{
    CaptionML = UKR = 'Звітний Gudfood Рядок Замовлення', ENU = 'Posted Gudfood Order Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Order No."; Code[20])
        {
            CaptionML = UKR = 'Номер замовлення', ENU = 'Order No.';
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            CaptionML = UKR = 'Номер рядку', ENU = 'Line No.';
            Editable = false;
        }
        field(10; "Sell- to Customer No."; Code[20])
        {
            CaptionML = UKR = 'Номер клієнта', ENU = 'Sell- to Customer No.';
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(20; "Date Created"; Date)
        {
            CaptionML = UKR = 'Номер рядку', ENU = 'Line No.';
            Editable = false;
            DataClassification = ToBeClassified;

        }
        field(30; "Item No."; Code[20])
        {
            CaptionML = UKR = 'Номер товару', ENU = 'Item No.';
            TableRelation = GudfoodItem.Code where(Code = field("Item No."));
            Editable = false;
        }
        field(31; "Item Type"; Option)
        {
            CaptionML = UKR = 'Тип товару', ENU = 'Item Type';
            OptionMembers = " ","Salat","Burger","Capcake","Drink";
            Editable = false;
        }
        field(40; Description; Text[100])
        {
            CaptionML = UKR = 'Опис товару', ENU = 'Description';
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(50; Quantity; Decimal)
        {
            CaptionML = UKR = 'Кількість', ENU = 'Quantity';
            Editable = false;
        }
        field(60; "Unit Price"; Decimal)
        {
            CaptionML = UKR = 'Ціна за одиницю', ENU = 'Unit Price';
            Editable = false;
        }
        field(70; Amount; Decimal)
        {
            CaptionML = UKR = 'Кількість', ENU = 'Amount';
            Editable = false;
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