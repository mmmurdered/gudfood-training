table 50103 "Posted Gudfood Order Header"
{
    DataCaptionFields = "No.", "Sell-to Customer Name";
    Caption = 'Posted Gudfood Order Header';

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            Editable = false;
        }
        field(10; "Sell-to Customer No."; Code[20])
        {
            Caption = 'Sell to Customer No.';
            Editable = false;
            TableRelation = Customer."No.";
        }
        field(11; "Sell-to Customer Name"; Text[100])
        {
            Caption = 'Sell-to Customer Name';
            Editable = false;
        }
        field(20; "Order Date"; Date)
        {
            Caption = 'Order Date';
            Editable = false;
        }
        field(21; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            Editable = false;
        }
        field(30; "Date Created"; Date)
        {
            Caption = 'Date Created';
            Editable = false;
        }

        field(40; "Total Qty"; Decimal)
        {
            Caption = 'Total Quantity';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Posted Gudfood Order Line".Quantity where("Order No." = field("No.")));
        }

        field(41; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Posted Gudfood Order Line".Amount where("Order No." = field("No.")));
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}