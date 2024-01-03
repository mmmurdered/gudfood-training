page 50102 GudfoodItemPicture
{
    Caption = 'Gudfood Item Picture';
    PageType = CardPart;
    ApplicationArea = All;
    SourceTable = GudfoodItem;

    layout
    {
        area(Content)
        {
            field(Picture; Rec.Picture)
            {
                ApplicationArea = All;
            }
            field(Description; Rec.Description)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ImportPicture)
            {
                ApplicationArea = All;
                Caption = 'Import';
                Image = Import;
                ToolTip = 'Import a picture file.';
                Visible = true;

                trigger OnAction()
                begin
                    ImportFromDevice();
                end;
            }
        }
    }

    procedure ImportFromDevice()
    var
        FileManagement: Codeunit "File Management";
        FileName: Text;
        ClientFileName: Text;
        InStr: InStream;
    begin
        Rec.Find();
        Rec.TestField(Code);
        ClientFileName := '';
        UploadIntoStream('Select your picture', '', '', ClientFileName, InStr);
        if ClientFileName <> '' then
            FileName := FileManagement.GetFileName(ClientFileName);
        if FileName = '' then
            Error('');
        Clear(Rec.Picture);
        Rec.Picture.ImportStream(InStr, FileName);
        Rec.Modify(true);
    end;

}