page 50110 "Gudfood Headline"
{
    Caption = 'Gudfood Headline';
    PageType = HeadlinePart;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Welcome; GetWelcomeText())
                {
                    ApplicationArea = All;

                }
                field(TotalSales; GetMaxTotalAmount())
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    local procedure GetMaxTotalAmount(): Text[250]
    var
        PostedGudfoodOrders: Record "Posted Gudfood Order Header";
        MaxAmountLabel: Label 'Maximum total amount of order is: ';
    begin
        PostedGudfoodOrders.SetCurrentKey("Total Amount");
        PostedGudfoodOrders.FindLast();
        exit(MaxAmountLabel + Format(PostedGudfoodOrders."Total Amount"));
    end;

    local procedure GetWelcomeText(): Text[250]
    var
        WelcomeLabel: Label 'Welcome to Gudfood, ';
    begin
        exit(WelcomeLabel + UserId);
    end;
}