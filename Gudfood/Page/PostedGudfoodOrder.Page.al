page 50106 "Posted Gudfood Order"
{
    Caption = 'Posted Gudfood Order';
    PageType = Document;
    ApplicationArea = All;
    SourceTable = "Posted Gudfood Order Header";
    Editable = false;

    layout
    {
        area(Content)
        {
            group(Header)
            {
                Caption = 'Gudfood Order Header';
                field("No."; Rec."No.")
                {

                }
                group(CustomerInfo)
                {
                    field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                    {

                    }
                    field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                    {

                    }
                }
                field("Order Date"; Rec."Order Date")
                {

                }
                field("Posting Date"; Rec."Posting Date")
                {

                }
                field("Date Created"; Rec."Date Created")
                {

                }
                field("Total Qty"; Rec."Total Qty")
                {

                }
                field("Total Amount"; Rec."Total Amount")
                {

                }
            }
            part("Gudfood Order Line"; "Posted Gudfood Order Subpage")
            {
                SubPageLink = "Order No." = field("No.");
                Caption = 'Gudfood Sales Line';
            }
        }
    }
    actions
    {
        area(Promoted)
        {
            group(Reports)
            {
                Caption = 'Reports';
                actionref(ReportActionRef; Report)
                {

                }
            }
            group(Exporting)
            {
                Caption = 'Exporting';
                actionref(ExportActionRef; Export)
                {

                }
            }
        }
        area(Reporting)
        {
            action(Export)
            {
                Caption = 'Export to XML';
                Image = XMLFile;
                trigger OnAction()
                var
                    PostedGudfoodOrderHeader: Record "Posted Gudfood Order Header";
                begin
                    PostedGudfoodOrderHeader.SetRange("No.", Rec."No.");
                    Xmlport.Run(Xmlport::"Gudfood Posted Order Export", false, false, PostedGudfoodOrderHeader);
                end;
            }

            action(Report)
            {
                Caption = 'Print Report';
                Image = Report;
                trigger OnAction()
                var
                    PostedGudfoodOrderHeader: Record "Posted Gudfood Order Header";
                begin
                    PostedGudfoodOrderHeader.SetRange("No.", Rec."No.");
                    Report.Run(Report::"Gudfood Posted Order Report", true, false, PostedGudfoodOrderHeader);
                end;
            }
        }
    }
}