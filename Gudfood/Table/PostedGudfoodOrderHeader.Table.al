table 50103 PostedGudfoodOrderHeader
{
    DataClassification = ToBeClassified;
    CaptionML = ENU = 'Posted Gudfood Order Header', UKR = 'Заголовок Опублікованого Замовлення Гудфуд';
    TableType = Normal;

    fields
    {
        field(1; "No."; Code[20])
        {
            CaptionML = UKR = 'Номер Замовлення', ENU = 'Order Number';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "Sell-to Customer No."; Code[20])
        {
            CaptionML = UKR = 'Продано клієнту за номером', ENU = 'Sell to Customer No.';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Sell-to Customer Name"; Text[100])
        {
            CaptionML = UKR = 'Продано клієнту за Іменем', ENU = 'Sell-to Customer Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(20; "Order Date"; Date)
        {
            CaptionML = UKR = 'Дата замовлення', ENU = 'Order Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(30; "Posting No."; Code[20])
        {
            CaptionML = UKR = 'Пост номер', ENU = 'Posting No.';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(31; "Posting Date"; Date)
        {
            CaptionML = UKR = 'Пост номер', ENU = 'Posting Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(40; "Date Created"; Date)
        {
            CaptionML = UKR = 'Дата створення', ENU = 'Date Created';
            Editable = false;
            DataClassification = ToBeClassified;
        }

        field(50; "Total Qty"; Decimal)
        {
            CaptionML = UKR = 'Загальна кількість', ENU = 'Total Quantity';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum(PostedGudfoodOrderline.Quantity where("Order No." = field("Posting No.")));
        }

        field(51; "Total Amount"; Decimal)
        {
            CaptionML = UKR = 'Загальна сума', ENU = 'Total Amount';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum(PostedGudfoodOrderline.Amount where("Order No." = field("Posting No.")));
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