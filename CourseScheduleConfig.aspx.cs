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
    public partial class CouseConfig : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.ShowPageTitle = false;
            Master.ShowphToolBar = false;
            gv.DataSource = Pelesys.Scheduling.ResourcePool.GetDataBy();
            gv.DataBind();

           this.GridView1.DataSource = Administration.User.LoadListWhere<User>("Where T.UserID <3");
            this.GridView1.DataBind();
        }
 
        protected void btnNext_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Files/CurriculumCourseList.aspx?");
        }

        protected void btnPrevous_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Files/CurriculumConfig.aspx?");
        }

    }
}