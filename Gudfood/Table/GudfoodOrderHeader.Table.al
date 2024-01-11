table 50101 "Gudfood Order Header"
{
    CaptionML = ENU = 'Gudfood Order Header', UKR = 'Заголовок Замовлення Гудфуд';

    fields
    {
        field(1; "No."; Code[20])
        {
            CaptionML = UKR = 'Номер Замовлення', ENU = 'Order Number';
        }
        field(10; "Sell-to Customer No."; Code[20])
        {
            CaptionML = UKR = 'Продано клієнту за номером', ENU = 'Sell to Customer No.';
            TableRelation = Customer;
            NotBlank = true;
            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                if Customer.Get("Sell-to Customer No.") then
                    "Sell-to Customer Name" := Customer.Name;
            end;
        }
        field(11; "Sell-to Customer Name"; Text[100])
        {
            CaptionML = UKR = 'Продано клієнту за Іменем', ENU = 'Sell-to Customer Name';
            Editable = false;
        }
        field(20; "Order Date"; Date)
        {
            CaptionML = UKR = 'Дата замовлення', ENU = 'Order Date';
        }

        field(30; "Posting No."; Code[20])
        {
            CaptionML = UKR = 'Пост номер', ENU = 'Posting No.';
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
            CalcFormula = sum("Gudfood Order Line".Quantity where("Order No." = field("No.")));
        }

        field(51; "Total Amount"; Decimal)
        {
            CaptionML = UKR = 'Загальна сума', ENU = 'Total Amount';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Gudfood Order Line".Amount where("Order No." = field("No.")));
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        Rec."Date Created" := Today;
        if "No." = '' then
            Rec."No." := NoSeriesMgt.GetNextNo('FUD-ORD', Today, true);

        if "Posting No." = '' then
            Rec."Posting No." := NoSeriesMgt.GetNextNo('FUD-PSTD', Today, true);
    end;

    trigger OnDelete()
    var
        GudfoodOrderLine: Record "Gudfood Order Line";
    begin
        GudfoodOrderLine.SetFilter("Order No.", Rec."No.");
        if GudfoodOrderLine.FindSet(true) then
            GudfoodOrderLine.DeleteAll(true);
    end;
}