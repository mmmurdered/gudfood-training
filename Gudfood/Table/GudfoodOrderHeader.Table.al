table 50101 "Gudfood Order Header"
{
    DataCaptionFields = "No.", "Sell-to Customer Name";
    Caption = 'Gudfood Order Header';

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "Posting No."; Code[20])
        {
            Caption = 'Posting No.';
        }
        field(10; "Sell-to Customer No."; Code[20])
        {
            Caption = 'Sell to Customer No.';
            TableRelation = Customer;
            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                if Customer.Get("Sell-to Customer No.") then
                    "Sell-to Customer Name" := Customer.Name
                else
                    Clear("Sell-to Customer Name");
            end;
        }
        field(11; "Sell-to Customer Name"; Text[100])
        {
            Caption = 'Sell-to Customer Name';
            Editable = false;
        }
        field(20; "Order Date"; Date)
        {
            Caption = 'Order Date';
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
            CalcFormula = sum("Gudfood Order Line".Quantity where("Order No." = field("No.")));
        }

        field(41; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Gudfood Order Line".Amount where("Order No." = field("No.")));
        }
        field(50; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
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
        Rec."Order Date" := Today;
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

    procedure AssistEdit(OldGudfoodOrderHeader: Record "Gudfood Order Header") Result: Boolean
    var
        IsHandled: Boolean;
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GudfoodOrderHeader: Record "Gudfood Order Header";
    begin
        GudfoodOrderHeader.Copy(Rec);
        SalesReceivablesSetup.Get();
        SalesReceivablesSetup.TestField(SalesReceivablesSetup."Gudfood Order Nos.");
        if NoSeriesMgt.SelectSeries(SalesReceivablesSetup."Gudfood Order Nos.", OldGudfoodOrderHeader."No. Series", GudfoodOrderHeader."No. Series") then begin
            NoSeriesMgt.SetSeries(GudfoodOrderHeader."No.");
            Rec := GudfoodOrderHeader;
            exit(true);
        end;
    end;
}