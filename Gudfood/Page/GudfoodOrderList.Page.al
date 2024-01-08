page 50107 GudfoodOrderList
{
    CaptionML = ENU = 'Gudfood Order List', UKR = 'Гудфуд Список Замовлень';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = GudfoodOrderHeader;
    CardPageId = GudfoodOrder;
    ModifyAllowed = false;

    layout
    {
        area(Content)
        {
            repeater("Order Header")
            {
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = All;
                }
                field("Posting No."; Rec."Posting No.")
                {
                    ApplicationArea = All;
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = All;
                }
                field("Total Qty"; Rec."Total Qty")
                {
                    ApplicationArea = All;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
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