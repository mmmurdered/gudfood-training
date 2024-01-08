codeunit 50102 GudfoodItemImportPicture
{
    trigger OnRun()
    begin

    end;

    procedure ImportFromDevice(GudfoodItem: Record GudfoodItem)
    var
        FileManagement: Codeunit "File Management";
        FileName: Text;
        ClientFileName: Text;
        InStr: InStream;
    begin
        GudfoodItem.Find();
        GudfoodItem.TestField(Code);
        ClientFileName := '';
        UploadIntoStream('Select your picture', '', '', ClientFileName, InStr);
        if ClientFileName <> '' then
            FileName := FileManagement.GetFileName(ClientFileName);
        if FileName = '' then
            Error('');
        Clear(GudfoodItem.Picture);
        GudfoodItem.Picture.ImportStream(InStr, FileName);
        GudfoodItem.Modify(true);
    end;
}