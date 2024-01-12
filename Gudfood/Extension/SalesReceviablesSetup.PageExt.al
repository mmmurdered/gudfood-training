pageextension 50100 "Gudfood Sales & Rec. Setup" extends "Sales & Receivables Setup"
{
    layout
    {
        addlast("Number Series")
        {
            field("Gudfood Item Nos."; Rec."Gudfood Item Nos.")
            {
                ApplicationArea = all;
            }
            field("Gudfood Order Nos."; Rec."Gudfood Order Nos.")
            {
                ApplicationArea = all;
            }
            field("Gudfood Posted Order Nos."; Rec."Gudfood Posted Order Nos.")
            {
                ApplicationArea = all;
            }
        }
    }
}