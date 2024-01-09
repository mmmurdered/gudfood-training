page 50108 GudfoodOrderActivities
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = GudfoodSalesOrderCue;

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
                        GudfoodOrderList: Page GudfoodOrderList;
                    begin
                        GudfoodOrderList.Run();
                    end;
                }
                field("Total Number of Orders"; Rec."Total Number of Orders")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        GudfoodPostedOrders: Page PostedGudfoodOrder;
                    begin
                        GudfoodPostedOrders.Run();
                    end;
                }
                field("Number of Gudfood Items"; Rec."Number of Gudfood Items")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        GudfoodItemList: Page GudfoodItemList;
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