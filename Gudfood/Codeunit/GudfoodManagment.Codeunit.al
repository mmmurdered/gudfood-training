codeunit 50105 "Gudfood Managment Codeunit"
{
    procedure ImportFromDevice(GudfoodItem: Record "Gudfood Item")
    var
        FileManagement: Codeunit "File Management";
        FileName: Text;
        ClientFileName: Text;
        InStr: InStream;
        SelectPictureLabel: Label 'Select item image: ';
    begin
        GudfoodItem.Find();
        GudfoodItem.TestField(Code);
        ClientFileName := '';
        UploadIntoStream(SelectPictureLabel, '', '', ClientFileName, InStr);
        if ClientFileName <> '' then
            FileName := FileManagement.GetFileName(ClientFileName);
        if FileName = '' then
            Error('');
        Clear(GudfoodItem.Picture);
        GudfoodItem.Picture.ImportStream(InStr, FileName);
        GudfoodItem.Modify(true);
    end;

    procedure GetMaxTotalAmount(): Text[250]
    var
        PostedGudfoodOrders: Record "Posted Gudfood Order Header";
    begin
        PostedGudfoodOrders.SetCurrentKey("Total Amount");
        PostedGudfoodOrders.FindLast();
        exit('Maximum total amount of order is: ' + Format(PostedGudfoodOrders."Total Amount"));
    end;

    procedure UpdateAmount(var GudfoodOrderLine: Record "Gudfood Order Line")
    begin
        GudfoodOrderLine.Amount := GudfoodOrderLine.Quantity * GudfoodOrderLine."Unit Price";
    end;
}