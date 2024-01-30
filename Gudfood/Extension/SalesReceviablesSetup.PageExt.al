pageextension 50100 "Gudfood Sales & Rec. Setup" extends "Sales & Receivables Setup"
{
    layout
    {
        addlast("Number Series")
        {
            field("Gudfood Item Nos."; Rec."Gudfood Item Nos.")
            {
                ApplicationArea = All;
            }
            field("Gudfood Order Nos."; Rec."Gudfood Order Nos.")
            {
                ApplicationArea = All;
            }
            field("Gudfood Posted Order Nos."; Rec."Gudfood Posted Order Nos.")
            {
                ApplicationArea = All;
            }
        }
    }
}