page 50101 "Gudfood Item Card"
{
    CaptionML = UKR = 'Гудфуд картка товару', ENU = 'Gudfood Item Card';
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
                    ToolTipML = ENU = 'Specified code of the item', UKR = 'Вказаний код товару';
                }
                field(Description; Rec.Description)
                {
                    ToolTipML = ENU = 'Specified description of the item', UKR = 'Вказаний опис товару';
                    ShowMandatory = true;
                    NotBlank = true;

                }
                field(Type; Rec.Type)
                {
                    ToolTipML = ENU = 'Specified type of the item', UKR = 'Вказаний тип товару';
                    ShowMandatory = true;
                    NotBlank = true;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTipML = ENU = 'Specified unit price of the item', UKR = 'Вказана ціну за одиницю товару';
                    ShowMandatory = true;
                    NotBlank = true;
                }
                field("Shelf Life"; Rec."Shelf Life")
                {
                    ToolTipML = ENU = 'Specified Shelf Life of the item', UKR = 'Вказаний срок придатності товару';
                }
            }
            group("Ordered Details")
            {
                field("Qty. Ordered"; Rec."Qty. Ordered")
                {
                    ToolTipML = ENU = 'Quantity Ordered', UKR = 'Вказана кількість вже замовлених';
                    Editable = false;
                }
                field("Qty. in Order"; Rec."Qty. in Order")
                {
                    ToolTipML = ENU = 'Quantity in Order currently', UKR = 'Вказана кількість замовлених на даний момент';
                    Editable = false;
                }
            }
        }
        area(FactBoxes)
        {
            part(Picture; "Gudfood Item Picture")
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
                    ImportPicture: Codeunit "Gudfood Managment Codeunit";
                begin
                    ImportPicture.ImportFromDevice(Rec);
                end;
            }
        }
    }
}
