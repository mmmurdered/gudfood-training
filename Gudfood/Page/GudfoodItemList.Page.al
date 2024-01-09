page 50100 GudfoodItemList
{
    CaptionML = UKR = 'Гудфут список товарів', ENU = 'Gudfood Item List';
    UsageCategory = Lists;
    CardPageId = 50101;
    PageType = List;
    SourceTable = GudfoodItem;
    ModifyAllowed = false;
    InsertAllowed = true;
    DeleteAllowed = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {
                    ToolTipML = ENU = 'Сode of the item', UKR = 'Код товару';
                    ApplicationArea = All;

                }
                field(Description; Rec.Description)
                {
                    ToolTipML = ENU = 'Description of the item', UKR = 'Опис товару';
                    ApplicationArea = All;

                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTipML = ENU = 'Unit Price of the item', UKR = 'Ціна за одиницю товару';
                    ApplicationArea = All;

                }
                field(Type; Rec.Type)
                {
                    ToolTipML = ENU = 'Type of the item', UKR = 'Тип товару';
                    ApplicationArea = All;

                }
                field("Qty. Ordered"; Rec."Qty. Ordered")
                {
                    ToolTipML = ENU = 'Quantity Ordered', UKR = 'Кількість замовлених';
                    ApplicationArea = All;

                }
                field("Qty. in Order"; Rec."Qty. in Order")
                {
                    ToolTipML = ENU = 'Quantity in Order', UKR = 'Кількість в замовленні';
                    ApplicationArea = All;

                }
                field("Shelf Life"; Rec."Shelf Life")
                {
                    ToolTipML = ENU = 'Shelf Life of the item', UKR = 'Срок придатності товару';
                    ApplicationArea = All;

                }
            }
        }
        area(FactBoxes)
        {
            part(Picture; GudfoodItemPicture)
            {
                SubPageLink = Code = field(Code);
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }
}