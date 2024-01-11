page 50103 "Gudfood Order Subpage"
{
    CaptionML = ENU = 'Gudfood Order Subpage', UKR = 'Гудфуд Підсторінка Замовлення';
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = "Gudfood Order Line";
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Order No."; Rec."Order No.")
                {
                    Visible = false;
                }
                field("Line No."; Rec."Line No.")
                {

                }
                field("Sell-to Customer No."; Rec."Sell- to Customer No.")
                {
                    Visible = false;

                }
                field("Date Created"; Rec."Date Created")
                {
                    Visible = false;

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
                    trigger OnValidate()
                    begin
                        CurrPage.Update(true);
                    end;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    trigger OnValidate()
                    begin
                        CurrPage.Update(true);
                    end;
                }
                field("Amount"; Rec.Amount)
                {

                }
            }
        }
    }
}