codeunit 50101 GudfoodOrderLineAutoincrement
{
    var
        LineNo: Integer;

    procedure GetNextLineNo(var NextLineNo: Integer; OrderNo: Code[20])
    var
        OrderLineRec: Record GudfoodOrderLine;
    begin
        OrderLineRec.SetRange("Order No.", OrderNo);

        if OrderLineRec.FindLast then begin
            LineNo := OrderLineRec."Line No."
        end
        else
            LineNo := 0;
        LineNo += 10000;
        NextLineNo := LineNo;
    end;
}