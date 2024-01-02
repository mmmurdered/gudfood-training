page 50106 PostedGudfoodOrder
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = PostedGudfoodOrderHeader;
    ModifyAllowed = true;

    layout
    {
        area(Content)
        {
            group(Header)
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
                field("Posting Date"; Rec."Posting Date")
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
            part(SalesLine; PostedGudfoodOrderSubpage)
            {
                Caption = 'Sales Line';
                ApplicationArea = all;
            }
        }
    }

}