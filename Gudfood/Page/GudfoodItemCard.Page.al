page 50101 GudfoodItemCard
{
    Caption = 'Gudfood Item Card';
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
                    ShowMandatory = true;
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ShowMandatory = true;
                    ApplicationArea = All;

                }
                field(Type; Rec.Type)
                {
                    ShowMandatory = true;
                    ApplicationArea = All;

                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ShowMandatory = true;
                    ApplicationArea = All;

                }
                field("Shelf Life"; Rec."Shelf Life")
                {
                    ApplicationArea = All;

                }
            }
            group("Ordered Details")
            {
                field("Qty. Ordered"; Rec."Qty. Ordered")
                {
                    Editable = false;
                    ApplicationArea = All;

                }
                field("Qty. in Order"; Rec."Qty. in Order")
                {
                    Editable = false;
                    ApplicationArea = All;

                }
            }
        }
        area(FactBoxes)
        {
            part(Picture; GudfoodItemPicture)
            {
                //SubPageLink = Code = field(Code);
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

            }
        }
    }

    // trigger OnAfterGetCurrRecord()
    // var
    //     docSeries: Code[20];
    //     docNo: Code[20];
    //     NoSeriesMgt: Codeunit NoSeriesManagement;
    // begin
    //     if Rec.Code = '' then begin
    //         docSeries := 'FUD';
    //         docNo := NoSeriesMgt.GetNextNo(docSeries, WorkDate(), true);
    //         Rec.Code := docNo;
    //     end;
    // end;
}
