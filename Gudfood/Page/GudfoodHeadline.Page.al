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
                field(TotalSales; GudfoodHeadlineText.GetMaxTotalAmount())
                {
                    ApplicationArea = All;

                }
            }
        }
    }
    var
        GudfoodHeadlineText: Codeunit "Gudfood Managment Codeunit";
}