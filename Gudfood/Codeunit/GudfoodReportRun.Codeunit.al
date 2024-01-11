codeunit 50101 "Gudfood Report Run"
{
    TableNo = "Gudfood Order Header";

    trigger OnRun()
    begin
        RunOrder(Rec);
    end;

    local procedure RunOrder(GudfoodOrderHeader: Record "Gudfood Order Header")
    var
        GudfoodOrderReport: Report "Gudfood Order Report";
        GudfoodOrderLine: Record "Gudfood Order Line";
    begin
        GudfoodOrderHeader.SetRange("No.", GudfoodOrderHeader."No.");
        GudfoodOrderReport.SetTableView(GudfoodOrderHeader);
        GudfoodOrderReport.Run();
    end;
}