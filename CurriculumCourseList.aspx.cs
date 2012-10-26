using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pelesys.Web;
using Pelesys.Data;

namespace Pelesys.Scheduling.Web.Files
{
    public partial class CurriculumCourseList : PageBase
    {
        private  List<Pelesys.Administration.Setting> oList = new List<Administration.Setting>();

        protected void Page_Load(object sender, EventArgs e)
        {
            Master.ShowPageTitle = false;
            Master.ShowphToolBar = false;


            oList = 
                Pelesys.Administration.Setting.LoadListWhere<Pelesys.Administration.Setting>("Where T.SettingID<6");
            gvweek1.DataSource = oList;
            gvweek1.DataBind();
           
        }

        protected void btnPrevous_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Files/CourseScheduleConfig.aspx");
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

                    dd3.Items.Add(new ListItem("",""));

                    dd3.Items.Add(new ListItem("Bin Yang", "Bin Yang"));
                    dd3.Items.Add(new ListItem("Robert Chen", "Robert Chen"));
                    dd3.Items.Add(new ListItem("Helen Zhang", "Helen Zhang"));
                    dd3.Items.Add(new ListItem("Kevin Chen ", ""));


                }
            }

        }



    }
}