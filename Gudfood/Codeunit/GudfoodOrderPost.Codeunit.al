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
        GudfoodOrderHeader: Record "Gudfood Order Header";
        ConfirmationMessage: Label 'Are you sure to post resords?';
        SuccessfullyPostedOrderMessage: Label 'The order has been successfully posted';
    begin
        if Dialog.Confirm(ConfirmationMessage) then begin
            if GudfoodOrder."No." <> '' then begin
                GudfoodOrderHeader.GET(GudfoodOrder."No.");

                PostedGudfoodOrderHeader.INIT;
                PostedGudfoodOrderHeader.TRANSFERFIELDS(GudfoodOrderHeader, TRUE);
                PostedGudfoodOrderHeader."No." := GudfoodOrderHeader."Posting No.";
                PostedGudfoodOrderHeader."Posting Date" := Today;
                PostedGudfoodOrderHeader.INSERT(TRUE);

                if (GudfoodOrderLine.FINDSET) then begin
                    GudfoodOrderLine.SetRange("Order No.", GudfoodOrder."No.");
                    GudfoodOrderLine.FINDSET();
                    PostedGudfoodOrderLine.INIT;
                    REPEAT
                        PostedGudfoodOrderLine.TRANSFERFIELDS(GudfoodOrderLine, TRUE);
                        PostedGudfoodOrderLine."Order No." := GudfoodOrderHeader."Posting No.";
                        PostedGudfoodOrderLine."Date Created" := Today;
                        PostedGudfoodOrderLine.INSERT(TRUE);
                    UNTIL GudfoodOrderLine.NEXT = 0;
                end;

                GudfoodOrderHeader.DELETE(TRUE);
                GudfoodOrderLine.DeleteAll(TRUE);
            end;
            Message(SuccessfullyPostedOrderMessage);
        end;
    end;
}