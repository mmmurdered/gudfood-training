table 50100 "Gudfood Item"
{
    DataCaptionFields = Code, Type;
    Caption = 'Goodfud Item';

    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
        }

        field(10; Description; Text[100])
        {
            Caption = 'Description';
        }

        field(20; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
        }

        field(30; Type; Enum "Gudfood Item Type")
        {
            Caption = 'Item Type';
        }

        field(40; "Qty. Ordered"; Decimal)
        {
            Caption = 'Quantity Ordered';
            FieldClass = FlowField;
            CalcFormula = sum("Posted Gudfood Order Line".Quantity where("Item No." = field(Code)));
        }

        field(41; "Qty. in Order"; Decimal)
        {
            Caption = 'Quantity in Order';
            FieldClass = FlowField;
            CalcFormula = sum("Gudfood Order Line".Quantity where("Item No." = field(Code)));
        }

        field(50; "Shelf Life"; Date)
        {
            Caption = 'Shelf Life';

        }

        field(60; Picture; Media)
        {
            Caption = 'Picture';
        }

    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit "NoSeriesManagement";
    begin
        SalesReceivablesSetup.Get();
        if Rec.Code = '' then begin
            SalesReceivablesSetup.TestField(SalesReceivablesSetup."Gudfood Item Nos.");
            Rec.Code := NoSeriesMgt.GetNextNo(SalesReceivablesSetup."Gudfood Item Nos.", Today, true);
        end;
    end;

    trigger OnDelete()
    var
        GudfoodOrderLine: Record "Gudfood Order Line";
        ErrorWhileDeleting: Label 'Cannot delete, item is on open orders';
    begin
        GudfoodOrderLine.SetRange("Item No.", Rec.Code);
        if not GudfoodOrderLine.IsEmpty then
            Error(ErrorWhileDeleting);
    end;
}