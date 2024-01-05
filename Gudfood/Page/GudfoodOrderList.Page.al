page 50107 GudfoodOrderList
{
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
    trigger OnDeleteRecord(): Boolean
    var
        GudfoodOrderLine: Record GudfoodOrderLine;
    begin
        GudfoodOrderLine.SetFilter("Order No.", '=%1', Rec."No.");
        GudfoodOrderLine.FindSet(true);
        GudfoodOrderLine.DeleteAll(true);
    end;
}