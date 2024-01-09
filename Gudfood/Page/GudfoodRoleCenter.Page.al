page 50109 GudfoodRoleCenter
{
    PageType = RoleCenter;
    ApplicationArea = All;

    layout
    {
        area(RoleCenter)
        {
            part(Headline; GudfoodHeadline)
            {

            }
            part("Sales Order"; GudfoodOrderActivities)
            {
                ApplicationArea = All;
            }
        }
    }
}