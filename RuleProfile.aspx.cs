using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pelesys.Web;

namespace Pelesys.Scheduling.Web.Files
{
    public partial class RuleProfile : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ddlType.Items.Add( new ListItem("Mandatory","Mandatory"));
            ddlType.Items.Add( new ListItem("Warning","Warning"));

            ddlEventList.Items.Add(new ListItem("", ""));
            ddlEventList.Items.Add(new ListItem("Curriculum Schedule Save", "Curriculum Schedule"));
            ddlEventList.Items.Add(new ListItem("Meeting Schedule Save", "Meeting Schedule Save"));
            ddlEventList.Items.Add(new ListItem("Simple Schedule Save", "Simple Schedule"));
            ddlEventList.Items.Add(new ListItem("Resource Save", "Rsource Save"));

            ddlType1.Items.Add(new ListItem("", ""));
            ddlType1.Items.Add(new ListItem("Sqlscript", "SQL Script"));
            ddlType1.Items.Add(new ListItem("VB script", "VB Script"));
            ddlType1.Items.Add(new ListItem("JS Script", "JS Script"));
          



        }
    }
}