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


                ddlWeeks.Items.Add( new ListItem( "Week 1", "Week 1"));
                ddlWeeks.Items.Add(new ListItem("Week 2", "Week 1"));
                ddlWeeks.Items.Add(new ListItem("Week 3", "Week 1"));
                ddlWeeks.Items.Add(new ListItem("Week 4", "Week 1"));
                ddlWeeks.Items.Add(new ListItem("Week 5", "Week 1"));

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


            ASPxScheduler1.Start = DateTime.Today;
            ASPxScheduler1.Theme = "Office2010Blue";
            ASPxScheduler1.DayView.ShowWorkTimeOnly = true;
            ASPxScheduler1.WorkWeekView.ShowWorkTimeOnly = true;

           gv.DataSource = Pelesys.Scheduling.ResourcePool.GetDataBy();
           gv.DataBind();}


            ddlTimeUnit.Items.Add(new ListItem("Day", "Day"));
            ddlTimeUnit1.Items.Add(new ListItem("Hour","Hour"));


            this.GridView4.DataSource = Administration.User.LoadListWhere<Administration.User>("Where T.UserID <3");
            this.GridView4.DataBind();

           
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