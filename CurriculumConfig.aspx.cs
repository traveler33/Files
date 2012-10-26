using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pelesys.Web;

using Pelesys.Administration;

namespace Pelesys.Scheduling.Web.Files
{
    public partial class CurriculumConfig : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Master.ShowPageTitle = false;
            Master.ShowphToolBar = false;
            gv.DataSource = Administration.User.LoadListWhere<User>("Where T.UserID <30");
            gv.DataBind();

        }
            
        protected void btnNext_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Files/CourseScheduleConfig.aspx?");
        }
        
    }
}