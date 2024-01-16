table 50103 "Posted Gudfood Order Header"
{
    //CaptionML = ENU = 'Posted Gudfood Order Header', UKR = 'Заголовок Опублікованого Замовлення Гудфуд';
    Caption = 'Posted Gudfood Order Header';

    fields
    {
        field(1; "No."; Code[20])
        {
            //CaptionML = UKR = 'Номер', ENU = 'No.';
            Caption = 'No.';
            Editable = false;
        }
        field(10; "Sell-to Customer No."; Code[20])
        {
            //CaptionML = UKR = 'Продано клієнту за номером', ENU = 'Sell to Customer No.';
            Caption = 'Sell to Customer No.';
            Editable = false;
            TableRelation = Customer."No.";
        }
        field(11; "Sell-to Customer Name"; Text[100])
        {
            //CaptionML = UKR = 'Продано клієнту за Іменем', ENU = 'Sell-to Customer Name';
            Caption = 'Sell-to Customer Name';
            Editable = false;
        }
        field(20; "Order Date"; Date)
        {
            //CaptionML = UKR = 'Дата замовлення', ENU = 'Order Date';
            Caption = 'Order Date';
            Editable = false;
        }
        field(21; "Posting Date"; Date)
        {
            //CaptionML = UKR = 'Дата обліку', ENU = 'Posting Date';
            Caption = 'Posting Date';
            Editable = false;
        }
        field(30; "Date Created"; Date)
        {
            //CaptionML = UKR = 'Дата створення', ENU = 'Date Created';
            Caption = 'Date Created';
            Editable = false;
        }

        field(40; "Total Qty"; Decimal)
        {
            // CaptionML = UKR = 'Загальна кількість', ENU = 'Total Quantity';
            Caption = 'Total Quantity';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Posted Gudfood Order Line".Quantity where("Order No." = field("No.")));
        }

        field(41; "Total Amount"; Decimal)
        {
            // CaptionML = UKR = 'Загальна сума', ENU = 'Total Amount';
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