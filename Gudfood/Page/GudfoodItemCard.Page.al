page 50101 GudfoodItemCard
{
    CaptionML = UKR = 'Гудфуд картка товару', ENU = 'Gudfood Item Card';
    PageType = Card;
    SourceTable = GudfoodItem;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Code; Rec.Code)
                {
                    ToolTipML = ENU = 'Input code of the item', UKR = 'Введіть код товару';
                }
                field(Description; Rec.Description)
                {
                    ToolTipML = ENU = 'Input description of the item', UKR = 'Введіть опис товару';
                    ShowMandatory = true;
                    NotBlank = true;

                }
                field(Type; Rec.Type)
                {
                    ToolTipML = ENU = 'Input type of the item', UKR = 'Оберіть тип товару';
                    ShowMandatory = true;
                    NotBlank = true;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTipML = ENU = 'Input unit price of the item', UKR = 'Введіть ціну за одиницю товару';
                    ShowMandatory = true;
                    NotBlank = true;
                }
                field("Shelf Life"; Rec."Shelf Life")
                {
                    ToolTipML = ENU = 'Input Shelf Life of the item', UKR = 'Введіть срок придатності товару';
                }
            }
            group("Ordered Details")
            {
                field("Qty. Ordered"; Rec."Qty. Ordered")
                {
                    ToolTipML = ENU = 'Quantity Ordered', UKR = 'Кількість вже замовлених';
                    Editable = false;
                }
                field("Qty. in Order"; Rec."Qty. in Order")
                {
                    ToolTipML = ENU = 'Quantity in Order currently', UKR = 'Кількість замовлених на даний момент';
                    Editable = false;
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
            action(ImportPicture)
            {
                CaptionML = ENU = 'Import Picture', UKR = 'Імпортувати зображення';
                Image = Picture;
                ToolTipML = ENU = 'Import a picture file.', UKR = 'Імпорт файлу зображення';

                trigger OnAction()
                var
                    ImportPicture: Codeunit GudfoodItemImportPicture;
                begin
                    ImportPicture.ImportFromDevice(Rec);
                end;
            }
        }
    }
}
