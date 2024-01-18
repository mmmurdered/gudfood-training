page 50104 "Gudfood Order"
{
    Caption = 'Gudfood Order';
    PageType = Document;
    ApplicationArea = All;
    SourceTable = "Gudfood Order Header";

    layout
    {
        area(Content)
        {
            group(Header)
            {
                Caption = 'Gudfood Order Header';
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specified No of the Order, can be generated automatically';

                    trigger OnAssistEdit()
                    var
                        NoSeriesMgt: Codeunit NoSeriesManagement;
                        SalesReceivablesSetup: Record "Sales & Receivables Setup";
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;

                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ToolTip = 'Specified Customer sell to of the Order';
                    ShowMandatory = true;
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ToolTip = 'Specified Customer name';
                }
                field("Order Date"; Rec."Order Date")
                {
                    ToolTip = 'Specified Order Date';
                }
                field("Posting No."; Rec."Posting No.")
                {
                    ToolTip = 'Specified No of the Posted Order, can be generated automatically';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ToolTip = 'Specified Created Date';
                }
                field("Total Qty"; Rec."Total Qty")
                {
                    ToolTip = 'Specified Quantity of Order';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ToolTip = 'Specified Amount of Order';
                }
            }
            part(GudfoodOrderLine; "Gudfood Order Subpage")
            {
                UpdatePropagation = Both;
                SubPageLink = "Order No." = field("No.");
            }
        }
    }
    actions
    {
        area(Processing)
        {
            group(Posting)
            {
                Caption = 'Posting';
                action(Post)
                {
                    Caption = 'Post';
                    Image = Post;
                    RunObject = codeunit "Gudfood Order Post";
                }
            }
        }
        area(Reporting)
        {
            group(Reports)
            {
                Caption = 'Reports';
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
            group(Exporting)
            {
                Caption = 'Exporting';
                action(ExportOrder)
                {
                    Caption = 'Export to XML';
                    Image = XMLFile;
                    trigger OnAction()
                    var
                        GudfoodOrderHeader: Record "Gudfood Order Header";
                    begin
                        GudfoodOrderHeader.SetRange("No.", Rec."No.");
                        Xmlport.Run(Xmlport::"Gudfood Order Export", true, false, GudfoodOrderHeader);
                    end;
                }
            }
        }
    }
}