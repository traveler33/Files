using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pelesys.Web;
using Pelesys.Common;

namespace Pelesys.Scheduling.Web.Files
{
    public partial class CourseConfig : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.PageTitle ="Curriculum";
            gv.DataSource = Administration.User.LoadListWhere<Administration.User>("Where T.UserID <10");
            gv.DataBind();

            int count = 0;
            //foreach (GridViewRow gr in gv.Rows)
            //{
            //    Label ob = gr.FindControl("lblcolor") as Label;
            //    if (ob != null)
            //    {
            //        if (count == 0)
            //        {
            //            ob.BackColor = System.Drawing.Color.Bisque;
            //        }
            //        if (count == 1)
            //        {
            //            ob.BackColor = System.Drawing.Color.LightSteelBlue;
            //        }
            //        if (count == 2)
            //        {
            //            ob.BackColor = System.Drawing.Color.LightPink;
            //        }
            //        if (count == 3)
            //        {
            //            ob.BackColor = System.Drawing.Color.LightSkyBlue;
            //        }
            //        if (count == 4)
            //        {
            //            ob.BackColor = System.Drawing.Color.Lime;
            //        }
            //        if (count == 5)
            //        {
            //            ob.BackColor = System.Drawing.Color.Maroon;
            //        }
            //        count++;


            //    }
            //}

        }
    }
}