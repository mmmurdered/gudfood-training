page 50100 "Gudfood Item List"
{
    CaptionML = UKR = 'Гудфут список товарів', ENU = 'Gudfood Item List';
    UsageCategory = Lists;
    CardPageId = "Gudfood Item Card";
    PageType = List;
    SourceTable = "Gudfood Item";
    ApplicationArea = All;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {
                    ToolTipML = ENU = 'Сode of the item', UKR = 'Код товару';
                }
                field(Description; Rec.Description)
                {
                    ToolTipML = ENU = 'Description of the item', UKR = 'Опис товару';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTipML = ENU = 'Unit Price of the item', UKR = 'Ціна за одиницю товару';

                }
                field(Type; Rec.Type)
                {
                    ToolTipML = ENU = 'Type of the item', UKR = 'Тип товару';

                }
                field("Qty. Ordered"; Rec."Qty. Ordered")
                {
                    ToolTipML = ENU = 'Quantity Ordered', UKR = 'Кількість замовлених';

                }
                field("Qty. in Order"; Rec."Qty. in Order")
                {
                    ToolTipML = ENU = 'Quantity in Order', UKR = 'Кількість в замовленні';

                }
                field("Shelf Life"; Rec."Shelf Life")
                {
                    ToolTipML = ENU = 'Shelf Life of the item', UKR = 'Срок придатності товару';
                }
            }
        }
        area(FactBoxes)
        {
            part(Picture; "Gudfood Item Picture FB")
            {
                SubPageLink = Code = field(Code);
            }
        }
    }
}