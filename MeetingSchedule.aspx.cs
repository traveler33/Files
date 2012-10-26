using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pelesys.Web;

namespace Pelesys.Scheduling.Web.Files
{
    public partial class MeetingSchedule : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.PageTitle = "Meeting Schedule";

            this.GridView4.DataSource = Administration.User.LoadListWhere<Administration.User>("Where T.UserID <30");
            this.GridView4.DataBind();

            this.GridView1.DataSource = Administration.User.LoadListWhere<Administration.User>("Where T.UserID <10");
            this.GridView1.DataBind();

            
            TreeNode ot1 = new TreeNode();
            ot1.Text = "Canada";
            TreeNode or = new TreeNode();
            or.Text = "Richmond";
            TreeNode or1 = new TreeNode();
            or1.Text = "Vancouver";
            TreeNode or2 = new TreeNode();
            or2.Text = "Surrey";
            ot1.ChildNodes.Add(or);
            ot1.ChildNodes.Add(or1);
            ot1.ChildNodes.Add(or2);

            TreeNode ors = new TreeNode();
            ors.Text = "Room 1";
            TreeNode ors1 = new TreeNode();
            ors1.Text = "Room 2";
            TreeNode ors2 = new TreeNode();
            
            ors2.Text = "Room 3";

            ors.ShowCheckBox = true;
            ors1.ShowCheckBox = true;
            ors2.ShowCheckBox = true; 
            or.ChildNodes.Add(ors);
            or.ChildNodes.Add(ors1);
            or.ChildNodes.Add(ors2);

            TreeNode orv = new TreeNode();
            orv.Text = "Meeting Room 1";
            TreeNode orv1 = new TreeNode();
            orv1.Text = "Meeting Room 2";

            orv1.ShowCheckBox = true;
            orv.ShowCheckBox = true; 

            or1.ChildNodes.Add(orv);
            or1.ChildNodes.Add(orv1);

            TreeNode ot2 = new TreeNode();

            ot2.Text = "China";

            TreeView1.Nodes.Add(ot1);
            TreeView1.Nodes.Add(ot2);

        }
    }
}