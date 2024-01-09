page 50110 GudfoodHeadline
{
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
        GudfoodHeadlineText: Codeunit GudfoodHeadlineText;
}