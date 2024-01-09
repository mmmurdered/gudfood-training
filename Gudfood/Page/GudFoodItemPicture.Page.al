page 50102 GudfoodItemPicture
{
    CaptionML = ENU = 'Gudfood Item Picture', UKR = 'Гудфуд Зображення Товару';
    PageType = CardPart;
    ApplicationArea = All;
    SourceTable = GudfoodItem;

    layout
    {
        area(Content)
        {
            field(Picture; Rec.Picture)
            {
                ToolTipML = ENU = 'Picture of the item', UKR = 'Зображення товару';
            }
            field(Description; Rec.Description)
            {
            }
        }
    }
}