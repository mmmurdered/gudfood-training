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
            CheckOrderHeader(GudfoodOrder);
            CheckEmptyLines(GudfoodOrderLine, GudfoodOrder);
            OnBeforePostGudfoodOrder(GudfoodOrder);

            GudfoodOrderLine.SetRange("Order No.", GudfoodOrder."No.");
            if GudfoodOrderLine.FindSet() then
                repeat
                    PostedGudfoodOrderLine.Init();
                    PostedGudfoodOrderLine.TransferFields(GudfoodOrderLine);
                    PostedGudfoodOrderLine."Order No." := GudfoodOrder."Posting No.";
                    PostedGudfoodOrderLine."Date Created" := Today;
                    PostedGudfoodOrderLine.Insert();
                until GudfoodOrderLine.Next() = 0;

            PostingNo := GudfoodOrder."Posting No.";
            PostedGudfoodOrderHeader.Init();
            PostedGudfoodOrderHeader.TransferFields(GudfoodOrder);
            PostedGudfoodOrderHeader."No." := GudfoodOrder."Posting No.";
            PostedGudfoodOrderHeader."Posting Date" := Today;
            PostedGudfoodOrderHeader.Insert();

            GudfoodOrder.Delete(true);

            if Dialog.Confirm(SuccessfullyPostedOrderMessage) then begin
                PostedGudfoodOrderHeader.Get(PostingNo);
                Page.Run(Page::"Posted Gudfood Order", PostedGudfoodOrderHeader);
            end;
        end;
    end;

    local procedure CheckEmptyLines(OrderLine: Record "Gudfood Order Line"; GudfoodOrder: Record "Gudfood Order Header")
    var
        NoOrderLinesError: Label 'There are no lines to post';
        OrderLineEmptyError: Label 'Line %1 has an error';
    begin
        OrderLine.SetRange("Order No.", GudfoodOrder."No.");
        if OrderLine.FindSet() then begin
            repeat
                if OrderLine.Amount = 0 then
                    Error(StrSubstNo(OrderLineEmptyError, OrderLine."Line No."));
            until OrderLine.Next() = 0;
        end
        else
            Error(NoOrderLinesError);
    end;

    local procedure CheckOrderHeader(GudfoodOrder: Record "Gudfood Order Header")
    var
        OrderHeaderEmptyMessage: Label 'Order Header has no required information';
    begin
        if (GudfoodOrder."Order Date" = 0D) or (GudfoodOrder."Sell-to Customer No." = '') then
            Error(OrderHeaderEmptyMessage);
    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforePostGudfoodOrder(var GudfoodOrderHeader: Record "Gudfood Order Header")
    begin
    end;
}