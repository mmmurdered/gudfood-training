page 50107 "Gudfood Order List"
{
    Caption = 'Gudfood Order List';
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "Gudfood Order Header";
    CardPageId = "Gudfood Order";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater("Order Header")
            {
                field("No."; Rec."No.")
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
            group(Posting)
            {
                Caption = 'Posting';
                actionref(PostActionRef; Post)
                {

                }
            }
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
        area(Processing)
        {
            action(Post)
            {
                Caption = 'Post';
                Image = Post;
                RunObject = codeunit "Gudfood Order Post";
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
                    Xmlport.Run(Xmlport::"Gudfood Order Export", false, false, Rec);
                end;
            }

            action(Report)
            {
                Caption = 'Print Report';
                Image = Report;
                trigger OnAction()
                var
                    GudfoodOrderHeader: Record "Gudfood Order Header";
                begin
                    GudfoodOrderHeader.SetRange("No.", Rec."No.");
                    Report.Run(Report::"Gudfood Order Report", true, false, GudfoodOrderHeader);
                end;
            }
        }
    }
}