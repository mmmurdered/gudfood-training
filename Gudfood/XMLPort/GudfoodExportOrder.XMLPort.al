xmlport 50100 GudfoodOrderExport
{
    Format = Xml;
    Caption = 'Export Order to XML';

    schema
    {
        textelement(OrderOrderHeader)
        {
            tableelement(OrderHeader; GudfoodOrderHeader)
            {
                fieldelement(No; OrderHeader."No.")
                {

                }
                fieldelement(SellToCustomerNo; OrderHeader."Sell-to Customer No.")
                {

                }
                fieldelement(SellToCustomerName; OrderHeader."Sell-to Customer Name")
                {

                }
                fieldelement(OrderDate; OrderHeader."Order Date")
                {

                }
                fieldelement(PostingNo; OrderHeader."Posting No.")
                {

                }
                fieldelement(DateCreated; OrderHeader."Date Created")
                {

                }
                fieldelement(TotalQuantity; OrderHeader."Total Qty")
                {

                }
                fieldelement(TotalAmount; OrderHeader."Total Amount")
                {

                }
                tableelement(OrderLine; GudfoodOrderLine)
                {
                    fieldelement(OrderNo; OrderLine."Order No.")
                    {

                    }
                    fieldelement(DateCreated; OrderLine."Date Created")
                    {

                    }
                    fieldelement(LineNo; OrderLine."Line No.")
                    {

                    }
                    fieldelement(ItemNo; OrderLine."Item No.")
                    {

                    }
                    fieldelement(ItemType; OrderLine."Item Type")
                    {

                    }
                    fieldelement(Description; OrderLine.Description)
                    {

                    }
                    fieldelement(SelltoCustomerNo; OrderLine."Sell- to Customer No.")
                    {

                    }
                    fieldelement(Amount; OrderLine.Amount)
                    {

                    }
                    fieldelement(UnitPrice; OrderLine."Unit Price")
                    {

                    }
                    fieldelement(Quantity; OrderLine.Quantity)
                    {

                    }
                }
            }
        }
    }
}