table 50104 "Posted Gudfood Order Line"
{
    Caption = 'Posted Gudfood Order Line';

    fields
    {
        field(1; "Order No."; Code[20])
        {
            Caption = 'Order No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(10; "Sell- to Customer No."; Code[20])
        {
            Caption = 'Sell- to Customer No.';
        }
        field(20; "Date Created"; Date)
        {
            Caption = 'Date created';
        }
        field(30; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = "Gudfood Item".Code where(Code = field("Item No."));
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
        }
        field(50; Quantity; Decimal)
        {
            Caption = 'Quantity';
        }
        field(60; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
        }
        field(70; Amount; Decimal)
        {
            Caption = 'Amount';
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