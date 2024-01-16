page 50102 "Gudfood Item Picture FB"
{
    Caption = 'Gudfood Item Picture';
    //CaptionML = ENU = 'Gudfood Item Picture', UKR = 'Гудфуд Зображення Товару';
    PageType = CardPart;
    ApplicationArea = All;
    SourceTable = "Gudfood Item";

    layout
    {
        area(Content)
        {
            field("Gudfood Item Picture"; Rec.Picture)
            {
                //ToolTipML = ENU = 'Picture of the item', UKR = 'Зображення товару';
                ToolTip = 'Picture of the item';
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ImportPicture)
            {
                //CaptionML = ENU = 'Import Picture', UKR = 'Імпортувати зображення';
                Caption = 'Import Picture';
                Image = Picture;
                //ToolTipML = ENU = 'Import a picture file.', UKR = 'Імпорт файлу зображення';
                ToolTip = 'Import a picture file.';

                trigger OnAction()
                begin
                    ImportFromDevice(Rec);
                end;
            }
            action(RemovePicture)
            {
                Image = Delete;
                //CaptionML = ENU = 'Delete Picture', UKR = 'Видалити зображення';
                Caption = 'Delete Picture';
                trigger OnAction()
                begin
                    Clear(Rec.Picture);
                    Rec.Modify();
                end;
            }
        }
    }

    local procedure ImportFromDevice(var GudfoodItem: Record "Gudfood Item")
    var
        FileManagement: Codeunit "File Management";
        FileName: Text;
        ClientFileName: Text;
        InStr: InStream;
        SelectPictureLabel: Label 'Select item image: ';
        EmptyNameError: Label 'Error, empty name of file';
    begin
        ClientFileName := '';
        UploadIntoStream(SelectPictureLabel, '', '', ClientFileName, InStr);
        if ClientFileName <> '' then
            FileName := FileManagement.GetFileName(ClientFileName);
        if FileName = '' then
            Error(EmptyNameError);
        Clear(GudfoodItem.Picture);
        GudfoodItem.Picture.ImportStream(InStr, FileName);
        GudfoodItem.Modify();
    end;
}