table 50103 "Posted Gudfood Order Header"
{
    CaptionML = ENU = 'Posted Gudfood Order Header', UKR = 'Заголовок Опублікованого Замовлення Гудфуд';

    fields
    {
        field(1; "No."; Code[20])
        {
            CaptionML = UKR = 'Номер Замовлення', ENU = 'Order Number';
            Editable = false;
        }
        field(10; "Sell-to Customer No."; Code[20])
        {
            CaptionML = UKR = 'Продано клієнту за номером', ENU = 'Sell to Customer No.';
            Editable = false;
            TableRelation = Customer."No.";
        }
        field(11; "Sell-to Customer Name"; Text[100])
        {
            CaptionML = UKR = 'Продано клієнту за Іменем', ENU = 'Sell-to Customer Name';
            Editable = false;
        }
        field(20; "Order Date"; Date)
        {
            CaptionML = UKR = 'Дата замовлення', ENU = 'Order Date';
            Editable = false;
        }

        field(30; "Posting No."; Code[20])
        {
            CaptionML = UKR = 'Пост номер', ENU = 'Posting No.';
            Editable = false;
        }
        field(31; "Posting Date"; Date)
        {
            CaptionML = UKR = 'Дата постингу', ENU = 'Posting Date';
            Editable = false;
        }
        field(40; "Date Created"; Date)
        {
            CaptionML = UKR = 'Дата створення', ENU = 'Date Created';
            Editable = false;
        }

        field(50; "Total Qty"; Decimal)
        {
            CaptionML = UKR = 'Загальна кількість', ENU = 'Total Quantity';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Posted Gudfood Order Line".Quantity where("Order No." = field("Posting No.")));
        }

        field(51; "Total Amount"; Decimal)
        {
            CaptionML = UKR = 'Загальна сума', ENU = 'Total Amount';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Posted Gudfood Order Line".Amount where("Order No." = field("Posting No.")));
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