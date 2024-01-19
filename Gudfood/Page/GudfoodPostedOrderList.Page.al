page 50111 "Posted Gudfood Order List"
{
    Caption = 'Posted Gudfood Order List';
    PageType = List;
    UsageCategory = History;
    SourceTable = "Posted Gudfood Order Header";
    CardPageId = "Posted Gudfood Order";
    ApplicationArea = All;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater("Posted Orders")
            {
                field("No."; Rec."No.")
                {

                }
                field("Posted Date"; Rec."Posting Date")
                {

                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {

                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {

                }
                field("Order Date"; Rec."Order Date")
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
                begin
                    CurrPage.SetSelectionFilter(Rec);
                    Xmlport.Run(Xmlport::"Gudfood Posted Order Export", false, false, Rec);
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
