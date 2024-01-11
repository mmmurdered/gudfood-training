table 50102 "Gudfood Order Line"
{
    CaptionML = UKR = 'Gudfood Рядок Замовлення', ENU = 'Gudfood Order Line';

    fields
    {
        field(1; "Order No."; Code[20])
        {
            CaptionML = UKR = 'Номер замовлення', ENU = 'Order No.';
            //TableRelation = "Gudfood Order Header"; BECAUSE OF ERROR, QUESTION ON MEETING!!!
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
            TableRelation = Customer;
        }
        field(20; "Date Created"; Date)
        {
            CaptionML = UKR = 'Дата створення', ENU = 'Date Created';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Gudfood Order Header"."Date Created" where("No." = field("Order No.")));
        }
        field(30; "Item No."; Code[20])
        {
            CaptionML = UKR = 'Номер товару', ENU = 'Item No.';
            TableRelation = "Gudfood Item".Code;
            NotBlank = true;

            trigger OnValidate()
            var
                NotFoundMessage: Label 'Not found specified gudfood item';
                ShelfDateExpired: Label 'Shelf date is expired, please choose another item';
            begin
                if GudfoodItem.Get("Item No.") then begin
                    if GudfoodItem."Shelf Life" < Today then
                        Message(ShelfDateExpired);
                    Description := GudfoodItem.Description;
                    "Unit Price" := GudfoodItem."Unit Price";
                    "Item Type" := GudfoodItem.Type;
                end;
            end;
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
            Editable = false;

        }
        field(50; Quantity; Decimal)
        {
            CaptionML = UKR = 'Кількість', ENU = 'Quantity';
            MinValue = 0;
            NotBlank = true;
            trigger OnValidate()
            begin
                UpdateAmount();
            end;
        }
        field(60; "Unit Price"; Decimal)
        {
            CaptionML = UKR = 'Ціна за одиницю', ENU = 'Unit Price';

            trigger OnValidate()
            begin
                UpdateAmount();
            end;
        }
        field(70; Amount; Decimal)
        {
            CaptionML = UKR = 'Сума', ENU = 'Amount';
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
        GudfoodItem: Record "Gudfood Item";
        GudfoodOrderHeader: Record "Gudfood Order Header";

    trigger OnInsert();
    begin
        if GudfoodOrderHeader.Get("Order No.") then begin
            "Order No." := GudfoodOrderHeader."No.";
            "Sell- to Customer No." := GudfoodOrderHeader."Sell-to Customer No.";
            "Date Created" := GudfoodOrderHeader."Date Created";
        end;
    end;

    local procedure UpdateAmount()
    begin
        Amount := Quantity * "Unit Price";
    end;
}