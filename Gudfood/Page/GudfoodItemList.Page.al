page 50100 GudfoodItemList
{
    CaptionML = UKR = 'Гудфут список товарів', ENU = 'Gudfood Item Card';
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
                    ApplicationArea = All;

                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;

                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;

                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;

                }
                field("Qty. Ordered"; Rec."Qty. Ordered")
                {
                    ApplicationArea = All;

                }
                field("Qty. in Order"; Rec."Qty. in Order")
                {
                    ApplicationArea = All;

                }
                field("Shelf Life"; Rec."Shelf Life")
                {
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