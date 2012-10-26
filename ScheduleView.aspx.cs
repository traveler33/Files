using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pelesys.Web;

namespace Pelesys.Scheduling.Web.Files
{
    public partial class ScheduleView : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Master.ShowPageTitle = false;
            Master.ShowphToolBar = false;

            gv.DataSource = Administration.User.LoadListWhere<Administration.User>("Where T.UserID <60");
            gv.DataBind();

        }
    }
}