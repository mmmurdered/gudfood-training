page 50110 "Gudfood Headline"
{
    CaptionML = ENU = 'Gudfood Headline', UKR = 'Заголовок Гудфуд';
    PageType = HeadlinePart;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Welcome; 'Welcome to Gudfood!')
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
    begin
        PostedGudfoodOrders.SetCurrentKey("Total Amount");
        PostedGudfoodOrders.FindLast();
        exit('Maximum total amount of order is: ' + Format(PostedGudfoodOrders."Total Amount"));
    end;
}