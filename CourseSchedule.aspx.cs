using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pelesys.Web;
using DevExpress.Web.ASPxPager;

namespace Pelesys.Scheduling.Web.Files
{
    public partial class CourseSchedule : PageBase
    {

        private List<Pelesys.Administration.Setting> oList = new List<Administration.Setting>();

        protected void Page_Init(object sender, EventArgs e)
        {
           

            this.GridView5.SettingsPager.ShowDisabledButtons = true;
            this.GridView5.SettingsPager.ShowNumericButtons = true;
            this.GridView5.SettingsPager.ShowSeparators = true;
            this.GridView5.SettingsPager.Summary.Visible = true;
            this.GridView5.SettingsPager.PageSizeItemSettings.Visible = true;
          
            this.GridView5.DataSource = Pelesys.Scheduling.ResourcePool.GetDataBy();
            //this.GridView5.DataSourceID = "ResourceDataSource";
            this.GridView5.DataBind();
        }


      


        protected void Page_Load(object sender, EventArgs e)
        {
            Master.PageTitle = "Curriculum Schedule";
            if (!IsPostBack)
            {
                oList =
                 Pelesys.Administration.Setting.LoadListWhere<Pelesys.Administration.Setting>("Where T.SettingID<6");
                gvweek1.DataSource = oList;
                gvweek1.DataBind();



                gv.DataSource = Administration.User.LoadListWhere<Administration.User>("Where T.UserID <30");
                gv.DataBind();

                this.GridView1.DataSource = Administration.User.LoadListWhere<Administration.User>("Where T.UserID <30");
                this.GridView1.DataBind();


                // "ListBox1
              
                lstCourseList.Items.Add(new ListItem("Airbus 722 - Intrduction"));
                lstCourseList.Items.Add(new ListItem("Airbus 722 - Security Training 1"));
                lstCourseList.Items.Add(new ListItem("Airbus 722 - Security Training 2"));
                lstCourseList.Items.Add(new ListItem("Airbus 722 - Security Training 3"));
                lstCourseList.Items.Add(new ListItem("Airbus 722 - Security Training 4"));
                lstCourseList.Items.Add(new ListItem("Airbus 722- Summary"));
            }

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

        protected void AddStudent_Click(object sender, EventArgs e)
        {


            // litTrigger.Text = "<script>jQuery(document).ready(function() {$(\"#Resource\").trigger('click');});</script>";
            string msg = "test";
            Guid oguid = new Guid();
            //TriggerResource() 
            ScriptManager.RegisterStartupScript(UpdatePanel1, this.GetType(), oguid.ToString(), " TriggerStudent();", true);
            // ScriptManager.RegisterStartupScript(UpdatePanel1, this.GetType(), oguid.ToString(), "callBoxFancy('eFormWarnStatus','" + msg + "');", true);
        }


        protected void StudentSchedule_Click(object sender, EventArgs e)
        {


            // litTrigger.Text = "<script>jQuery(document).ready(function() {$(\"#Resource\").trigger('click');});</script>";
            string msg = "test";
            Guid oguid = new Guid();
            //TriggerResource() 
            ScriptManager.RegisterStartupScript(UpdatePanel1, this.GetType(), oguid.ToString(), "TriggerResource();", true);
            // ScriptManager.RegisterStartupScript(UpdatePanel1, this.GetType(), oguid.ToString(), "callBoxFancy('eFormWarnStatus','" + msg + "');", true);
        }



        protected void Resource_Click(object sender, EventArgs e)
        {


           // litTrigger.Text = "<script>jQuery(document).ready(function() {$(\"#Resource\").trigger('click');});</script>";
            string msg = "test";
            Guid oguid = new Guid();
            //TriggerResource() 
            ScriptManager.RegisterStartupScript(UpdatePanel1, this.GetType(), oguid.ToString(), "TriggerResource();", true);
           // ScriptManager.RegisterStartupScript(UpdatePanel1, this.GetType(), oguid.ToString(), "callBoxFancy('eFormWarnStatus','" + msg + "');", true);
        }


        protected void grid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onClick", "SelectRow(this);");

                 WebControl ctrl = e.Row.FindControl("DropDownList0")  as WebControl;
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