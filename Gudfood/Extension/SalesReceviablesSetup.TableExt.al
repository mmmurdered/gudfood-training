tableextension 50100 "Gudfood Sales & Rec. Setup" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; "Gudfood Order Nos."; Code[20])
        {
            Caption = 'Gudfood Order Nos.';
            TableRelation = "No. Series";
        }
        field(50101; "Gudfood Item Nos."; Code[20])
        {
            Caption = 'Gudfood Item Nos.';
            TableRelation = "No. Series";
        }
        field(50102; "Gudfood Posted Order Nos."; Code[20])
        {
            Caption = 'Gudfood Posted Item Nos.';
            TableRelation = "No. Series";
        }
    }
}