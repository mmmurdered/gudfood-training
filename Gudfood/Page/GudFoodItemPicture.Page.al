page 50102 "Gudfood Item Picture FB"
{
    CaptionML = ENU = 'Gudfood Item Picture', UKR = 'Гудфуд Зображення Товару';
    PageType = CardPart;
    ApplicationArea = All;
    SourceTable = "Gudfood Item";

    layout
    {
        area(Content)
        {
            field(Picture; Rec.Picture)
            {
                ToolTipML = ENU = 'Picture of the item', UKR = 'Зображення товару';
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ImportPicture)
            {
                CaptionML = ENU = 'Import Picture', UKR = 'Імпортувати зображення';
                Image = Picture;
                ToolTipML = ENU = 'Import a picture file.', UKR = 'Імпорт файлу зображення';

                trigger OnAction()
                begin
                    ImportFromDevice(Rec);
                end;
            }
        }
    }

    local procedure ImportFromDevice(GudfoodItem: Record "Gudfood Item")
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
}