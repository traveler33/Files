using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pelesys.Web;
using System.Data;

using DevExpress.Web.ASPxClasses;
using DevExpress.XtraScheduler;
using DevExpress.XtraScheduler.Native;
using DevExpress.Web.ASPxScheduler;
using DevExpress.Web.ASPxScheduler.Internal;
using DevExpress.Web.ASPxMenu;



namespace   Pelesys.Scheduling.Web.Files
{
	public partial class CalendarView : PageBase
	{
        ASPxSchedulerStorage Storage { get { return ASPxScheduler1.Storage; } }

		protected void Page_Load(object sender, EventArgs e)
		{
          // Master.ShowPageTitle = false;
          // Master.Master.ShowphToolBar = false;
            Master.PageTitle = "Schedule View";
          //  Master.ShowPageTitle = false;
            Master.ShowphToolBar = false;
            //ListBox1.Items.Add(new ListItem("All Vancouver Center"));
            //ListBox1.Items.Add(new ListItem("Instructors at Vancouver Center"));
            //ListBox1.Items.Add(new ListItem("Student at BaijingCenter"));
            //ListBox1.Items.Add(new ListItem("Month view at Vancouver Center"));
            //ListBox1.Items.Add(new ListItem("All Simutors Today at Vancouver Center"));
            //ListBox1.Items.Add(new ListItem("Sick leave at New York Center"));
            //ListBox1.Items.Add(new ListItem("Simulator Maintance at New York Center"));

            //ListBox1.SelectedIndex = 0;

         
          // HasHelpPage = false;
            DateTime dStart = Convert.ToDateTime("2012-01-01T09:00:00");
            DateTime dEnd = Convert.ToDateTime("2012-01-01T16:00:00");

            TimeSpan oS = new TimeSpan(9, 1, 1);
            TimeSpan oE = new TimeSpan(15, 1, 1);



            Master.ShowPageTitle = false;
            Master.ShowphToolBar = false;
            
            ASPxScheduler1.Start = DateTime.Today;
            ASPxScheduler1.Theme = "iOS";
            ASPxScheduler1.DayView.ShowWorkTimeOnly = true;
            ASPxScheduler1.WorkWeekView.ShowWorkTimeOnly = true;
            ASPxScheduler1.TimelineView.ShowMoreButtons = false;
            ASPxScheduler1.TimelineView.AppointmentDisplayOptions.StartTimeVisibility = AppointmentTimeVisibility.Always;
            ASPxScheduler1.TimelineView.AppointmentDisplayOptions.EndTimeVisibility = AppointmentTimeVisibility.Always;
            ASPxScheduler1.TimelineView.AppointmentDisplayOptions.TimeDisplayType = AppointmentTimeDisplayType.Text;
            ASPxScheduler1.OptionsBehavior.ShowTimeMarker = false;
            ASPxScheduler1.Views.TimelineView.Styles.VerticalResourceHeader.Width = new Unit(150);
            ASPxScheduler1.Views.TimelineView.Styles.VerticalResourceHeader.HorizontalAlign = HorizontalAlign.Left;
           // ASPxScheduler1.OptionsBehavior.ClientTimeZoneId = 
          //  ASPxScheduler1.TimelineView.Styles.TimelineCellBody.Height = 200;
            //ASPxScheduler1.
            ASPxScheduler1.TimelineView.CellAutoHeightOptions.Mode = AutoHeightMode.FitToContent;
          //  ASPxScheduler1.TimelineView.CellAutoHeightOptions.MaxHeight = 25;
           // ASPxScheduler1.TimelineV


            ASPxScheduler1.WeekView.ShowMoreButtons = false;
            ASPxScheduler1.MonthView.ShowMoreButtons = false;
            ASPxScheduler1.MonthView.CellAutoHeightOptions.Mode = AutoHeightMode.FitToContent;
           // ASPxScheduler1.MonthView.CellAutoHeightOptions.MaxHeight = 25;


            ASPxScheduler1.TimelineView.AppointmentDisplayOptions.TimeDisplayType = AppointmentTimeDisplayType.Text;
            ASPxScheduler1.TimelineView.AppointmentDisplayOptions.StartTimeVisibility = AppointmentTimeVisibility.Never;
            ASPxScheduler1.TimelineView.AppointmentDisplayOptions.EndTimeVisibility = AppointmentTimeVisibility.Never;
            ASPxScheduler1.TimelineView.AppointmentDisplayOptions.StatusDisplayType = AppointmentStatusDisplayType.Never;


            List<Administration.User> ou = new List<Administration.User>();

            if (!IsPostBack)
            {
                ASPxScheduler1.DayView.FirstVisibleResourceIndex = 1;
                ASPxScheduler1.ActiveViewType = SchedulerViewType.Month;
                string csname = "HideSearchResult";
                Type cstype = this.GetType();
                ClientScriptManager cs = Page.ClientScript;
                if ( !cs.IsClientScriptBlockRegistered(cstype, csname ))
                {
                    string js = "$('#grid').hide();   $('#searchResultWidnow').hide();";
                    cs.RegisterStartupScript(cstype, csname, js, true);

                }

                DataTable dt2 = new DataTable();
                dt2.Columns.Add("SettingID", typeof(int)); ;
                dt2.Columns.Add("Name", typeof(string)); ;


                DataRow odr = dt2.NewRow();
                odr["Name"] = "A320 Traing Class 122";

                dt2.Rows.Add(odr);

                DataRow odr1 = dt2.NewRow();
                odr1["Name"] = "A320 Traing Class 123";

                dt2.Rows.Add(odr1);
                DataRow odr2 = dt2.NewRow();
                odr2["Name"] = "A320 Traing Class 122";

                dt2.Rows.Add(odr2);

                DataRow odr3 = dt2.NewRow();
                odr3["Name"] = "A320 Traing Class 123";

                dt2.Rows.Add(odr3);
                DataRow odr4 = dt2.NewRow();
                odr4["Name"] = "A320 Traing Class 124";

                dt2.Rows.Add(odr4);

                DataRow odr5 = dt2.NewRow();
                odr5["Name"] = "A320 Traing Class 125";

                dt2.Rows.Add(odr5);

                DataRow odr6 = dt2.NewRow();
                odr6["Name"] = "A320 Traing Class 1220";

                dt2.Rows.Add(odr6);

                DataRow odr7 = dt2.NewRow();
                odr7["Name"] = "A320 Traing Class 1230";

                dt2.Rows.Add(odr7);

                gvEvents.DataSource = dt2;
                gvEvents.DataBind();



           
            }

            SetDataSource();
         
		}


        protected void SetDataSource()
        {

            SetupDefaultMappingsSiteMode(ASPxScheduler1);
           FillResources(this.ASPxScheduler1, 6);

            DataTable Appts = new DataTable();
            Appts.Columns.Add("id", typeof(int)); ;
            Appts.Columns.Add("StartTime", typeof(DateTime)); ;
            Appts.Columns.Add("EndTime", typeof(DateTime));
            Appts.Columns.Add("Subject", typeof(string)); ;
            Appts.Columns.Add("AllDay", typeof(bool));
            Appts.Columns.Add("Description", typeof(string)); ;
            Appts.Columns.Add("Label", typeof(string));
            Appts.Columns.Add("Location", typeof(string)); ;
            Appts.Columns.Add("Status", typeof(string));
            Appts.Columns.Add("OwnerId", typeof(int));

            DateTime oToday = DateTime.Today;

            DataRow app1 = Appts.NewRow();
            app1["id"] = 1;
            app1["StartTime"] = oToday.AddHours(9); ;
            app1["EndTime"] = oToday.AddHours(12);
            app1["Subject"] = "A320 Traing Class";
            app1["AllDay"] = false;
            app1["Description"] = "Security";
            app1["Label"] = "1";
         //   app1["Location"] = "Vancouver";
            app1["Status"] = "2";
            app1["OwnerId"] = 1;
            Appts.Rows.Add(app1);

            DataRow app2 = Appts.NewRow();
            app2["id"] = 2;
            app2["StartTime"] = oToday.AddHours(12); ;
            app2["EndTime"] = oToday.AddHours(13);
            app2["Subject"] = "Lunch Time";
            app2["AllDay"] = false;
            app2["Description"] = "Free lunch: Chinese Food";
            app2["Label"] = "3";
          //  app2["Location"] = "Vancouver";
            app2["Status"] = "1";
            app2["OwnerId"] = 1;
            Appts.Rows.Add(app2);

            DataRow app3 = Appts.NewRow();
            app3["id"] = 3;
            app3["StartTime"] = oToday.AddHours(13); ;
            app3["EndTime"] = oToday.AddHours(16);
            app3["Subject"] = "Security 2";
            app3["AllDay"] = false;
            app3["Description"] = "Random Check";
            app3["Label"] = "5";
        //    app3["Location"] = "Vancouver";
            app3["Status"] = "1";
            app3["OwnerId"] = 1;
            Appts.Rows.Add(app3);

            DataRow app4 = Appts.NewRow();
            app4["id"] = 4;
            app4["StartTime"] = oToday.AddHours(9); ;
            app4["EndTime"] = oToday.AddHours(12);
            app4["Subject"] = "Engine Level 1";
            app4["AllDay"] = false;
            app4["Description"] = "Engine ABC";
            app4["Label"] = "6";
            app4["Location"] = "New York";
            app4["Status"] = "1";
            app4["OwnerId"] = 2;
            Appts.Rows.Add(app4);

            DataRow app5 = Appts.NewRow();
            app5["id"] = 5;
            app5["StartTime"] = oToday.AddHours(12); ;
            app5["EndTime"] = oToday.AddHours(13);
            app5["Subject"] = "Lunch Time";
            app5["AllDay"] = false;
            app5["Description"] = "Free lunch";
            app5["Label"] = "3";
            app5["Location"] = "New York";
            app5["Status"] = "1";
            app5["OwnerId"] = 2;

            Appts.Rows.Add(app5);

            //DataRow app6 = Appts.NewRow();
            //app6["id"] = 6;
            //app6["StartTime"] = oToday.AddHours(13); ;
            //app6["EndTime"] = oToday.AddHours(17);
            //app6["Subject"] = "Engine Level 2";
            //app6["AllDay"] = false;
            //app6["Description"] = "Engine Level 2";
            //app6["Label"] = "4";
            //app6["Location"] = "New York";
            //app6["Status"] = "1";
            //app6["OwnerId"] = 2;
            //Appts.Rows.Add(app6);

            DataRow app7 = Appts.NewRow();
            app7["id"] = 7;
            app7["StartTime"] = oToday.AddHours(9); ;
            app7["EndTime"] = oToday.AddHours(12);
            app7["Subject"] = "Equipment Check";
            app7["AllDay"] = false;
            app7["Description"] = "Make sure Equipment works";
            app7["Label"] = "10";
            app7["Location"] = "Bejing";
            app7["Status"] = "1";
            app7["OwnerId"] = 3;
            Appts.Rows.Add(app7);

            DataRow app8 = Appts.NewRow();
            app8["id"] = 5;
            app8["StartTime"] = oToday.AddHours(12); ;
            app8["EndTime"] = oToday.AddHours(13);
            app8["Subject"] = "Lunch Time";
            app8["AllDay"] = false;
            app8["Description"] = "Free lunch";
            app8["Label"] = "3";
            app8["Location"] = "Bejing";
            app8["Status"] = "1";
            app8["OwnerId"] = 3;

            Appts.Rows.Add(app8);

            DataRow app9 = Appts.NewRow();
            app9["id"] = 6;
            app9["StartTime"] = oToday.AddHours(13); ;
            app9["EndTime"] = oToday.AddHours(17);
            app9["Subject"] = "Equipment replacement";
            app9["AllDay"] = false;
            app9["Description"] = "Equipment replacement summary";
            app9["Label"] = "8";
            app9["Location"] = "Bejing";
            app9["Status"] = "1";
            app9["OwnerId"] = 3;


            Appts.Rows.Add(app9);

            DataRow app10 = Appts.NewRow();
            app10["id"] = 6;
            app10["StartTime"] = oToday.AddHours(13); ;
            app10["EndTime"] = oToday.AddHours(17);
            app10["Subject"] = "Engine Level 2";
            app10["AllDay"] = false;
            app10["Description"] = "Engine Level 2";
            app10["Label"] = "4";
            app10["Location"] = "New York";
            app10["Status"] = "1";
            app10["OwnerId"] = 2;
            Appts.Rows.Add(app10);

            DataRow app11 = Appts.NewRow();
            app11["id"] = 7;
            app11["StartTime"] = oToday.AddHours(9); ;
            app11["EndTime"] = oToday.AddHours(12);
            app11["Subject"] = "Engine Maintence Service";
            app11["AllDay"] = false;
            app11["Description"] = "Engine maintence server Level 1";
            app11["Label"] = "5";
            app11["Location"] = "Shanghai";
            app11["Status"] = "1";
            app11["OwnerId"] = 4;
            Appts.Rows.Add(app11);

            DataRow app12 = Appts.NewRow();
            app12["id"] = 8;
            app12["StartTime"] = oToday.AddHours(12); ;
            app12["EndTime"] = oToday.AddHours(13);
            app12["Subject"] = "Lunch Time";
            app12["AllDay"] = false;
            app12["Description"] = "Free lunch";
            app12["Label"] = "3";
            app12["Location"] = "Shanghai";
            app12["Status"] = "1";
            app12["OwnerId"] = 4;

            Appts.Rows.Add(app12);

            DataRow app13 = Appts.NewRow();
            app13["id"] = 9;
            app13["StartTime"] = oToday.AddHours(13); ;
            app13["EndTime"] = oToday.AddHours(14);
            app13["Subject"] = "Engine Maintance 2";
            app13["AllDay"] = false;
            app13["Description"] = "Engine Maintance ";
            app13["Label"] = "10";
            app13["Location"] = "Shanghai";
            app13["Status"] = "1";
            app13["OwnerId"] = 4;


            Appts.Rows.Add(app13);


            DataRow app01 = Appts.NewRow();
            app01["id"] = 1;
            app01["StartTime"] = oToday.AddHours(24+9); ;
            app01["EndTime"] = oToday.AddHours(24+12);
            app01["Subject"] = "A320 Traing Class";
            app01["AllDay"] = false;
            app01["Description"] = "Security";
            app01["Label"] = "1";
            //   app1["Location"] = "Vancouver";
            app01["Status"] = "2";
            app01["OwnerId"] = 1;
            Appts.Rows.Add(app01);

            DataRow app02 = Appts.NewRow();
            app02["id"] = 2;
            app02["StartTime"] = oToday.AddHours(24+12); ;
            app02["EndTime"] = oToday.AddHours(24+13);
            app02["Subject"] = "Lunch Time";
            app02["AllDay"] = false;
            app02["Description"] = "Free lunch: Chinese Food";
            app02["Label"] = "3";
            //  app2["Location"] = "Vancouver";
            app02["Status"] = "1";
            app02["OwnerId"] = 1;
            Appts.Rows.Add(app02);

            DataRow app03 = Appts.NewRow();
            app03["id"] = 3;
            app03["StartTime"] = oToday.AddHours(24+13); ;
            app03["EndTime"] = oToday.AddHours(24+ 16);
            app03["Subject"] = "Security 2";
            app03["AllDay"] = false;
            app03["Description"] = "Random Check";
            app03["Label"] = "5";
            //    app3["Location"] = "Vancouver";
            app03["Status"] = "1";
            app03["OwnerId"] = 1;
            Appts.Rows.Add(app03);

            DataRow app04 = Appts.NewRow();
            app04["id"] = 4;
            app04["StartTime"] = oToday.AddHours(24+9); ;
            app04["EndTime"] = oToday.AddHours(24+12);
            app04["Subject"] = "Engine Level 1";
            app04["AllDay"] = false;
            app04["Description"] = "Engine ABC";
            app04["Label"] = "6";
            app04["Location"] = "New York";
            app04["Status"] = "1";
            app04["OwnerId"] = 2;
            Appts.Rows.Add(app04);

            DataRow app05 = Appts.NewRow();
            app05["id"] = 5;
            app05["StartTime"] = oToday.AddHours(24+ 12); ;
            app05["EndTime"] = oToday.AddHours(24+13);
            app05["Subject"] = "Lunch Time";
            app05["AllDay"] = false;
            app05["Description"] = "Free lunch";
            app05["Label"] = "3";
            app05["Location"] = "New York";
            app05["Status"] = "1";
            app05["OwnerId"] = 2;

            Appts.Rows.Add(app05);

            //DataRow app6 = Appts.NewRow();
            //app6["id"] = 6;
            //app6["StartTime"] = oToday.AddHours(13); ;
            //app6["EndTime"] = oToday.AddHours(17);
            //app6["Subject"] = "Engine Level 2";
            //app6["AllDay"] = false;
            //app6["Description"] = "Engine Level 2";
            //app6["Label"] = "4";
            //app6["Location"] = "New York";
            //app6["Status"] = "1";
            //app6["OwnerId"] = 2;
            //Appts.Rows.Add(app6);

            DataRow app07 = Appts.NewRow();
            app07["id"] = 7;
            app07["StartTime"] = oToday.AddHours(24+9); ;
            app07["EndTime"] = oToday.AddHours(24+ 12);
            app07["Subject"] = "Equipment Check";
            app07["AllDay"] = false;
            app07["Description"] = "Make sure Equipment works";
            app07["Label"] = "10";
            app07["Location"] = "Bejing";
            app07["Status"] = "1";
            app07["OwnerId"] = 3;
            Appts.Rows.Add(app07);

            DataRow app08 = Appts.NewRow();
            app08["id"] = 5;
            app08["StartTime"] = oToday.AddHours(24+ 12); ;
            app08["EndTime"] = oToday.AddHours(24+13);
            app08["Subject"] = "Lunch Time";
            app08["AllDay"] = false;
            app08["Description"] = "Free lunch";
            app08["Label"] = "3";
            app08["Location"] = "Bejing";
            app08["Status"] = "1";
            app08["OwnerId"] = 3;

            Appts.Rows.Add(app08);

            DataRow app09 = Appts.NewRow();
            app09["id"] = 6;
            app09["StartTime"] = oToday.AddHours(24 + 13); ;
            app09["EndTime"] = oToday.AddHours(24+ 17);
            app09["Subject"] = "Equipment replacement";
            app09["AllDay"] = false;
            app09["Description"] = "Equipment replacement summary";
            app09["Label"] = "8";
            app09["Location"] = "Bejing";
            app09["Status"] = "1";
            app09["OwnerId"] = 3;


            Appts.Rows.Add(app09);

            DataRow app010 = Appts.NewRow();
            app010["id"] = 6;
            app010["StartTime"] = oToday.AddHours(24+13); ;
            app010["EndTime"] = oToday.AddHours(24+ 17);
            app010["Subject"] = "Engine Level 2";
            app010["AllDay"] = false;
            app010["Description"] = "Engine Level 2";
            app010["Label"] = "4";
            app010["Location"] = "New York";
            app010["Status"] = "1";
            app010["OwnerId"] = 2;
            Appts.Rows.Add(app010);

            DataRow app011 = Appts.NewRow();
            app011["id"] = 7;
            app011["StartTime"] = oToday.AddHours(24+9); ;
            app011["EndTime"] = oToday.AddHours(24+12);
            app011["Subject"] = "Engine Maintence Service";
            app011["AllDay"] = false;
            app011["Description"] = "Engine maintence server Level 1";
            app011["Label"] = "5";
            app011["Location"] = "Shanghai";
            app011["Status"] = "1";
            app011["OwnerId"] = 4;
            Appts.Rows.Add(app011);

            DataRow app012 = Appts.NewRow();
            app012["id"] = 8;
            app012["StartTime"] = oToday.AddHours(24+12); ;
            app012["EndTime"] = oToday.AddHours(24+13);
            app012["Subject"] = "Lunch Time";
            app012["AllDay"] = false;
            app012["Description"] = "Free lunch";
            app012["Label"] = "3";
            app012["Location"] = "Shanghai";
            app012["Status"] = "1";
            app012["OwnerId"] = 4;

            Appts.Rows.Add(app012);

            DataRow app013 = Appts.NewRow();
            app013["id"] = 9;
            app013["StartTime"] = oToday.AddHours(24+13); ;
            app013["EndTime"] = oToday.AddHours(24+14);
            app013["Subject"] = "Engine Maintance 2";
            app013["AllDay"] = false;
            app013["Description"] = "Engine Maintance ";
            app013["Label"] = "10";
            app013["Location"] = "Shanghai";
            app013["Status"] = "1";
            app013["OwnerId"] = 4;


            Appts.Rows.Add(app013);


            ASPxScheduler1.AppointmentDataSource = Appts;
            ASPxScheduler1.DataBind();
            ASPxScheduler1.GroupType = SchedulerGroupType.Resource;
                    
        }

        protected void Search_click(Object sender, EventArgs e)
        {
            DataTable dt1 = new DataTable();
            dt1.Columns.Add("SettingID", typeof(int)); ;
            dt1.Columns.Add("Name", typeof(string)); ;
            dt1.Columns.Add("Date", typeof(string));
          


            DataRow odtr = dt1.NewRow();
            odtr["Name"] = "A320 Traing Class";
            odtr["Date"] = "2012-12-12 to 2012-12-24";         
            dt1.Rows.Add(odtr);



            DataRow odtr1 = dt1.NewRow();
            odtr1["Name"] = "A320 Traing Class";
            odtr1["Date"] = "2012-12-12 to 2012-12-24";
            dt1.Rows.Add(odtr1);

            DataRow odtr2 = dt1.NewRow();

            odtr2["Name"] = "A320 2012 Traning Summary";
            odtr2["Date"] = "2012-12-12 to 2012-12-24";
            dt1.Rows.Add(odtr2);


            DataRow odtr3 = dt1.NewRow();
            odtr3["Name"] = "A320 2013 Traing New Class";
            odtr3["Date"] = "2012-12-12 to 2012-12-24";
            dt1.Rows.Add(odtr3);


            DataRow odtr5 = dt1.NewRow();
            odtr5["Name"] = "A320 Last Traing Class";
            odtr5["Date"] = "2012-12-12 to 2012-12-24";
            dt1.Rows.Add(odtr5);

            DataRow odtr6 = dt1.NewRow();
            odtr6["Name"] = "A320 Traing Class";
            odtr6["Date"] = "2012-12-12 to 2012-12-24";
            dt1.Rows.Add(odtr6);



            DataRow odtr7 = dt1.NewRow();
            odtr7["Name"] = "A320 Traing Class";
            odtr7["Date"] = "2012-12-12 to 2012-12-24";
            dt1.Rows.Add(odtr7);

            DataRow odtr8 = dt1.NewRow();

            odtr8["Name"] = "A320 Traing Class";
            odtr8["Date"] = "2012-12-12 to 2012-12-24";
            dt1.Rows.Add(odtr8);


            DataRow odtr9 = dt1.NewRow();
            odtr9["Name"] = "A320 Traing Class";
            odtr9["Date"] = "2012-12-12 to 2012-12-24";
            dt1.Rows.Add(odtr9);


            DataRow odtr10 = dt1.NewRow();
            odtr10["Name"] = "A320 Traing Class";
            odtr10["Date"] = "2012-12-12 to 2012-12-24";
            dt1.Rows.Add(odtr10);


            DataRow odtr11 = dt1.NewRow();
            odtr11["Name"] = "A320 Traing Class";
            odtr11["Date"] = "2012-12-12 to 2012-12-24";
            dt1.Rows.Add(odtr11);


            DataRow odtr12 = dt1.NewRow();
            odtr12["Name"] = "A320 Traing Class";
            odtr12["Date"] = "2012-12-12 to 2012-12-24";
            dt1.Rows.Add(odtr12);

            gv.DataSource = dt1;
            gv.DataBind();




        


        
        }


        public void CourseShowListView(object sender, System.EventArgs e)
        {
            //if (chkListView.Checked)
            //{
            //    string msg = "iframeGotoSechduleListViewPage('')";
            //    Guid oguid = new Guid();
            //    //TriggerResource() 
            //    ScriptManager.RegisterStartupScript(UpdatePanel1, this.GetType(), oguid.ToString(), msg, true);
            //}
        
        
        
        }


        public void ShowListView(object sender, System.EventArgs e)
        {
            //if (chkShowListView.Checked)
            //{
            //    string msg = "iframeGotoSechduleListViewPage('')";
            //    Guid oguid = new Guid();
            //    //TriggerResource() 
            //    ScriptManager.RegisterStartupScript(UpdatePanel1, this.GetType(), oguid.ToString(), msg, true);
            
            //}

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

        //protected void ASPxScheduler1_AppointmentInserted(object sender, PersistentObjectsEventArgs e)
        //{
        //    SetAppointmentId(sender, e);
        //}
        //protected void appointmentsDataSource_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
        //{
        //    this.lastInsertedAppointmentId = e.ReturnValue;
        //}
        //void SetAppointmentId(object sender, PersistentObjectsEventArgs e)
        //{
        //    ASPxSchedulerStorage storage = (ASPxSchedulerStorage)sender;
        //    Appointment apt = (Appointment)e.Objects[0];
        //    storage.SetAppointmentId(apt, this.lastInsertedAppointmentId);
        //}


        public static void FillResources(ASPxScheduler control, int count)
        {
            ASPxSchedulerStorage storage = control.Storage;
            string[] Resources = new string[] { "Traning Room A", "Traning Room B", "Traning Romm C", "Traning Room D", "Traning Room E", "Traning Romm F" };
           int[] ResourceID = new int[] { 1, 2, 3, 4, 5, 6 };

            ResourceCollection resources = storage.Resources.Items;
            storage.BeginUpdate();
            try
            {
                int cnt = Math.Min(count, Resources.Length);
                for (int i = 1; i <= cnt; i++)
                {
                    resources.Add(new DevExpress.XtraScheduler.Resource(i, Resources[i - 1]));
                }
            }
            finally
            {
                storage.EndUpdate();
            }
        }

        protected void ASPxScheduler1_HtmlTimeCellPrepared(object handler, DevExpress.Web.ASPxScheduler.ASPxSchedulerTimeCellPreparedEventArgs e)
        {
            if ((e.View.Type == SchedulerViewType.Day) || (e.View.Type == SchedulerViewType.WorkWeek) || (e.View.Type == SchedulerViewType.Week) || (e.View.Type == SchedulerViewType.Month))
            {
                if (e.Interval.IntersectsWith(new TimeInterval(e.Interval.Start.Date.AddHours(8), e.Interval.Start.Date.AddHours(16))))
                    e.Cell.BackColor = System.Drawing.Color.FromArgb(255, 255, 255);
                else
                    e.Cell.BackColor = System.Drawing.Color.FromArgb(255, 255, 255);
            }
            else
            {
                if (e.Interval.IntersectsWith(new TimeInterval(e.Interval.Start.Date.AddHours(8), e.Interval.Start.Date.AddHours(16))))
                    e.Cell.BackColor = System.Drawing.Color.FromArgb(255, 255, 255);
                else
                    e.Cell.BackColor = System.Drawing.Color.FromArgb(255, 255, 255);
            }
        }

        private static void SetupDefaultMappingsSiteMode(ASPxScheduler control)
        {
            ASPxSchedulerStorage storage = control.Storage;
            storage.BeginUpdate();
            try
            {
                ASPxResourceMappingInfo resourceMappings = storage.Resources.Mappings;
                resourceMappings.ResourceId = "OwnerId";
                resourceMappings.Caption = "Caption";

                ASPxAppointmentMappingInfo appointmentMappings = storage.Appointments.Mappings;
                appointmentMappings.AppointmentId = "Id";
                appointmentMappings.Start = "StartTime";
                appointmentMappings.End = "EndTime";
                appointmentMappings.Subject = "Subject";
                appointmentMappings.AllDay = "AllDay";
                appointmentMappings.Description = "Description";
                appointmentMappings.Label = "Label";
                appointmentMappings.Location = "Location";
                appointmentMappings.RecurrenceInfo = "RecurrenceInfo";
                appointmentMappings.ReminderInfo = "ReminderInfo";
                appointmentMappings.ResourceId = "OwnerId";
                appointmentMappings.Status = "Status";
                appointmentMappings.Type = "EventType";
            }
            finally
            {
                storage.EndUpdate();
            }
        }

	}
}