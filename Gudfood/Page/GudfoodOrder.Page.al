page 50104 "Gudfood Order"
{
    //CaptionML = ENU = 'Gudfood Order', UKR = 'Гудфуд Замовлення';
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
                    //ToolTipML = ENU = 'Specified No of the Order, can be generated automatically',
                    //UKR = 'Вказаний номер замовлення, може бути згенерований автоматично';
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
                    //ToolTipML = ENU = 'Specified Customer sell to of the Order', UKR = 'Вказаний клієнт замовлення';
                    ToolTip = 'Specified Customer sell to of the Order';
                    ShowMandatory = true;
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    //ToolTipML = ENU = 'Specified Customer name', UKR = 'Вказані Креденціали клієнта';
                    ToolTip = 'Specified Customer name';
                }
                field("Order Date"; Rec."Order Date")
                {
                    //ToolTipML = ENU = 'Specified Order Date', UKR = 'Вказана Дату замовлення';
                    ToolTip = 'Specified Order Date';
                }
                field("Posting No."; Rec."Posting No.")
                {
                    //ToolTipML = ENU = 'Specified No of the Posted Order, can be generated automatically',
                    //UKR = 'Номер публікації замовлення, може бути присвоєно автоматично';
                    ToolTip = 'Specified No of the Posted Order, can be generated automatically';
                }
                field("Date Created"; Rec."Date Created")
                {
                    //ToolTipML = ENU = 'Specified Created Date', UKR = 'Вказана дата створення';
                    ToolTip = 'Specified Created Date';
                }
                field("Total Qty"; Rec."Total Qty")
                {
                    //ToolTipML = ENU = 'Specified Quantity of Order', UKR = 'Вказана загальна кількість замовлення';
                    ToolTip = 'Specified Quantity of Order';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    //ToolTipML = ENU = 'Specified Amount of Order', UKR = 'Вказана загальна сума замовлення';
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
                    //CaptionML = ENU = 'Post', UKR = 'Опублікувати';
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
                    //CaptionML = ENU = 'Print Report', UKR = 'Надрукувати звіт';
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
                    //CaptionML = ENU = 'Export to XML', UKR = 'Експортувати в XML';
                    Caption = 'Export to XML';
                    Image = XMLFile;
                    trigger OnAction()
                    var
                        GudfoodOrderHeader: Record "Gudfood Order Header";
                    begin
                        CurrPage.SetSelectionFilter(GudfoodOrderHeader);
                        Xmlport.Run(Xmlport::"Gudfood Order Export", true, false, GudfoodOrderHeader);
                    end;
                }
            }
        }
    }
}