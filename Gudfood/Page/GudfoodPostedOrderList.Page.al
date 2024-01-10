page 50111 "Posted Gudfood Order List"
{
    CaptionML = ENU = 'Posted Gudfood Order List', UKR = 'Опубліковані Гудфуд Замовлення';
    PageType = List;
    UsageCategory = History;
    SourceTable = "Posted Gudfood Order Header";
    CardPageId = "Posted Gudfood Order";
    ApplicationArea = All;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater("Posted Orders")
            {
                field("Posted No."; Rec."Posting No.")
                {

                }
                field("Posted Date"; Rec."Posting Date")
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
}
