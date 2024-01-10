page 50107 "Gudfood Order List"
{
    CaptionML = ENU = 'Gudfood Order List', UKR = 'Гудфуд Список Замовлень';
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "Gudfood Order Header";
    CardPageId = "Gudfood Order";
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
            action(Post)
            {
                CaptionML = ENU = 'Post', UKR = 'Опублікувати';
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Image = Post;
                RunObject = codeunit "Gudfood Order Post";
            }
            action(ExportOrder)
            {
                CaptionML = ENU = 'Export to XML', UKR = 'Експортувати в XML';
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Image = XMLFile;
                trigger OnAction()
                begin
                    CurrPage.SetSelectionFilter(Rec);
                    Xmlport.Run(Xmlport::"Gudfood Order Export", false, false, Rec);
                end;
            }
        }
    }
}