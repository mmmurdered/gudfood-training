page 50108 "Gudfood Order Activities"
{
    CaptionML = ENU = 'Gudfood Order Activities', UKR = 'Активності Замовлень Гудфуд';
    PageType = CardPart;
    ApplicationArea = All;
    SourceTable = "Gudfood Sales Order Cue";

    layout
    {
        area(Content)
        {
            cuegroup("Gudfood Order")
            {
                field("Number of Orders"; Rec."Number of Orders")
                {
                    ApplicationArea = All;

                    trigger OnDrillDown()
                    var
                        GudfoodOrderList: Page "Gudfood Order List";
                    begin
                        GudfoodOrderList.Run();
                    end;
                }
                field("Total Number of Orders"; Rec."Total Number of Orders")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        GudfoodPostedOrders: Page "Posted Gudfood Order List";
                    begin
                        GudfoodPostedOrders.Run();
                    end;
                }
                field("Number of Gudfood Items"; Rec."Number of Gudfood Items")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        GudfoodItemList: Page "Gudfood Item List";
                    begin
                        GudfoodItemList.Run();
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}