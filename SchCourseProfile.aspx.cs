using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pelesys.Common;
using Pelesys.Web;

namespace Pelesys.Scheduling.Web.Files
{
    public partial class SchCourseProfile : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.ShowPageTitle = false;
            Master.ShowphToolBar = false;
            gv.DataSource= Pelesys.Scheduling.ResourcePool.GetDataBy();
            gv.DataBind();
            txtLoginName.Text = Request.QueryString["code"].ToString();
            DropDownList1.Items.Add(new ListItem("Hours", "Hours"));
            for (int n = 0; n <= 2; n++)
            {
               // DropDownList1.Items.Add(new ListItem(n.ToString(), n.ToString()));
              //  this.CheckBoxList1.Items.Add(new ListItem("Resource Type" + n.ToString(), "Resource Type" + n.ToString()));
            }


            //for (int n = 0; n <= 10; n++)
            //{
            //    DropDownList2.Items.Add(new ListItem("Room - " + n.ToString(), "Room - " + n.ToString()));
            //    DropDownList3.Items.Add(new ListItem("Simulator Type - " + n.ToString(), "Simulator Type - " + n.ToString()));
            //    DropDownList4.Items.Add(new ListItem("Simulator Level - " + n.ToString(), "Simulator Level - " + n.ToString()));
            //}


            //for (int n = 0; n <= 23; n++)
            //{
            //    DropDownList5.Items.Add(new ListItem(n.ToString(), n.ToString()));
              
            //}
        }
    }
}