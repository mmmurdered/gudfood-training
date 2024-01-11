codeunit 50104 "Gudfood XML Export"
{
    TableNo = "Gudfood Order Header";

    trigger OnRun()
    begin
        RunXMLExport(Rec);
    end;

    local procedure RunXMLExport(GudfoodOrderHeader: Record "Gudfood Order Header")
    var
        GudfoodOrderExport: XmlPort "Gudfood Order Export";
        GudfoodOrderLine: Record "Gudfood Order Line";
    begin
        GudfoodOrderHeader.SetRange("No.", GudfoodOrderHeader."No.");
        GudfoodOrderExport.SetTableView(GudfoodOrderHeader);
        GudfoodOrderExport.Run();
    end;
}