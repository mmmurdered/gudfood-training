page 50102 "Gudfood Item Picture FB"
{
    Caption = 'Gudfood Item Picture';
    PageType = CardPart;
    ApplicationArea = All;
    SourceTable = "Gudfood Item";

    layout
    {
        area(Content)
        {
            field("Gudfood Item Picture"; Rec.Picture)
            {
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
                Caption = 'Import Picture';
                Image = Picture;
                ToolTip = 'Import a picture file.';

                trigger OnAction()
                begin
                    ImportFromDevice(Rec);
                end;
            }
            action(RemovePicture)
            {
                Image = Delete;
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