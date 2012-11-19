using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pelesys.Common;
using Pelesys.Web;
using System.Data;

namespace Pelesys.Scheduling.Web.Files
{
    public partial class StatutoryHoliday : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.PageTitle = "Setup Statutory Holiday";
//            gv.DataSource = Administration.OrganizationLocation.LoadListWhere<Administration.OrganizationLocation>("Where T.OrganizationLocationID <10000");
            GetLocations();
            gv.DataSource = GetStatHolidays();
            gv.DataBind();
            YearDL.Text = "2012";
        }

        public void GetLocations()
        {
            LocationList.Items.Add(new ListItem("VANCOUVER"));
            LocationList.Items.Add(new ListItem("NEW YORK"));
            LocationList.Items.Add(new ListItem("BEIJING"));
        }

        public DataTable GetStatHolidays()
        {
            DataTable table = new DataTable();
            table.Columns.Add("Name", typeof(string));
            table.Columns.Add("Date", typeof(string));
            table.Columns.Add("Description", typeof(string));
            table.Rows.Add("Good Friday", "06/04/2012", "");
            table.Rows.Add("BC Day", "06/08/2012", "");
            table.Rows.Add("Labour Day", "03/09/2012", "");
            return table;
        }
    }
}