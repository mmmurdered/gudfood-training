page 50105 "Posted Gudfood Order Subpage"
{
    CaptionML = ENU = 'Posted Gudfood Order Subpage', UKR = 'Опублікована Підсторінка Замовлення Гудфуд';
    PageType = ListPart;
    ApplicationArea = All;
    Editable = false;
    SourceTable = "Posted Gudfood Order Line";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Line No."; Rec."Line No.")
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