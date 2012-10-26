using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pelesys.Web;

namespace Pelesys.Scheduling.Web.Files
{
    public partial class ResourceProfile : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.PageTitle = GetString("Page_ResourceProfilePageTitle", "Resource Profile");
        }

    }
}