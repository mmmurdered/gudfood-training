codeunit 50103 GudfoodHeadlineText
{
    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;

    procedure GetMaxTotalAmount(): Text[250]
    var
        PostedGudfoodOrders: Record PostedGudfoodOrderHeader;
        TotalAmount: Decimal;
    begin
        PostedGudfoodOrders.SetCurrentKey("Total Amount");
        PostedGudfoodOrders.FindLast();
        exit('Maximum total amount of order is: ' + Format(PostedGudfoodOrders."Total Amount"));
    end;
}