table 50102 GudfoodOrderLine
{
    CaptionML = UKR = 'Gudfood Рядок Замовлення', ENU = 'Gudfood Order Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Order No."; Code[20])
        {
            CaptionML = UKR = 'Номер замовлення', ENU = 'Order No.';
            TableRelation = GudfoodOrderHeader;
        }
        field(2; "Line No."; Integer)
        {
            CaptionML = UKR = 'Номер рядку', ENU = 'Line No.';
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(10; "Sell- to Customer No."; Code[20])
        {
            CaptionML = UKR = 'Номер клієнта', ENU = 'Sell- to Customer No.';
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(20; "Date Created"; Date)
        {
            CaptionML = UKR = 'Дата створення', ENU = 'Date Created';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(GudfoodOrderHeader."Date Created" where("No." = field("Order No.")));
        }
        field(30; "Item No."; Code[20])
        {
            CaptionML = UKR = 'Номер товару', ENU = 'Item No.';
            TableRelation = GudfoodItem.Code where(Code = field("Item No."));
            NotBlank = true;

            trigger OnValidate()
            begin
                if "Item No." <> '' then begin
                    GudfoodItem.Get("Item No.");
                    Description := GudfoodItem.Description;
                    "Unit Price" := GudfoodItem."Unit Price";
                    "Item Type" := GudfoodItem.Type;
                    Amount := Quantity * "Unit Price";
                    if GudfoodItem."Shelf Life" < Today then
                        Message(ShelfDateExpired);
                end;
            end;
        }
        field(31; "Item Type"; Option)
        {
            CaptionML = UKR = 'Тип товару', ENU = 'Item Type';
            OptionMembers = " ","Salat","Burger","Capcake","Drink";
            FieldClass = FlowField;
            CalcFormula = lookup(GudfoodItem.Type where(Code = field("Item No.")));
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
            MinValue = 0;
            NotBlank = true;
            trigger OnValidate()
            begin
                Amount := Quantity * "Unit Price";
            end;
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

    var
        GudfoodItem: Record GudfoodItem;
        GudfoodOrderHeader: Record GudfoodOrderHeader;
        ShelfDateExpired: Label 'Shelf date is expired, please choose another item';
        GudfoodOrderLineAutoIncrement: Codeunit GudfoodOrderLineAutoincrement;

    trigger OnInsert();
    begin
        GudfoodOrderLineAutoIncrement.GetNextLineNo("Line No.", Rec."Order No.");
        GudfoodOrderHeader.Get("Order No.");
        "Sell- to Customer No." := GudfoodOrderHeader."Sell-to Customer No.";
        "Date Created" := GudfoodOrderHeader."Date Created";
    end;
}