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
    public partial class WorkHourUser : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.PageTitle = "Setup Working Hours for User";
            gv.DataSource = Administration.User.LoadListWhere<Administration.User>("Where T.UserID <1000");
        //    gv.DataSource = GetDataMaster();
            gv.DataBind();
            gvd.DataSource = GetDataDetail();
            gvd.DataBind();

        }

        public DataTable GetDataMaster()
        {
            DataTable table = new DataTable();
            table.Columns.Add("Location", typeof(string));
            table.Rows.Add("Vancouver Headquarter");
            table.Rows.Add("New York Office");
            table.Rows.Add("Beijing Office");
            return table;
        }

        public DataTable GetDataDetail()
        {
            DataTable table = new DataTable();
            table.Columns.Add("Weekday", typeof(string));
            table.Columns.Add("Starttime", typeof(string));
            table.Columns.Add("Endtime", typeof(string));
            table.Rows.Add("Monday","9:00am","5:30pm");
            table.Rows.Add("Tuesday", "9:00am", "5:30pm");
            table.Rows.Add("Wednesday", "9:00am", "5:30pm");
            table.Rows.Add("Thursday", "9:00am", "5:30pm");
            table.Rows.Add("Friday", "9:00am", "5:30pm");
            table.Rows.Add("Saturday", "9:00am", "2:30pm");
            table.Rows.Add("Sunday", "--", "--");
            return table;
        }
    }
}