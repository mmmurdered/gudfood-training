codeunit 50100 GudfoodOrderPost
{
    TableNo = GudfoodOrderHeader;

    trigger OnRun()
    begin

    end;

    var
        PostedGudfoodOrderLine: Record PostedGudfoodOrderline;
        GudfoodOrderLine: Record GudfoodOrderLine;
        PostedGudfoodOrderHeader: Record PostedGudfoodOrderHeader;
        GudfoodOrderHeader: Record GudfoodOrderHeader;
        ConfirmationMessage: Label 'Are you sure to post resords?';
        CancelMessage: Label 'Posting was cancelled';
        SuccessfullyPostedOrderMessage: Label 'The order has been successfully posted';

    procedure PostOrder(var GudfoodOrder: Record GudfoodOrderHeader)
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