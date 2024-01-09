page 50106 PostedGudfoodOrder
{
    CaptionML = ENU = 'Posted Gudfood Order', UKR = 'Опубліковані Замовлення Гудфуд';
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = PostedGudfoodOrderHeader;
    Editable = false;

    layout
    {
        area(Content)
        {
            group(Header)
            {
                repeater(OrderRepeater)
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
            }
            part(SalesLine; PostedGudfoodOrderSubpage)
            {
                SubPageLink = "Order No." = field("No.");
                Caption = 'Sales Line';

            }
        }
    }
}