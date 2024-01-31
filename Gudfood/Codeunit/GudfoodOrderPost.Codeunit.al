codeunit 50100 "Gudfood Order Post"
{
    TableNo = "Gudfood Order Header";

    trigger OnRun()
    begin
        PostOrder(Rec);
    end;

    procedure PostOrder(GudfoodOrder: Record "Gudfood Order Header")
    var
        PostedGudfoodOrderLine: Record "Posted Gudfood Order Line";
        GudfoodOrderLine: Record "Gudfood Order Line";
        PostedGudfoodOrderHeader: Record "Posted Gudfood Order Header";
        ConfirmationMessage: Label 'Are you sure to post resords?';
        SuccessfullyPostedOrderMessage: Label 'The order has been successfully posted, do yo want to open posted report?';
        PostingNo: Code[20];
    begin
        if Dialog.Confirm(ConfirmationMessage) then begin
            OnBeforePostGudfoodOrder(GudfoodOrder);
            PostingNo := GudfoodOrder."Posting No.";

            PostedGudfoodOrderHeader.Init();
            PostedGudfoodOrderHeader.TransferFields(GudfoodOrder);
            PostedGudfoodOrderHeader."No." := GudfoodOrder."Posting No.";
            PostedGudfoodOrderHeader."Posting Date" := Today;
            PostedGudfoodOrderHeader.Insert();

            GudfoodOrderLine.SetRange("Order No.", GudfoodOrder."No.");
            if GudfoodOrderLine.FindSet() then
                repeat
                    PostedGudfoodOrderLine.Init();
                    PostedGudfoodOrderLine.TransferFields(GudfoodOrderLine);
                    PostedGudfoodOrderLine."Order No." := GudfoodOrder."Posting No.";
                    PostedGudfoodOrderLine."Date Created" := Today;
                    PostedGudfoodOrderLine.Insert();
                until GudfoodOrderLine.Next() = 0;


            GudfoodOrder.Delete(true);

            if Dialog.Confirm(SuccessfullyPostedOrderMessage) then begin
                PostedGudfoodOrderHeader.Get(PostingNo);
                Page.Run(Page::"Posted Gudfood Order", PostedGudfoodOrderHeader);
            end;
        end;
    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforePostGudfoodOrder(var GudfoodOrderHeader: Record "Gudfood Order Header")
    begin
    end;
}