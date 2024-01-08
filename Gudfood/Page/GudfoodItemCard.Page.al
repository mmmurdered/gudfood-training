page 50101 GudfoodItemCard
{
    CaptionML = UKR = 'Гудфуд картка товару', ENU = 'Gudfood Item Card';
    PageType = Card;
    SourceTable = GudfoodItem;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Code; Rec.Code)
                {
                    ToolTipML = ENU = 'Input code of the item', UKR = 'Введіть код товару';
                    ShowMandatory = true;
                    NotBlank = true;
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTipML = ENU = 'Input description of the item', UKR = 'Введіть опис товару';
                    ShowMandatory = true;
                    NotBlank = true;
                    ApplicationArea = All;

                }
                field(Type; Rec.Type)
                {
                    ToolTipML = ENU = 'Input type of the item', UKR = 'Оберіть тип товару';
                    ShowMandatory = true;
                    NotBlank = true;
                    ApplicationArea = All;

                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTipML = ENU = 'Input unit price of the item', UKR = 'Введіть ціну за одиницю товару';
                    ShowMandatory = true;
                    NotBlank = true;
                    ApplicationArea = All;

                }
                field("Shelf Life"; Rec."Shelf Life")
                {
                    ToolTipML = ENU = 'Input Shelf Life of the item', UKR = 'Введіть срок придатності товару';
                    ApplicationArea = All;

                }
            }
            group("Ordered Details")
            {
                field("Qty. Ordered"; Rec."Qty. Ordered")
                {
                    ToolTipML = ENU = 'Quantity Ordered', UKR = 'Кількість вже замовлених';
                    Editable = false;
                    ApplicationArea = All;

                }
                field("Qty. in Order"; Rec."Qty. in Order")
                {
                    ToolTipML = ENU = 'Quantity in Order currently', UKR = 'Кількість замовлених на даний момент';
                    Editable = false;
                    ApplicationArea = All;

                }
            }
        }
        area(FactBoxes)
        {
            part(Picture; GudfoodItemPicture)
            {
                ApplicationArea = All;
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
                ApplicationArea = All;
                Caption = 'Import Picture';
                Image = Picture;
                ToolTip = 'Import a picture file.';

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
