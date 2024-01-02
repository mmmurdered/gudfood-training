page 50103 GudfoodOrderSubpage
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = GudfoodOrderLine;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Order No."; Rec."Order No.")
                {
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field("Sell-to Customer No."; Rec."Sell- to Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field("Item Type"; Rec."Item Type")
                {
                    ApplicationArea = All;
                }
                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Quantity"; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                }
                field("Amount"; Rec.Amount)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}