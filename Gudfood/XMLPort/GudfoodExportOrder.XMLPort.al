xmlport 50100 "Gudfood Order Export"
{
    CaptionML = ENU = 'Export Order to XML', UKR = 'Експортувати в XML файл';
    Format = Xml;
    Direction = Export;

    schema
    {
        textelement(OrderOrderHeader)
        {
            tableelement(GudfoodOrderHeader; "Gudfood Order Header")
            {
                fieldelement(No; GudfoodOrderHeader."No.")
                {

                }
                fieldelement(SellToCustomerNo; GudfoodOrderHeader."Sell-to Customer No.")
                {

                }
                fieldelement(SellToCustomerName; GudfoodOrderHeader."Sell-to Customer Name")
                {

                }
                fieldelement(OrderDate; GudfoodOrderHeader."Order Date")
                {

                }
                fieldelement(PostingNo; GudfoodOrderHeader."Posting No.")
                {

                }
                fieldelement(DateCreated; GudfoodOrderHeader."Date Created")
                {

                }
                fieldelement(TotalQuantity; GudfoodOrderHeader."Total Qty")
                {

                }
                fieldelement(TotalAmount; GudfoodOrderHeader."Total Amount")
                {

                }
                tableelement(GudfoodOrderLine; "Gudfood Order Line")
                {
                    LinkTable = GudfoodOrderHeader;
                    LinkFields = "Order No." = field("No.");
                    fieldelement(OrderNo; GudfoodOrderLine."Order No.")
                    {

                    }
                    fieldelement(DateCreated; GudfoodOrderLine."Date Created")
                    {

                    }
                    fieldelement(LineNo; GudfoodOrderLine."Line No.")
                    {

                    }
                    fieldelement(ItemNo; GudfoodOrderLine."Item No.")
                    {

                    }
                    fieldelement(ItemType; GudfoodOrderLine."Item Type")
                    {

                    }
                    fieldelement(Description; GudfoodOrderLine.Description)
                    {

                    }
                    fieldelement(SelltoCustomerNo; GudfoodOrderLine."Sell- to Customer No.")
                    {

                    }
                    fieldelement(Amount; GudfoodOrderLine.Amount)
                    {

                    }
                    fieldelement(UnitPrice; GudfoodOrderLine."Unit Price")
                    {

                    }
                    fieldelement(Quantity; GudfoodOrderLine.Quantity)
                    {

                    }
                }
            }
        }
    }
}