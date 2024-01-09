page 50105 PostedGudfoodOrderSubpage
{
    CaptionML = ENU = 'Posted Gudfood Order Subpage', UKR = 'Опублікована Підсторінка Замовлення Гудфуд';
    PageType = ListPart;
    ApplicationArea = All;
    Editable = false;
    SourceTable = PostedGudfoodOrderline;
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Order No."; Rec."Order No.")
                {

                }
                field("Line No."; Rec."Line No.")
                {

                }
                field("Sell-to Customer No."; Rec."Sell- to Customer No.")
                {

                }
                field("Date Created"; Rec."Date Created")
                {

                }
                field("Item No."; Rec."Item No.")
                {

                }
                field("Item Type"; Rec."Item Type")
                {

                }
                field("Description"; Rec.Description)
                {

                }
                field("Quantity"; Rec.Quantity)
                {

                }
                field("Unit Price"; Rec."Unit Price")
                {

                }
                field("Amount"; Rec.Amount)
                {

                }
            }
        }
    }
}