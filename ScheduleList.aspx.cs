using System;
using System.Collections.Generic;
using System.Linq;
using Pelesys.Web;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using DevExpress.Web.ASPxClasses;
using DevExpress.XtraScheduler;
using DevExpress.XtraScheduler.Native;
using DevExpress.Web.ASPxScheduler;
using DevExpress.Web.ASPxScheduler.Internal;
using DevExpress.Web.ASPxMenu;

using DevExpress.Web.ASPxMenu;



namespace Pelesys.Scheduling.Web.Files
{
    public partial class ScheduleList : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime dStart = Convert.ToDateTime( "2012-01-01T09:00:00" );
             DateTime dEnd = Convert.ToDateTime( "2012-01-01T16:00:00" );

            TimeSpan oS = new TimeSpan(9,1,1);
            TimeSpan oE = new TimeSpan(15,1,1);

        
                   
            Master.ShowPageTitle = false;
            Master.ShowphToolBar = false;

            ASPxScheduler1.Start = DateTime.Today;
            ASPxScheduler1.Theme = "iOS";
            ASPxScheduler1.DayView.ShowWorkTimeOnly = true;
            ASPxScheduler1.WorkWeekView.ShowWorkTimeOnly = true;

            List<Administration.User> ou = new List<Administration.User>();
          //  ASPxScheduler1.AppointmentDataSource=ou;
            
         //   ASPxScheduler1.Views.DayView.WorkTime = oT;
          /*
            The following code utilizes the DataHelper class, which is implemented
            solely for the ASPxScheduler Demo project
            It is intended to hide unnecessary details and clarify the main idea.
            Data Binding section modules:
              ~/DataBinding/BoundMode.aspx for MS Access database
              ~/DataBinding/ListBoundMode.aspx for the object with IBindingList interface.
              ~/DataBinding/XPOBoundMode.aspx for XPO data framework.
        */
    //    DataHelper.SetupDefaultMappings(ASPxScheduler1);
    //    DataHelper.ProvideRowInsertion(ASPxScheduler1, DataSource1.AppointmentDataSource);
    //    DataSource1.AttachTo(ASPxScheduler1);
       if(!IsPostBack)
          ASPxScheduler1.DayView.FirstVisibleResourceIndex = 1;
         }


        protected void ASPxScheduler1_PreparePopupMenu(object sender,
      DevExpress.Web.ASPxScheduler.PopupMenuShowingEventArgs e)
        {

            //string ItemId = ASPxScheduler1.SchedulerMenuItemId; 
            ASPxSchedulerPopupMenu menu = e.Menu;
            DevExpress.Web.ASPxMenu.MenuItemCollection menuItems = menu.Items;
            // Check whether an empty cell is clicked rather than an appointment.
            if (menu.Id.Equals(SchedulerMenuItemId.DefaultMenu))
            {
                ClearUnusedDefaultMenuItems(menu);
                AddScheduleNewEventSubMenu(menu, "New Schedule");
            }
        }

        protected void AddScheduleNewEventSubMenu(ASPxSchedulerPopupMenu menu,
    string caption)
        {
            DevExpress.Web.ASPxMenu.MenuItem newWithTemplateItem = new DevExpress.Web.ASPxMenu.MenuItem(caption, "TemplateEvents");
            newWithTemplateItem.BeginGroup = true;
            menu.Items.Insert(0, newWithTemplateItem);
            AddTemplatesSubMenuItems(newWithTemplateItem);
        }



        private static void AddTemplatesSubMenuItems(DevExpress.Web.ASPxMenu.MenuItem parentMenuItem)
        {
           

            parentMenuItem.Items.Add(new DevExpress.Web.ASPxMenu.MenuItem("New Curriculum",
                "NewCurriculumId"));
            parentMenuItem.Items.Add(new DevExpress.Web.ASPxMenu.MenuItem("New Meeting", "NewMeetingId"));
            parentMenuItem.Items.Add(new DevExpress.Web.ASPxMenu.MenuItem("New Simple Event", "NewEventId"));
         
        }



        protected void ClearUnusedDefaultMenuItems(ASPxSchedulerPopupMenu menu)
        {
            RemoveMenuItem(menu, "NewAppointment");
            RemoveMenuItem(menu, "NewAllDayEvent");
            RemoveMenuItem(menu, "NewRecurringAppointment");
            RemoveMenuItem(menu, "NewRecurringEvent");
            RemoveMenuItem(menu, "GotoToday");
            RemoveMenuItem(menu, "GotoDate");
            RemoveMenuItem(menu, "6Minutes");
        }

        protected void RemoveMenuItem(ASPxSchedulerPopupMenu menu, string menuItemName)
        {
            DevExpress.Web.ASPxMenu.MenuItem item = menu.Items.FindByName(menuItemName);
            if (item != null)
                menu.Items.Remove(item);
        }


    }



}