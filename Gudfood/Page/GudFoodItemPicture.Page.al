page 50102 "Gudfood Item Picture"
{
    CaptionML = ENU = 'Gudfood Item Picture', UKR = 'Гудфуд Зображення Товару';
    PageType = CardPart;
    ApplicationArea = All;
    SourceTable = "Gudfood Item";

    layout
    {
        area(Content)
        {
            field(Picture; Rec.Picture)
            {
                ToolTipML = ENU = 'Picture of the item', UKR = 'Зображення товару';
            }
        }
    }
}