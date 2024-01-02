report 50100 GudfoodOrderReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = WordLayout;

    dataset
    {
        dataitem("Order Header"; GudfoodOrderHeader)
        {
            column(Date_Created; "Date Created")
            {

            }
            column(Sell_to_Customer_No_; "Sell-to Customer No.")
            {

            }
            column(Sell_to_Customer_Name; "Sell-to Customer Name")
            {

            }
            column(USERID; USERID)
            {

            }
            column(Total_Amount; "Total Amount")
            {

            }
            dataitem("Order Line"; GudfoodOrderLine)
            {
                column(Item_No_; "Item No.")
                {

                }
                column(Item_Type; "Item Type")
                {

                }
                column(Description; Description)
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(Unit_Price; "Unit Price")
                {

                }
                column(Amount; Amount)
                {

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