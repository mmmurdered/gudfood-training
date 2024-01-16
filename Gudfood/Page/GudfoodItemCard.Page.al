page 50101 "Gudfood Item Card"
{
    //CaptionML = UKR = 'Гудфуд картка товару', ENU = 'Gudfood Item Card';
    Caption = 'Gudfood Item Card';
    PageType = Card;
    SourceTable = "Gudfood Item";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Code; Rec.Code)
                {
                    //ToolTipML = ENU = 'Specified code of the item', UKR = 'Вказаний код товару';
                    ToolTip = 'Specified code of the item';
                }
                field(Description; Rec.Description)
                {
                    //ToolTipML = ENU = 'Specified description of the item', UKR = 'Вказаний опис товару';
                    ToolTip = 'Specified description of the item';
                    ShowMandatory = true;
                    NotBlank = true;

                }
                field(Type; Rec.Type)
                {
                    //ToolTipML = ENU = 'Specified type of the item', UKR = 'Вказаний тип товару';
                    ToolTip = 'Specified type of the item';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    //ToolTipML = ENU = 'Specified unit price of the item', UKR = 'Вказана ціну за одиницю товару';
                    ToolTip = 'Specified unit price of the item';
                    ShowMandatory = true;
                    NotBlank = true;
                }
                field("Shelf Life"; Rec."Shelf Life")
                {
                    //ToolTipML = ENU = 'Specified Shelf Life of the item', UKR = 'Вказаний срок придатності товару';
                    ToolTip = 'Specified Shelf Life of the item';
                }
            }
            group("Ordered Details")
            {
                field("Qty. Ordered"; Rec."Qty. Ordered")
                {
                    //ToolTipML = ENU = 'Quantity Ordered', UKR = 'Вказана кількість вже замовлених';
                    ToolTip = 'Quantity Ordered';
                    Editable = false;
                }
                field("Qty. in Order"; Rec."Qty. in Order")
                {
                    ToolTip = 'Quantity in Order currently';
                    //ToolTipML = ENU = 'Quantity in Order currently', UKR = 'Вказана кількість замовлених на даний момент';
                    Editable = false;
                }
            }
        }
        area(FactBoxes)
        {
            part("Gudfood Item Picture"; "Gudfood Item Picture FB")
            {
                SubPageLink = Code = field(Code);
            }
        }
    }
}
