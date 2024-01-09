page 50107 GudfoodOrderList
{
    CaptionML = ENU = 'Gudfood Order List', UKR = 'Гудфуд Список Замовлень';
    PageType = List;
    UsageCategory = Lists;
    SourceTable = GudfoodOrderHeader;
    CardPageId = GudfoodOrder;
    ModifyAllowed = false;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater("Order Header")
            {
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                }
                field("Order Date"; Rec."Order Date")
                {
                }
                field("Posting No."; Rec."Posting No.")
                {
                }
                field("Date Created"; Rec."Date Created")
                {
                }
                field("Total Qty"; Rec."Total Qty")
                {
                }
                field("Total Amount"; Rec."Total Amount")
                {
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ExportOrder)
            {
                CaptionML = ENU = 'Export to XML', UKR = 'Експортувати в XML';
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Image = XMLFile;
                trigger OnAction()
                var
                    GudfoodExportOrder: XmlPort GudfoodOrderExport;
                    GudfoodOrderHeader: Record GudfoodOrderHeader;
                    GudfoodOrderLine: Record GudfoodOrderLine;
                begin
                    CurrPage.SetSelectionFilter(Rec);
                    Xmlport.Run(Xmlport::GudfoodOrderExport, false, false, Rec);
                    //GudfoodExportOrder.Run();
                end;
            }
        }
    }

    trigger OnDeleteRecord(): Boolean
    var
        GudfoodOrderLine: Record GudfoodOrderLine;
    begin
        GudfoodOrderLine.SetFilter("Order No.", Rec."No.");
        if GudfoodOrderLine.FindSet(true) then begin
            GudfoodOrderLine.DeleteAll(true);
        end;
    end;
}