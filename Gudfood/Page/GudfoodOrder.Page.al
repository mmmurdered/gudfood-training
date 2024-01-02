page 50104 GudfoodOrder
{
    PageType = Document;
    ApplicationArea = All;
    SourceTable = GudfoodOrderHeader;
    UsageCategory = Documents;
    ModifyAllowed = true;

    layout
    {
        area(Content)
        {
            group(Header)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = All;
                }
                field("Posting No."; Rec."Posting No.")
                {
                    ApplicationArea = All;
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = All;
                }
                field("Total Qty"; Rec."Total Qty")
                {
                    ApplicationArea = All;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
                }
            }
            part(SalesLine; GudfoodOrderSubpage)
            {
                UpdatePropagation = Both;
                ApplicationArea = all;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Post)
            {
                CaptionML = ENU = 'Post', UKR = 'Опублікувати';
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Image = Post;
                trigger OnAction()
                begin
                    OrderPostCodeunit.PostOrder(Rec);
                end;
            }
            action(Report)
            {
                CaptionML = ENU = 'Print Report', UKR = 'Надрукувати звіт';
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Image = Report;
                trigger OnAction()
                var
                    GudfoodOrderReport: Report GudfoodOrderReport;
                    GudfoodOrderHeader: Record GudfoodOrderHeader;
                begin
                    GudfoodOrderReport.Run();
                end;
            }
            action(ExportOrder)
            {
                CaptionML = ENU = 'Export to XML', UKR = 'Експортувати в XML';
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Image = XMLFile;
                trigger OnAction()
                var
                    GudfoodExportOrder: XmlPort GudfoodOrderExport;

                begin
                    CurrPage.SetSelectionFilter(Rec);
                    GudfoodExportOrder.Run();
                end;
            }
        }
    }

    var
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit "NoSeriesManagement";
        OrderPostCodeunit: Codeunit GudfoodOrderPost;

    // trigger OnAfterGetCurrRecord()
    // var
    //     docSeries: Code[20];
    //     docNo: Code[20];
    //     NoSeriesMgt: Codeunit NoSeriesManagement;
    // begin
    //     if Rec."No." = '' then begin
    //         docSeries := 'FUD-ORD';
    //         docNo := NoSeriesMgt.GetNextNo(docSeries, WorkDate(), true);
    //         Rec."No." := docNo;
    //     end;
    // end;

}