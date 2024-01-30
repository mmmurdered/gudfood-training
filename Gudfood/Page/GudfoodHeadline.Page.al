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
        if PostedGudfoodOrders.FindLast() then
            exit(MaxAmountLabel + Format(PostedGudfoodOrders."Total Amount"));
        exit(MaxAmountLabel + '0');
    end;

    local procedure GetWelcomeText(): Text[250]
    var
        WelcomeLabel: Label 'Welcome to Gudfood, ';
        User: Record User;
    begin
        User.Get(UserSecurityID);
        exit(WelcomeLabel + User."Full Name");
    end;
}