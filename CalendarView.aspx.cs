using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pelesys.Web;

namespace   Pelesys.Scheduling.Web.Files
{
	public partial class CalendarView : PageBase
	{
		protected void Page_Load(object sender, EventArgs e)
		{
          // Master.ShowPageTitle = false;
          // Master.Master.ShowphToolBar = false;
            Master.PageTitle = "Schedule View";
          //  Master.ShowPageTitle = false;
            Master.ShowphToolBar = false;
            ListBox1.Items.Add(new ListItem("All Vancouver Center"));
            ListBox1.Items.Add(new ListItem("Instructors at Vancouver Center"));
            ListBox1.Items.Add(new ListItem("Student at BaijingCenter"));
            ListBox1.Items.Add(new ListItem("Month view at Vancouver Center"));
            ListBox1.Items.Add(new ListItem("All Simutors Today at Vancouver Center"));
            ListBox1.Items.Add(new ListItem("Sick leave at New York Center"));
            ListBox1.Items.Add(new ListItem("Simulator Maintance at New York Center"));

            ListBox1.SelectedIndex = 0;

         
          // HasHelpPage = false;
           
		}

        public void CourseShowListView(object sender, System.EventArgs e)
        {
            if (chkListView.Checked)
            {
                string msg = "iframeGotoSechduleListViewPage('')";
                Guid oguid = new Guid();
                //TriggerResource() 
                ScriptManager.RegisterStartupScript(UpdatePanel1, this.GetType(), oguid.ToString(), msg, true);
            }
        
        
        
        }


        public void ShowListView(object sender, System.EventArgs e)
        {
            if (chkShowListView.Checked)
            {
                string msg = "iframeGotoSechduleListViewPage('')";
                Guid oguid = new Guid();
                //TriggerResource() 
                ScriptManager.RegisterStartupScript(UpdatePanel1, this.GetType(), oguid.ToString(), msg, true);
            
            }

        }

	}
}