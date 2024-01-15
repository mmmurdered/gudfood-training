page 50104 "Gudfood Order"
{
    CaptionML = ENU = 'Gudfood Order', UKR = 'Гудфуд Замовлення';
    PageType = Document;
    ApplicationArea = All;
    SourceTable = "Gudfood Order Header";
    UsageCategory = Documents;

    layout
    {
        area(Content)
        {
            group(Header)
            {
                field("No."; Rec."No.")
                {
                    ToolTipML = ENU = 'Specified No of the Order, can be generated automatically',
                    UKR = 'Вказаний номер замовлення, може бути згенерований автоматично';
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ToolTipML = ENU = 'Specified Customer sell to of the Order', UKR = 'Вказаний клієнт замовлення';
                    ShowMandatory = true;
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ToolTipML = ENU = 'Specified Customer name', UKR = 'Вказані Креденціали клієнта';
                }
                field("Order Date"; Rec."Order Date")
                {
                    ToolTipML = ENU = 'Specified Order Date', UKR = 'Вказана Дату замовлення';
                }
                field("Posting No."; Rec."Posting No.")
                {
                    ToolTipML = ENU = 'Specified No of the Posted Order, can be generated automatically',
                    UKR = 'Номер публікації замовлення, може бути присвоєно автоматично';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ToolTipML = ENU = 'Specified Created Date', UKR = 'Вказана дата створення';
                }
                field("Total Qty"; Rec."Total Qty")
                {
                    ToolTipML = ENU = 'Specified Quantity of Order', UKR = 'Вказана загальна кількість замовлення';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ToolTipML = ENU = 'Specified Amount of Order', UKR = 'Вказана загальна сума замовлення';
                }
            }
            part(GudfoodOrderLine; "Gudfood Order Subpage")
            {
                UpdatePropagation = Both;
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
                RunObject = codeunit "Gudfood Order Post";
            }
        }
        area(Reporting)
        {
            action(Report)
            {
                CaptionML = ENU = 'Print Report', UKR = 'Надрукувати звіт';
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Image = Report;
                trigger OnAction()
                var
                    GudfoodOrderHeader: Record "Gudfood Order Header";
                begin
                    CurrPage.SetSelectionFilter(GudfoodOrderHeader);
                    Report.Run(Report::"Gudfood Order Report", true, false, GudfoodOrderHeader);
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
                    GudfoodOrderHeader: Record "Gudfood Order Header";
                begin
                    CurrPage.SetSelectionFilter(GudfoodOrderHeader);
                    Xmlport.Run(Xmlport::"Gudfood Order Export", true, false, Rec);
                end;
            }
        }
    }
}