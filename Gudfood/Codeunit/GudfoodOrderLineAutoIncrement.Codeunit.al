codeunit 50101 GudfoodOrderLineAutoincrement
{
    var
        LineNo: Integer;

    procedure GetNextLineNo(var NextLineNo: Integer; OrderNo: Code[20])
    var
        OrderLineRec: Record GudfoodOrderLine;
    begin
        // Initialize the record variable
        OrderLineRec.SetRange("Order No.", OrderNo);

        // Find the last line number for the specified order
        if OrderLineRec.FindLast then begin
            LineNo := OrderLineRec."Line No."
        end else
            LineNo := 10000;

        // Increment Line No.
        LineNo += 10000;

        // Return the next Line No.
        NextLineNo := LineNo;
    end;
}