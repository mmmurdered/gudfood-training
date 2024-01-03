table 50101 GudfoodOrderHeader
{
    Caption = 'Gudfood Order Header';
    TableType = Normal;
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            CaptionML = UKR = 'Номер Замовлення', ENU = 'Order Number';
            DataClassification = ToBeClassified;
        }
        field(10; "Sell-to Customer No."; Code[20])
        {
            CaptionML = UKR = 'Продано клієнту за номером', ENU = 'Sell to Customer No.';
            TableRelation = Customer."No." where("No." = field("Sell-to Customer No."));
            DataClassification = ToBeClassified;

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
            DataClassification = ToBeClassified;
        }
        field(20; "Order Date"; Date)
        {
            CaptionML = UKR = 'Дата замовлення', ENU = 'Order Date';
            DataClassification = ToBeClassified;
        }
        //FUD-PSTD
        field(30; "Posting No."; Code[20])
        {
            CaptionML = UKR = 'Пост номер', ENU = 'Posting No.';
            DataClassification = ToBeClassified;
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
        //if "No." <> '' then begin
        Rec."No." := NoSeriesMgt.GetNextNo('FUD-ORD', Today, true);
        Rec."Posting No." := NoSeriesMgt.GetNextNo('FUD-PSTD', Today, true);
        Rec."Date Created" := Today;
        // end;
    end;
}