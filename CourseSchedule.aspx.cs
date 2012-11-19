using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pelesys.Web;
using DevExpress.Web.ASPxPager;
using System.Data;

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


                DataTable dt1 = new DataTable();
                dt1.Columns.Add("SettingID", typeof(int)); ;
                dt1.Columns.Add("Module", typeof(string)); ;
                dt1.Columns.Add("Instructor1", typeof(string));
                dt1.Columns.Add("Instructor2", typeof(string));
                dt1.Columns.Add("Instructor3", typeof(string));
                dt1.Columns.Add("Instructor4", typeof(string));
                dt1.Columns.Add("Instructor5", typeof(string));

                DataRow odtr = dt1.NewRow();
                odtr["Module"] = "201";
               
                odtr["Instructor2"] = "Robertson";
                odtr["Instructor3"] = "";
                odtr["Instructor4"] = "";
                odtr["Instructor5"] = "";
                odtr["Instructor1"] = "";
                dt1.Rows.Add(odtr);



                DataRow odtr1 = dt1.NewRow();
                odtr1["Module"] = "202";

                odtr1["Instructor2"] = "Kanndy B .Smith";
                odtr1["Instructor3"] = "Bin Yang";
                odtr1["Instructor4"] = "";
                odtr1["Instructor5"] = "";
                odtr1["Instructor1"] = "";
                dt1.Rows.Add(odtr1);

                DataRow odtr2 = dt1.NewRow();
                odtr2["Module"] = "203";

                odtr2["Instructor2"] = "Adelle G Lee";
                odtr2["Instructor3"] = "";
                odtr2["Instructor4"] = "";
                odtr2["Instructor5"] = "";
                odtr2["Instructor1"] = "";
                dt1.Rows.Add(odtr2);


                DataRow odtr3 = dt1.NewRow();
                odtr3["Module"] = "204";

                odtr3["Instructor2"] = "Adrian James";
                odtr3["Instructor3"] = "Robert chen";
                odtr3["Instructor4"] = "Jack Addyson";
                odtr3["Instructor5"] = "";
                odtr3["Instructor1"] = "";
                dt1.Rows.Add(odtr3);


                DataRow odtr4 = dt1.NewRow();

                odtr4["Module"] = "205";

                odtr4["Instructor2"] = "Barney Janson";
                odtr4["Instructor3"] = "";
                odtr4["Instructor4"] = "";
                odtr4["Instructor5"] = "";
                odtr4["Instructor1"] = "";
                dt1.Rows.Add(odtr4);


                DataRow odtr5 = dt1.NewRow();

                odtr5["Module"] = "206";

                odtr5["Instructor2"] = "Barry G Bart";
                odtr5["Instructor3"] = "";
                odtr5["Instructor4"] = "";
                odtr5["Instructor5"] = "";
                odtr5["Instructor1"] = "";
                dt1.Rows.Add(odtr5);

                DataRow odtr6 = dt1.NewRow();

                odtr6["Module"] = "207";

                odtr6["Instructor2"] = "Timmy Zula";
                odtr6["Instructor3"] = "Hannah Jerrard";
                odtr6["Instructor4"] = "";
                odtr6["Instructor5"] = "";
                odtr6["Instructor1"] = "";
                dt1.Rows.Add(odtr6);

                DataRow odtr7 = dt1.NewRow();

                odtr7["Module"] = "208";

                odtr7["Instructor2"] = "Mitch Shad";
                odtr7["Instructor3"] = "";
                odtr7["Instructor4"] = "";
                odtr7["Instructor5"] = "";
                odtr7["Instructor1"] = "";
                dt1.Rows.Add(odtr7);






                ASPxGridView2.DataSource = dt1;
                ASPxGridView2.DataBind();


                DataTable dt = new DataTable();
                dt.Columns.Add("SettingID", typeof(int)); ;
                dt.Columns.Add("Resource", typeof(string));
                dt.Columns.Add("1Hours", typeof(string));
                dt.Columns.Add("1HourRate", typeof(string));
                dt.Columns.Add("ResourceCost", typeof(string));
                dt.Columns.Add("Instructor", typeof(string));
                dt.Columns.Add("2Hours", typeof(string));
                dt.Columns.Add("2HourRate", typeof(string));
                dt.Columns.Add("InstructorCost", typeof(string));
                DataRow  oNR = dt.NewRow();

                oNR["Resource"] = "b283 Class room";
                oNR["1Hours"] = "10";
                oNR["1HourRate"] = "60";
                oNR["ResourceCost"] = "$600.00";
                oNR["Instructor"] = "Kanndy B .Smith";
                oNR["2Hours"] = "20";
                oNR["2HourRate"] = "160";
                oNR["InstructorCost"] = "$1200.00";

                dt.Rows.Add(oNR);


                DataRow oNR1 = dt.NewRow();

                oNR1["Resource"] = "A320 Simulator";
                oNR1["1Hours"] = "10";
                oNR1["1HourRate"] = "200";
                oNR1["ResourceCost"] = "$2000.00";
                oNR1["Instructor"] = "Cody B. Pilot";
                oNR1["2Hours"] = "2";
                oNR1["2HourRate"] = "160";
                oNR1["InstructorCost"] = "$320.00";

                dt.Rows.Add(oNR1);



                DataRow oNR2 = dt.NewRow();

                oNR2["Resource"] = "40 A320 Manul Books";
                oNR2["1Hours"] = "10";
                oNR2["1HourRate"] = "200";
                oNR2["ResourceCost"] = "$2000.00";
                oNR2["Instructor"] = "Flight TKkat";
                oNR2["2Hours"] = "20";
                oNR2["2HourRate"] = "100";
                oNR2["InstructorCost"] = "$2000.00";

                dt.Rows.Add(oNR2);


                DataRow oNR3 = dt.NewRow();

                oNR3["Resource"] = "Handout Materalsure";
                oNR3["1Hours"] = "5";
                oNR3["1HourRate"] = "200";
                oNR3["ResourceCost"] = "$1000.00";
                oNR3["Instructor"] = "";
                oNR3["2Hours"] = "";
                oNR3["2HourRate"] = "100";
                oNR3["InstructorCost"] = "0.00";

                dt.Rows.Add(oNR3);


                ASPxGridView1.DataSource = dt;
                ASPxGridView1.DataBind();

                gv.DataSource = Administration.User.LoadListWhere<Administration.User>("Where T.UserID <30");
                gv.DataBind();

             //   this.GridView1.DataSource = Administration.User.LoadListWhere<Administration.User>("Where T.UserID <30");
              //  this.GridView1.DataBind();

                //this.gvCost.DataSource = Administration.User.LoadListWhere<Administration.User>("Where T.UserID <10");
                //this.gvCost.DataBind();
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

    public class cost
    {
        public string Resource = string.Empty;
        public string Instructor = string.Empty;
        public string ResourceCost = string.Empty;
        public string InstructorCost = string.Empty;
        
    
    
    }


}