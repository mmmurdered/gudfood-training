table 50101 "Gudfood Order Header"
{
    CaptionML = ENU = 'Gudfood Order Header', UKR = 'Заголовок Замовлення Гудфуд';

    fields
    {
        field(1; "No."; Code[20])
        {
            CaptionML = UKR = 'Номер', ENU = 'No.';
        }
        field(2; "Posting No."; Code[20])
        {
            CaptionML = UKR = 'Облікований номер', ENU = 'Posting No.';
        }
        field(10; "Sell-to Customer No."; Code[20])
        {
            CaptionML = UKR = 'Продано клієнту за номером', ENU = 'Sell to Customer No.';
            TableRelation = Customer;
            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                if Customer.Get("Sell-to Customer No.") then
                    "Sell-to Customer Name" := Customer.Name
                else
                    "Sell-to Customer Name" := '';
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
        field(30; "Date Created"; Date)
        {
            CaptionML = UKR = 'Дата створення', ENU = 'Date Created';
            Editable = false;
        }

        field(40; "Total Qty"; Decimal)
        {
            CaptionML = UKR = 'Загальна кількість', ENU = 'Total Quantity';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Gudfood Order Line".Quantity where("Order No." = field("No.")));
        }

        field(41; "Total Amount"; Decimal)
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
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
    begin
        SalesReceivablesSetup.Get();
        Rec."Date Created" := Today;
        if "No." = '' then begin
            SalesReceivablesSetup.TestField(SalesReceivablesSetup."Gudfood Order Nos.");
            Rec."No." := NoSeriesMgt.GetNextNo(SalesReceivablesSetup."Gudfood Order Nos.", Today, true);
        end;

        if "Posting No." = '' then begin
            SalesReceivablesSetup.TestField(SalesReceivablesSetup."Gudfood Posted Order Nos.");
            Rec."Posting No." := NoSeriesMgt.GetNextNo(SalesReceivablesSetup."Gudfood Posted Order Nos.", Today, true);
        end;
    end;

    trigger OnDelete()
    var
        GudfoodOrderLine: Record "Gudfood Order Line";
    begin
        GudfoodOrderLine.SetFilter("Order No.", Rec."No.");
        if GudfoodOrderLine.FindSet() then
            GudfoodOrderLine.DeleteAll(false);
    end;
}