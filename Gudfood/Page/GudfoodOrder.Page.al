page 50104 GudfoodOrder
{
    CaptionML = ENU = 'Gudfood Order', UKR = 'Гудфуд Замовлення';
    PageType = Document;
    ApplicationArea = All;
    SourceTable = GudfoodOrderHeader;
    UsageCategory = Documents;
    ModifyAllowed = false;
    InsertAllowed = true;
    DeleteAllowed = true;

    layout
    {
        area(Content)
        {
            group(Header)
            {
                field("No."; Rec."No.")
                {
                    ToolTipML = ENU = 'Input No of the Order or it will inserted manually',
                    UKR = 'Введіть номер замовлення вручну, або воно буде присвоєно автоматично';
                    ApplicationArea = All;
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ToolTipML = ENU = 'Choose Customer sell to of the Order', UKR = 'Оберіть клієнта замовлення';
                    ApplicationArea = All;
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ToolTipML = ENU = 'Customer name is not editable', UKR = 'Креденціали клієнта не радугуються';
                    ApplicationArea = All;
                }
                field("Order Date"; Rec."Order Date")
                {
                    ToolTipML = ENU = 'Input Order Date', UKR = 'Введіть Дату замовлення';
                    ApplicationArea = All;
                }
                field("Posting No."; Rec."Posting No.")
                {
                    ToolTipML = ENU = 'Input No of the Posted Order or it will inserted manually',
                    UKR = 'Введіть номер публікації замовлення вручну, або воно буде присвоєно автоматично';
                    ApplicationArea = All;
                }
                field("Date Created"; Rec."Date Created")
                {
                    ToolTipML = ENU = 'Date Created is not editable', UKR = 'Дата створення не радугується';
                    ApplicationArea = All;
                }
                field("Total Qty"; Rec."Total Qty")
                {
                    ToolTipML = ENU = 'Total Quantity of Order', UKR = 'Загальна кількість замовлення';
                    ApplicationArea = All;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ToolTipML = ENU = 'Total Amount of Order', UKR = 'Загальна сума замовлення';
                    ApplicationArea = All;
                }
            }
            part(SalesLine; GudfoodOrderSubpage)
            {
                UpdatePropagation = Both;
                ApplicationArea = all;
                SubPageLink = "Order No." = field("No.");
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Post)
            {
                CaptionML = ENU = 'Post', UKR = 'Опублікувати';
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Image = Post;
                trigger OnAction()
                begin
                    OrderPostCodeunit.PostOrder(Rec);
                end;
            }
            action(Report)
            {
                CaptionML = ENU = 'Print Report', UKR = 'Надрукувати звіт';
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Image = Report;
                trigger OnAction()
                var
                    GudfoodOrderReport: Report GudfoodOrderReport;
                    GudfoodOrderHeader: Record GudfoodOrderHeader;
                begin
                    GudfoodOrderHeader.SetCurrentKey("No.");
                    GudfoodOrderHeader.SetRange("No.", Rec."No.");
                    GudfoodOrderReport.SetTableView(GudfoodOrderHeader);
                    GudfoodOrderReport.Run();
                end;
            }
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
                begin
                    GudfoodOrderHeader.SetCurrentKey("No.");
                    GudfoodOrderHeader.SetRange("No.", Rec."No.");
                    GudfoodExportOrder.SetTableView(GudfoodOrderHeader);
                    GudfoodExportOrder.Run();
                end;
            }
        }
    }

    var
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit "NoSeriesManagement";
        OrderPostCodeunit: Codeunit GudfoodOrderPost;

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