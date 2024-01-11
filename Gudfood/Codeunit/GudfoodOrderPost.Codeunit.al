codeunit 50100 "Gudfood Order Post"
{
    TableNo = "Gudfood Order Header";

    trigger OnRun()
    begin
        PostOrder(Rec);
    end;

    procedure PostOrder(var GudfoodOrder: Record "Gudfood Order Header")
    var
        PostedGudfoodOrderLine: Record "Posted Gudfood Order Line";
        GudfoodOrderLine: Record "Gudfood Order Line";
        PostedGudfoodOrderHeader: Record "Posted Gudfood Order Header";
        ConfirmationMessage: Label 'Are you sure to post resords?';
        SuccessfullyPostedOrderMessage: Label 'The order has been successfully posted';
    begin
        if Dialog.Confirm(ConfirmationMessage) then begin
            if GudfoodOrder.Get(GudfoodOrder."No.") then begin
                PostedGudfoodOrderHeader.Init();
                PostedGudfoodOrderHeader.TransferFields(GudfoodOrder, true);
                PostedGudfoodOrderHeader."No." := GudfoodOrder."Posting No.";
                PostedGudfoodOrderHeader."Posting Date" := Today;
                PostedGudfoodOrderHeader.Insert(true);

                GudfoodOrderLine.SetRange("Order No.", GudfoodOrder."No.");
                if (GudfoodOrderLine.FindSet()) then begin
                    repeat
                        PostedGudfoodOrderLine.Init();
                        PostedGudfoodOrderLine.TransferFields(GudfoodOrderLine, true);
                        PostedGudfoodOrderLine."Order No." := GudfoodOrder."Posting No.";
                        PostedGudfoodOrderLine."Date Created" := Today;
                        PostedGudfoodOrderLine.Insert(true);
                    until GudfoodOrderLine.Next = 0;
                end;

                GudfoodOrder.Delete(true);
            end;
            Message(SuccessfullyPostedOrderMessage);
        end;
    end;
}