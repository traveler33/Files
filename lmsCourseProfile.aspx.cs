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
    public partial class lmsCourseProfile : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.ShowPageTitle = false;
            Master.ShowphToolBar = false;

            txtLoginName.Text = Request.QueryString["code"].ToString();

            for (int n = 0; n <= 59; n++)
            {
              //  DropDownList1.Items.Add(new ListItem(n.ToString(), n.ToString()));
              //  this.CheckBoxList2.Items.Add(new ListItem("Position-" + n.ToString(), "Position-" + n.ToString()));
            }

            for (int n = 0; n <= 23; n++)
            {
               // DropDownList2.Items.Add(new ListItem(n.ToString(), n.ToString()));

            }

        }
    }
}