page 50106 "Posted Gudfood Order"
{
    CaptionML = ENU = 'Posted Gudfood Order', UKR = 'Опубліковані Замовлення Гудфуд';
    PageType = Document;
    ApplicationArea = All;
    SourceTable = "Posted Gudfood Order Header";
    Editable = false;

    layout
    {
        area(Content)
        {
            group(Header)
            {
                field("No."; Rec."No.")
                {

                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {

                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {

                }
                field("Order Date"; Rec."Order Date")
                {

                }
                field("Posting Date"; Rec."Posting Date")
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
            part("Gudfood Order Line"; "Posted Gudfood Order Subpage")
            {
                SubPageLink = "Order No." = field("No.");
                CaptionML = ENU = 'Gudfood Sales Line', UKR = 'Гудфуд Лінії Продаж';
            }
        }
    }
}