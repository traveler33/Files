using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pelesys.Common;
using System.Collections;
using Pelesys.Web;
using Pelesys.Data;
using System.Data;


using DevExpress.Web.ASPxClasses;
using DevExpress.XtraScheduler;
using DevExpress.XtraScheduler.Native;
using DevExpress.Web.ASPxScheduler;
using DevExpress.Web.ASPxScheduler.Internal;
using DevExpress.Web.ASPxMenu;

namespace Pelesys.Scheduling.Web.Files
{
    public partial class Curriculum : PageBase
    {

        private List<Pelesys.Administration.Setting> oList = new List<Administration.Setting>();

        protected void Page_Load(object sender, EventArgs e)
        {
            Master.PageTitle = "Curriculum";
            Master.ShowPageTitle = true;
            Master.ShowphToolBar = false;
           // DropDownList2.Items.Add(new ListItem("Days", "Days"));

            //for (int n = 0; n <= 30; n++)
            //{ 
            //    chkBaseList.Items.Add ( new ListItem("Base" + n.ToString(),"Base" + n.ToString()));
            //    this.CheckBoxList1.Items.Add(new ListItem("32" + n.ToString(), "32" + n.ToString()));
            //    this.CheckBoxList2.Items.Add(new ListItem("Position-" + n.ToString(), "Position-" + n.ToString()));
            //    this.DropDownList1.Items.Add(new ListItem("Category-" + n.ToString(), "Category-" + n.ToString()));
            //    this.DropDownList2.Items.Add(new ListItem("Training Qua-" + n.ToString(), "Trainign Qua-" + n.ToString()));

            //    this.CheckBoxList3.Items.Add(new ListItem("Pre requistes for the attendance on the course" + n.ToString(), "Pre requistes for the attendance on the course" + n.ToString()));
            //}

            if (!IsPostBack)
            {


                //ddlWeeks.Items.Add( new ListItem( "Week 1", "Week 1"));
                //ddlWeeks.Items.Add(new ListItem("Week 2", "Week 1"));
                //ddlWeeks.Items.Add(new ListItem("Week 3", "Week 1"));
                //ddlWeeks.Items.Add(new ListItem("Week 4", "Week 1"));
                //ddlWeeks.Items.Add(new ListItem("Week 5", "Week 1"));

            //string CourseCode = Request.QueryStrning["Code"].ToString();
            //this.SearchTextBox1.Text = CourseCode;
            oList =
               Pelesys.Administration.Setting.LoadListWhere<Pelesys.Administration.Setting>("Where T.SettingID<16");
            gvweek1.DataSource = oList;
           gvweek1.DataBind();

            //lstCourseList.Items.Add(new ListItem("Airbus 722 - Intrduction"));
            //lstCourseList.Items.Add(new ListItem("Airbus 722 - Security Training 1"));
            //lstCourseList.Items.Add(new ListItem("Airbus 722 - Security Training 2"));
            //lstCourseList.Items.Add(new ListItem("Airbus 722 - Security Training 3"));
            //lstCourseList.Items.Add(new ListItem("Airbus 722 - Security Training 4"));
            //lstCourseList.Items.Add(new ListItem("Airbus 722- Summary"));


            //ASPxScheduler1.Start = DateTime.Today;
            //ASPxScheduler1.Theme = "Office2010Blue";
            //ASPxScheduler1.DayView.ShowWorkTimeOnly = true;
            //ASPxScheduler1.WorkWeekView.ShowWorkTimeOnly = true;

           gv.DataSource = Pelesys.Scheduling.ResourcePool.GetDataBy();
           gv.DataBind();}


            ddlTimeUnit.Items.Add(new ListItem("Day", "Day"));
            ddlTimeUnit1.Items.Add(new ListItem("Hour","Hour"));


            this.GridView4.DataSource = Administration.User.LoadListWhere<Administration.User>("Where T.UserID <7");
            this.GridView4.DataBind();


            ASPxScheduler1.DayView.Enabled = false;
            ASPxScheduler1.MonthView.Enabled = false;
            ASPxScheduler1.TimelineView.Enabled = false;
            ASPxScheduler1.WeekView.Enabled = false;

            ASPxScheduler1.Start = Convert.ToDateTime("2013-01-07");
            ASPxScheduler1.Theme = "iOS";
         
            ASPxScheduler1.WorkWeekView.ShowWorkTimeOnly = true;
            ASPxScheduler1.WorkWeekView.ShowMoreButtons = false;
            ASPxScheduler1.WorkWeekView.AppointmentDisplayOptions.StartTimeVisibility = AppointmentTimeVisibility.Never;
            ASPxScheduler1.WorkWeekView.AppointmentDisplayOptions.EndTimeVisibility = AppointmentTimeVisibility.Never;
            ASPxScheduler1.WorkWeekView.AppointmentDisplayOptions.TimeDisplayType = AppointmentTimeDisplayType.Text;
            ASPxScheduler1.TimelineView.AppointmentDisplayOptions.StatusDisplayType = AppointmentStatusDisplayType.Never;
            ASPxScheduler1.ActiveViewType = SchedulerViewType.WorkWeek;
           // ASPxScheduler1.WorkWeekView.WorkTime.Start = new TimeSpan(7, 0, 0);
          //  ASPxScheduler1.WorkWeekView.WorkTime.End = new TimeSpan(20, 0, 0);
            WeekDays weekdays = (WeekDays)0;
            weekdays |= WeekDays.Sunday;
            weekdays |= WeekDays.Monday;
            weekdays |= WeekDays.Tuesday;
            weekdays |= WeekDays.Wednesday;
            weekdays |= WeekDays.Thursday;
            weekdays |= WeekDays.Friday;
            weekdays |= WeekDays.Saturday;
           
            //ASPxScheduler1.BeginUpdate();
            //try {
            //    WorkDaysCollection workDays = ASPxScheduler1.WorkDays;
            //    workDays.Clear();
            //    workDays.Add(weekdays);
            //}
            //finally
            //{
            //    ASPxScheduler1.EndUpdate();
            //}
            SetDataSource();
           
        }

        private int count = 1;
        private int setCount = 1;
        protected void grid_HtmlRowCreated(object sender,
                            DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != DevExpress.Web.ASPxGridView.GridViewRowType.Data) return;
            Label ctrl = this.gvweek1.FindRowCellTemplateControl(e.VisibleIndex, null, "lblDay") as Label;
            //lblDuration
            Label ctrlduration = this.gvweek1.FindRowCellTemplateControl(e.VisibleIndex, null, "lblDuration") as Label;
            
            DropDownList ctrlCOURSE = this.gvweek1.FindRowCellTemplateControl(e.VisibleIndex, null, "ddlcourses") as DropDownList;
            if (ctrlCOURSE != null)
            {
                ctrlCOURSE.Items.Add(new ListItem("Lunch", "Lunch"));
                ctrlCOURSE.Items.Add(new ListItem("Airbus 320", "Airbus 320"));
                ctrlCOURSE.Items.Add(new ListItem("Airbus 321", "Airbus 321"));
                ctrlCOURSE.Items.Add(new ListItem("Airbus 322", "Airbus 322"));
                ctrlCOURSE.Items.Add(new ListItem("Airbus 323", "Airbus 323"));
                ctrlCOURSE.Items.Add(new ListItem("Airbus 324", "Airbus 324"));
                ctrlCOURSE.Items.Add(new ListItem("Airbus 325", "Airbus 325"));
            }
         
          //  Label ctrl = e.Row.FindControl("lblDay") as Label;
            if (ctrl != null)
            {
                ctrl.Text =count.ToString();
            }

            if (setCount == 2)
            {
                ctrlduration.Text = "1";
                ctrlCOURSE.SelectedIndex = 0;
              
            }
            else
            {
                ctrlduration.Text = "4";
                if (setCount == 1)
                {
                    ctrlCOURSE.SelectedIndex = count;
                }
                if (setCount == 3)
                {
                    ctrlCOURSE.SelectedIndex = count + 1;
                }
                //if (ctrlCOURSE != null)
                //{
                //    ctrlCOURSE.Items.Add(new ListItem("Airbus 320", "Airbus 320"));
                //}
            
            }
            if (setCount == 3)
            {
                count++;
                setCount = 0;
            }

            setCount++;
        }



        private static void SetupDefaultMappingsSiteMode(ASPxScheduler control)
        {
            ASPxSchedulerStorage storage = control.Storage;
            storage.BeginUpdate();
            try
            {
                //ASPxResourceMappingInfo resourceMappings = storage.Resources.Mappings;
                //resourceMappings.ResourceId = "OwnerId";
                //resourceMappings.Caption = "Caption";

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
               // appointmentMappings.ResourceId = "OwnerId";
                appointmentMappings.Status = "Status";
                appointmentMappings.Type = "EventType";
            }
            finally
            {
                storage.EndUpdate();
            }
        }

        protected void SetDataSource()
        {

            SetupDefaultMappingsSiteMode(ASPxScheduler1);
            
            // first day
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
            app1["StartTime"] = oToday.AddHours(8); ;
            app1["EndTime"] = oToday.AddHours(12);
            app1["Subject"] = "A320 Traing Class";
            app1["AllDay"] = false;
            app1["Description"] = "Security";
            app1["Label"] = "2";
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
            app2["Description"] = "Lunch";
            app2["Label"] = "4";
            //  app2["Location"] = "Vancouver";
            app2["Status"] = "0";
            app2["OwnerId"] = 1;
            Appts.Rows.Add(app2);

            DataRow app3 = Appts.NewRow();
            app3["id"] = 3;
            app3["StartTime"] = oToday.AddHours(13); ;
            app3["EndTime"] = oToday.AddHours(17);
            app3["Subject"] = "Security 2";
            app3["AllDay"] = false;
            app3["Description"] = "Random Check";
            app3["Label"] = "2";
            //    app3["Location"] = "Vancouver";
            app3["Status"] = "1";
            app3["OwnerId"] = 1;
            Appts.Rows.Add(app3);

            //second day

            DataRow app4 = Appts.NewRow();
            app4["id"] = 4;
            app4["StartTime"] = oToday.AddHours(24+8); ;
            app4["EndTime"] = oToday.AddHours(24+12);
            app4["Subject"] = "Engine Level 1";
            app4["AllDay"] = false;
            app4["Description"] = "Engine ABC";
            app4["Label"] = "2";
            app4["Location"] = "New York";
            app4["Status"] = "0";
            app4["OwnerId"] = 2;
            Appts.Rows.Add(app4);

            DataRow app5 = Appts.NewRow();
            app5["id"] = 5;
            app5["StartTime"] = oToday.AddHours(24 + 12); ;
            app5["EndTime"] = oToday.AddHours(24+13);
            app5["Subject"] = "Lunch Time";
            app5["AllDay"] = false;
            app5["Description"] = "Free lunch";
            app5["Label"] = "4";
            app5["Location"] = "New York";
            app5["Status"] = "0";
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
            app7["StartTime"] = oToday.AddHours(24 + 13); ;
            app7["EndTime"] = oToday.AddHours(24 + 17);
            app7["Subject"] = "Equipment Check";
            app7["AllDay"] = false;
            app7["Description"] = "Make sure Equipment works";
            app7["Label"] = "2";
            app7["Location"] = "Bejing";
            app7["Status"] = "0";
            app7["OwnerId"] = 3;
            Appts.Rows.Add(app7);


            //third day

            DataRow app8 = Appts.NewRow();
            app8["id"] = 5;
            app8["StartTime"] = oToday.AddHours(48 + 12); ;
            app8["EndTime"] = oToday.AddHours(48+ 13);
            app8["Subject"] = "Lunch Time";
            app8["AllDay"] = false;
            app8["Description"] = "Break";
            app8["Label"] = "4";
            app8["Location"] = "Bejing";
            app8["Status"] = "1";
            app8["OwnerId"] = 3;

            Appts.Rows.Add(app8);

            DataRow app9 = Appts.NewRow();
            app9["id"] = 6;
            app9["StartTime"] = oToday.AddHours(48 + 13); ;
            app9["EndTime"] = oToday.AddHours(48 + 17);
            app9["Subject"] = "Equipment replacement";
            app9["AllDay"] = false;
            app9["Description"] = "Equipment replacement summary";
            app9["Label"] = "2";
            app9["Location"] = "Bejing";
            app9["Status"] = "1";
            app9["OwnerId"] = 3;


            Appts.Rows.Add(app9);

            DataRow app10 = Appts.NewRow();
            app10["id"] = 6;
            app10["StartTime"] = oToday.AddHours(48 + 7); ;
            app10["EndTime"] = oToday.AddHours(48 + 12);
            app10["Subject"] = "Engine Level 2";
            app10["AllDay"] = false;
            app10["Description"] = "Engine Level 2";
            app10["Label"] = "2";
            app10["Location"] = "";
            app10["Status"] = "1";
            app10["OwnerId"] = 2;
            Appts.Rows.Add(app10);

            //fourth day

            DataRow app11 = Appts.NewRow();
            app11["id"] = 7;
            app11["StartTime"] = oToday.AddHours(72+ 7); ;
            app11["EndTime"] = oToday.AddHours(72 + 12);
            app11["Subject"] = "Engine Maintence Service";
            app11["AllDay"] = false;
            app11["Description"] = "Engine maintence server Level 1";
            app11["Label"] = "2";
            app11["Location"] = "Shanghai";
            app11["Status"] = "1";
            app11["OwnerId"] = 4;
            Appts.Rows.Add(app11);

            DataRow app12 = Appts.NewRow();
            app12["id"] = 8;
            app12["StartTime"] = oToday.AddHours(72+ 12); ;
            app12["EndTime"] = oToday.AddHours(72 + 13);
            app12["Subject"] = "Lunch Time";
            app12["AllDay"] = false;
            app12["Description"] = "Free lunch";
            app12["Label"] = "4";
            app12["Location"] = "Shanghai";
            app12["Status"] = "1";
            app12["OwnerId"] = 4;

            Appts.Rows.Add(app12);

            DataRow app13 = Appts.NewRow();
            app13["id"] = 9;
            app13["StartTime"] = oToday.AddHours(72 + 13); ;
            app13["EndTime"] = oToday.AddHours(72+ 18);
            app13["Subject"] = "Engine Maintance 2";
            app13["AllDay"] = false;
            app13["Description"] = "Engine Maintance ";
            app13["Label"] = "2";
            app13["Location"] = "Shanghai";
            app13["Status"] = "1";
            app13["OwnerId"] = 4;


            Appts.Rows.Add(app13);

            //fifth day
            DataRow app01 = Appts.NewRow();
            app01["id"] = 1;
            app01["StartTime"] = oToday.AddHours(96 + 9); ;
            app01["EndTime"] = oToday.AddHours(96 + 12);
            app01["Subject"] = "A320 Traing Class";
            app01["AllDay"] = false;
            app01["Description"] = "Security";
            app01["Label"] = "2";
            //   app1["Location"] = "Vancouver";
            app01["Status"] = "2";
            app01["OwnerId"] = 1;
            Appts.Rows.Add(app01);

            DataRow app02 = Appts.NewRow();
            app02["id"] = 2;
            app02["StartTime"] = oToday.AddHours(96 + 12); ;
            app02["EndTime"] = oToday.AddHours(96 + 13);
            app02["Subject"] = "Lunch Time";
            app02["AllDay"] = false;
            app02["Description"] = "Break";
            app02["Label"] = "4";
            //  app2["Location"] = "Vancouver";
            app02["Status"] = "1";
            app02["OwnerId"] = 1;
            Appts.Rows.Add(app02);

            DataRow app03 = Appts.NewRow();
            app03["id"] = 3;
            app03["StartTime"] = oToday.AddHours(96 + 13); ;
            app03["EndTime"] = oToday.AddHours(96 + 16);
            app03["Subject"] = "Security 2";
            app03["AllDay"] = false;
            app03["Description"] = "Random Check";
            app03["Label"] = "2";
            //    app3["Location"] = "Vancouver";
            app03["Status"] = "1";
            app03["OwnerId"] = 1;
            Appts.Rows.Add(app03);

           

        

            ASPxScheduler1.AppointmentDataSource = Appts;
            ASPxScheduler1.DataBind();
          //  ASPxScheduler1.GroupType = SchedulerGroupType.Resource;

        }


        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {

            e.Row.Attributes.Add("OnMouseOver", "this.style.backgroundColor = '#FEF5CA';");

            if (e.Row.RowIndex % 2 == 0)
            {

                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor = '#FFFFFF';");

            }

            else
            {

                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor = '#F5F5F5';");

            }

        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender,
    DevExpress.Web.ASPxGridView.ASPxGridViewTableDataCellEventArgs e)
        {
           // if (e.Cell.RowType == DataControlRowType.DataRow)
            {
               // e.Row.Attributes.Add("onClick", "SelectRow(this);");

                WebControl ctrl = e.Cell.FindControl("ASPxComboBox1") as WebControl;
           
                if (ctrl != null)
                {
                    DropDownList dd = ctrl as DropDownList;
                
                    for (int n = 1; n <= 20; n++)
                    {
                        dd.Items.Add(new ListItem(n.ToString(), n.ToString()));

                    }

                    dd.Items.Insert(0, new ListItem("", ""));

               
                }
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

        protected void grid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onClick", "SelectRow(this);");

                WebControl ctrl = e.Row.FindControl("DropDownList0") as WebControl;
                WebControl ctrl1 = e.Row.FindControl("DropDownList2") as WebControl; ;
                WebControl ctrl2 = e.Row.FindControl("DropDownList1") as WebControl; ;
                WebControl ctrl3 = e.Row.FindControl("DropDownList3") as WebControl; ;
                if (ctrl != null)
                {
                    DropDownList dd = ctrl as DropDownList;
                    DropDownList dd1 = ctrl1 as DropDownList;
                    DropDownList dd2 = ctrl2 as DropDownList;
                    DropDownList dd3 = ctrl3 as DropDownList;
                    for (int n = 1; n <= 20; n++)
                    {
                        dd.Items.Add(new ListItem(n.ToString(), n.ToString()));

                    }

                    dd.Items.Insert(0, new ListItem("", ""));

                    for (int n = 1; n <= 8; n++)
                    {

                        dd1.Items.Add(new ListItem(n.ToString(), n.ToString()));
                    }
                    dd1.Items.Insert(0, new ListItem("", ""));

                    dd2.DataSource = oList;
                    dd2.DataBind();
                    dd2.Items.Insert(0, new ListItem("", ""));

                    dd3.Items.Add(new ListItem("", ""));

                    dd3.Items.Add(new ListItem("Bin Yang", "Bin Yang"));
                    dd3.Items.Add(new ListItem("Robert Chen", "Robert Chen"));
                    dd3.Items.Add(new ListItem("Helen Zhang", "Helen Zhang"));
                    dd3.Items.Add(new ListItem("Kevin Chen ", ""));


                }
            }

        }


    }
}