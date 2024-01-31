page 50101 "Gudfood Item Card"
{
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
                    ToolTip = 'Specified code of the item';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specified description of the item';
                    ShowMandatory = true;
                    NotBlank = true;
                }
                field(Type; Rec.Type)
                {
                    ToolTip = 'Specified type of the item';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Specified unit price of the item';
                    ShowMandatory = true;
                    NotBlank = true;
                }
                field("Shelf Life"; Rec."Shelf Life")
                {
                    ToolTip = 'Specified Shelf Life of the item';
                }
            }
            group("Ordered Details")
            {
                field("Qty. Ordered"; Rec."Qty. Ordered")
                {
                    ToolTip = 'Quantity Ordered';
                    Editable = false;
                }
                field("Qty. in Order"; Rec."Qty. in Order")
                {
                    ToolTip = 'Quantity in Order currently';
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
