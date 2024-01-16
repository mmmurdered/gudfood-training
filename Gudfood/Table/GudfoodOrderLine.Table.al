table 50102 "Gudfood Order Line"
{
    Caption = 'Gudfood Order Line';

    fields
    {
        field(1; "Order No."; Code[20])
        {
            Caption = 'Order No.';
            TableRelation = "Gudfood Order Header";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            Editable = false;
        }
        field(10; "Sell- to Customer No."; Code[20])
        {
            Caption = 'Sell- to Customer No.';
            Editable = false;
            TableRelation = Customer;
        }
        field(20; "Date Created"; Date)
        {
            Caption = 'Date Created';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Gudfood Order Header"."Date Created" where("No." = field("Order No.")));
        }
        field(30; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = "Gudfood Item".Code;

            trigger OnValidate()
            var
                NotFoundMessage: Label 'Not found specified gudfood item';
                ShelfDateExpired: Label 'Shelf date is expired, please choose another item';
            begin
                if GudfoodItem.Get("Item No.") then begin
                    if GudfoodItem."Shelf Life" < Today then
                        Message(ShelfDateExpired);
                    Rec.Description := GudfoodItem.Description;
                    Rec.Validate("Unit Price", GudfoodItem."Unit Price");
                    Rec."Item Type" := GudfoodItem.Type;
                end else begin
                    Rec.Validate("Unit Price", 0);
                    Clear(Rec.Description);
                    Clear(Rec."Item Type");
                end;
            end;
        }
        field(31; "Item Type"; Enum "Gudfood Item Type")
        {
            Caption = 'Item Type';
            FieldClass = FlowField;
            CalcFormula = lookup("Gudfood Item".Type where(Code = field("Item No.")));
        }
        field(40; Description; Text[100])
        {
            Caption = 'Description';
            Editable = false;

        }
        field(50; Quantity; Decimal)
        {
            Caption = 'Quantity';
            MinValue = 0;
            NotBlank = true;
            trigger OnValidate()
            begin
                UpdateAmount();
            end;
        }
        field(60; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';

            trigger OnValidate()
            begin
                UpdateAmount();
            end;
        }
        field(70; Amount; Decimal)
        {
            Caption = 'Amount';
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

    trigger OnInsert();
    begin
        if GudfoodOrderHeader.Get("Order No.") then begin
            Rec."Sell- to Customer No." := GudfoodOrderHeader."Sell-to Customer No.";
            Rec."Date Created" := GudfoodOrderHeader."Date Created";
        end;
    end;

    local procedure UpdateAmount()
    begin
        Rec.Amount := Rec.Quantity * Rec."Unit Price";
    end;

    var
        GudfoodItem: Record "Gudfood Item";
        GudfoodOrderHeader: Record "Gudfood Order Header";
}