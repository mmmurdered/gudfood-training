report 50100 GudfoodOrderReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = RDLCLayout;

    dataset
    {
        dataitem(GudfoodOrderHeader; GudfoodOrderHeader)
        {
            column(Date_Created; "Date Created")
            {
                IncludeCaption = true;
            }
            column(Sell_to_Customer_No_; "Sell-to Customer No.")
            {
                IncludeCaption = true;
            }
            column(Sell_to_Customer_Name; "Sell-to Customer Name")
            {
                IncludeCaption = true;
            }
            column(USERID; USERID)
            {

            }
            column(Total_Amount; "Total Amount")
            {
                IncludeCaption = true;
            }
            dataitem(GudfoodOrderLine; GudfoodOrderLine)
            {
                DataItemLink = "Order No." = field("No.");
                column(Item_No_; "Item No.")
                {
                    IncludeCaption = true;
                }
                column(Item_Type; "Item Type")
                {
                    IncludeCaption = true;
                }
                column(Description; Description)
                {
                    IncludeCaption = true;
                }
                column(Quantity; Quantity)
                {
                    IncludeCaption = true;
                }
                column(Unit_Price; "Unit Price")
                {
                    IncludeCaption = true;
                }
                column(Amount; Amount)
                {
                    IncludeCaption = true;
                }
            }
        }
    }
    rendering
    {
        layout(WordLayout)
        {
            Type = Word;
            LayoutFile = 'GudfoodOrderWord.docx';
        }
        layout(RDLCLayout)
        {
            Type = RDLC;
            LayoutFile = 'RDLReport.rdl';
        }
    }
}