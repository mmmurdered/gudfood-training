table 50101 GudfoodOrderHeader
{
    CaptionML = ENU = 'Gudfood Order Header', UKR = 'Заголовок Замовлення Гудфуд';
    TableType = Normal;

    fields
    {
        field(1; "No."; Code[20])
        {
            CaptionML = UKR = 'Номер Замовлення', ENU = 'Order Number';
        }
        field(10; "Sell-to Customer No."; Code[20])
        {
            CaptionML = UKR = 'Продано клієнту за номером', ENU = 'Sell to Customer No.';
            TableRelation = Customer."No." where("No." = field("Sell-to Customer No."));

            trigger OnValidate()
            var
                Customer: Record Customer;
            begin

                if "Sell-to Customer No." <> '' then begin
                    Customer.get("Sell-to Customer No.");
                    "Sell-to Customer Name" := Customer.Name + ' ' + Customer."Name 2"
                end;
            end;
        }
        field(11; "Sell-to Customer Name"; Text[100])
        {
            CaptionML = UKR = 'Продано клієнту за Іменем', ENU = 'Sell-to Customer Name';
        }
        field(20; "Order Date"; Date)
        {
            CaptionML = UKR = 'Дата замовлення', ENU = 'Order Date';
        }
        //FUD-PSTD
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
            CalcFormula = sum(GudfoodOrderLine.Quantity where("Order No." = field("No.")));
        }

        field(51; "Total Amount"; Decimal)
        {
            CaptionML = UKR = 'Загальна сума', ENU = 'Total Amount';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum(GudfoodOrderLine.Amount where("Order No." = field("No.")));
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
        if "No." = '' then begin
            Rec."No." := NoSeriesMgt.GetNextNo('FUD-ORD', Today, true);
        end;

        if "Posting No." = '' then begin
            Rec."Posting No." := NoSeriesMgt.GetNextNo('FUD-PSTD', Today, true);
        end;
    end;
}