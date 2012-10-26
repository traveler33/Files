using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pelesys.Web;

namespace Pelesys.Scheduling.Web.Files
{
    public partial class ResourceSelection : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Master.Master.ShowPageTitle = false;
            Master.Master.ShowphToolBar = false;
            gv.DataSource = Pelesys.Scheduling.ResourcePool.GetDataBy();
            gv.DataBind();
        }
    }
}