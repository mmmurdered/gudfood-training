report 50101 "Gudfood Posted Order Report"
{
    Caption = 'Gudfood Posted Order Report';
    DefaultRenderingLayout = RDLCLayout;

    dataset
    {
        dataitem(GudfoodPostedOrderHeader; "Posted Gudfood Order Header")
        {
            column(Date_Created_For_Caption; "Date Created")
            {
                IncludeCaption = true;
            }
            column(Date_Created; GetDateFormat("Date Created"))
            {

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
            column(Created_By_Caption; CreatedByLabel)
            {

            }
            column(Total_Amount; "Total Amount")
            {
                IncludeCaption = true;
            }
            dataitem(GudfoodPostedOrderLine; "Posted Gudfood Order Line")
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
            Caption = 'Gudfood Posted Order Report (Word)';
            LayoutFile = 'GudfoodPostedOrderWord.docx';
        }
        layout(RDLCLayout)
        {
            Type = RDLC;
            Caption = 'Gudfood Posted Order Report (RDLC)';
            LayoutFile = 'RDLReport.rdl';
        }
    }
    local procedure GetDateFormat(DateToConvert: Date) RetDate: Text
    var
        LocMgt: Codeunit Language;
    begin
        if DateToConvert <> 0D then begin
            RetDate := Format(DateToConvert);
            exit(RetDate);
        end else begin
            RetDate := ' ';
            exit(RetDate);
        end;
    end;

    var
        CreatedByLabel: Label 'Created By: ';
}