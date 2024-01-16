page 50100 "Gudfood Item List"
{
    Caption = 'Gudfood Item List';
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
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Description of the item';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Unit Price of the item';
                }
                field(Type; Rec.Type)
                {
                    ToolTip = 'Type of the item';
                }
                field("Qty. Ordered"; Rec."Qty. Ordered")
                {
                    ToolTip = 'Quantity Ordered';
                }
                field("Qty. in Order"; Rec."Qty. in Order")
                {
                    ToolTip = 'Quantity in Order';
                }
                field("Shelf Life"; Rec."Shelf Life")
                {
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