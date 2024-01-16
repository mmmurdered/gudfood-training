page 50100 "Gudfood Item List"
{
    Caption = 'Gudfood Item List';
    //CaptionML = UKR = 'Гудфут список товарів', ENU = 'Gudfood Item List';
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
                    ToolTip = 'Сode of the item';
                    //ToolTipML = ENU = 'Сode of the item', UKR = 'Код товару';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Description of the item';
                    //ToolTipML = ENU = 'Description of the item', UKR = 'Опис товару';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    //ToolTipML = ENU = 'Unit Price of the item', UKR = 'Ціна за одиницю товару';
                    ToolTip = 'Unit Price of the item';
                }
                field(Type; Rec.Type)
                {
                    //ToolTipML = ENU = 'Type of the item', UKR = 'Тип товару';
                    ToolTip = 'Type of the item';
                }
                field("Qty. Ordered"; Rec."Qty. Ordered")
                {
                    //ToolTipML = ENU = 'Quantity Ordered', UKR = 'Кількість замовлених';
                    ToolTip = 'Quantity Ordered';
                }
                field("Qty. in Order"; Rec."Qty. in Order")
                {
                    //ToolTipML = ENU = 'Quantity in Order', UKR = 'Кількість в замовленні';
                    ToolTip = 'Quantity in Order';
                }
                field("Shelf Life"; Rec."Shelf Life")
                {
                    //ToolTipML = ENU = 'Shelf Life of the item', UKR = 'Срок придатності товару';
                    ToolTip = 'Shelf Life of the item';
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