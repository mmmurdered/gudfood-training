xmlport 50101 "Gudfood Posted Order Export"
{
    Caption = 'Export Posted Order to XML';
    Format = Xml;
    Direction = Export;

    schema
    {
        textelement(PostedOrders)
        {
            tableelement(PostedGudfoodOrderHeader; "Posted Gudfood Order Header")
            {
                fieldelement(No; PostedGudfoodOrderHeader."No.")
                {

                }
                fieldelement(SellToCustomerNo; PostedGudfoodOrderHeader."Sell-to Customer No.")
                {

                }
                fieldelement(SellToCustomerName; PostedGudfoodOrderHeader."Sell-to Customer Name")
                {

                }
                fieldelement(OrderDate; PostedGudfoodOrderHeader."Order Date")
                {

                }
                fieldelement(DateCreated; PostedGudfoodOrderHeader."Date Created")
                {

                }
                fieldelement(TotalQuantity; PostedGudfoodOrderHeader."Total Qty")
                {

                }
                fieldelement(TotalAmount; PostedGudfoodOrderHeader."Total Amount")
                {

                }
                tableelement(PostedGudfoodOrderLine; "Posted Gudfood Order Line")
                {
                    LinkTable = PostedGudfoodOrderHeader;
                    LinkFields = "Order No." = field("No.");
                    fieldelement(OrderNo; PostedGudfoodOrderLine."Order No.")
                    {

                    }
                    fieldelement(DateCreated; PostedGudfoodOrderLine."Date Created")
                    {

                    }
                    fieldelement(LineNo; PostedGudfoodOrderLine."Line No.")
                    {

                    }
                    fieldelement(ItemNo; PostedGudfoodOrderLine."Item No.")
                    {

                    }
                    fieldelement(ItemType; PostedGudfoodOrderLine."Item Type")
                    {

                    }
                    fieldelement(Description; PostedGudfoodOrderLine.Description)
                    {

                    }
                    fieldelement(SelltoCustomerNo; PostedGudfoodOrderLine."Sell- to Customer No.")
                    {

                    }
                    fieldelement(Amount; PostedGudfoodOrderLine.Amount)
                    {

                    }
                    fieldelement(UnitPrice; PostedGudfoodOrderLine."Unit Price")
                    {

                    }
                    fieldelement(Quantity; PostedGudfoodOrderLine.Quantity)
                    {

                    }
                }
            }
        }
    }
}