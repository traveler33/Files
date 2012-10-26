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
    public partial class WorkHourLocation : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.PageTitle = "Setup Working Hours for Organization & Location";
            gv.DataSource = Administration.Location.LoadListWhere<Administration.Location>("Where T.LocationID in {13, 17, 21}");
 //           gv.DataSource = GetDataMaster();
            gv.DataBind();
            
            //gv.Templates.DetailRow.gvEffdt.DataSource = GetDataEffdt();
            //gvEffdt.DataBind();
            gvd.DataSource = GetDataDetail();
            gvd.DataBind();

        }

        //public class DrEffdt: ITemplate

        public DataTable GetDataMaster()
        {
            DataTable table = new DataTable();
            table.Columns.Add("Location", typeof(string));
            table.Rows.Add("Vancouver Headquarter");
            table.Rows.Add("New York Office");
            table.Rows.Add("Beijing Office");
            return table;
        }

        public DataTable GetDataEffdt()
        {
            DataTable table = new DataTable();
            table.Columns.Add("EffectiveDate", typeof(string));
            table.Columns.Add("ExpiryDate", typeof(string));
            table.Rows.Add("2012-01-02","");
            table.Rows.Add("2010-01-01", "2012-01-01");
            return table;
        }

        public DataTable GetDataDetail()
        {
            DataTable table = new DataTable();
            table.Columns.Add("Weekday", typeof(string));
            table.Columns.Add("Starttime", typeof(string));
            table.Columns.Add("Endtime", typeof(string));
            table.Rows.Add("Monday", "9:00am", "5:30pm");
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