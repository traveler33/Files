using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pelesys.Web;

namespace Pelesys.Scheduling.Web.Files
{
    public partial class EventSchedule : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.PageTitle = "Event Schedule";

            this.gv.DataSource = Administration.User.LoadListWhere<Administration.User>("Where T.UserID <3");
            this.gv.DataBind();

            this.rulelist.NavigateUrl = "~/Files/RuleList.aspx";
            
        }
    }
}