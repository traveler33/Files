using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pelesys.Common;
using Pelesys.Web;
using System.Data;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.Data;
using DevExpress.Web.ASPxGridView;
using System.Collections;
using DevExpress.Web.ASPxTreeView;

namespace Pelesys.Scheduling.Web.Files
{
    public partial class WorkHourUser : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.PageTitle = "Setup Working Hours for each Location and Exception Personal";
        //    gv.DataSource = Administration.User.LoadListWhere<Administration.User>("Where T.UserID <1000");
        ////    gv.DataSource = GetDataMaster();
        //    gv.DataBind();
            if (!IsPostBack)
            {
                ASPxTreeView1.ExpandToDepth(1);
                gvd.DataSource = GetDataDetail();
                gvd.DataBind();
                

            //    (DataTable)ObjectDataSource1.Select() = GetStatHolidays();
                //gv.DataBind();

                //ASPxGridView grid = (ASPxGridView)DropDownEdit.FindControl("gv");
                //grid.DataSource = GetStatHolidays();
            }
            //DropDownEdit.Value = "2012-10-16";

        }

        protected void Page_PreRenderComplete(object sender, EventArgs e)
        {
            
            //DropDownEdit.Value = "2012-10-16";

        }

        protected void tv1_NodeClick(object s, TreeViewNodeEventArgs e)
        {
            string s_NodeName, s_NodeText, s_pNodeName, s_pNodeText;
            s_NodeText = e.Node.Text;
            s_NodeName = e.Node.Name;
            s_pNodeName = e.Node.Parent.Name;
            s_pNodeText = e.Node.Parent.Text;
            if (s_NodeName == "UsersNode")
            {
                SubjectName.Text = s_pNodeText;
            }
            else if (s_pNodeName == "RootNode" || s_pNodeName == "UsersNode")
            {
                SubjectName.Text = s_NodeText;
            }
            s_NodeName = "";
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

        public DataTable GetStatHolidays()
        {
            DataTable table = new DataTable();
            table.Columns.Add("Name", typeof(string));
            table.Columns.Add("Date", typeof(string));
            table.Columns.Add("Description", typeof(string));
            table.Rows.Add("Vancouver", "06/04/2012", "");
            table.Rows.Add("Vancouver", "06/08/2012", "");
            table.Rows.Add("Vancouver", "03/09/2012", "");
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


        //protected void grid_HtmlRowCreated(object sender,
        //                  DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        //{
        //    if (e.RowType != DevExpress.Web.ASPxGridView.GridViewRowType.Data) return;
        //    // Label ctrl = this.gv.FindRowCellTemplateControl(e.VisibleIndex, null, "lblDay") as Label;
        //    //lblDuration
        //    // Label ctrlduration = this.gvweek1.FindRowCellTemplateControl(e.VisibleIndex, null, "lblDuration") as Label;

        //    ASPxDateEdit ctrleDate = this.gv.FindRowCellTemplateControl(e.VisibleIndex, null, "ASPxDateEdit1") as ASPxDateEdit;
        //    if (ctrleDate != null)
        //    {

        //        ctrleDate.Date = Convert.ToDateTime(e.GetValue("Date"));  //"03/09/2012"


        //    }
        //}

        protected void GridView_CustomJSProperties(object sender, ASPxGridViewClientJSPropertiesEventArgs e)
        {
            ASPxGridView grid = (ASPxGridView)DropDownEdit.FindControl("gv");
            object[] employeeNames = new object[grid.VisibleRowCount];
            object[] keyValues = new object[grid.VisibleRowCount];
            //DateTime dt_eff, dt_exp;
            //object obj;
            //Type tp;
            for (int i = 0; i < grid.VisibleRowCount; i++)
            {
                //obj = grid.GetRowValues(i, "EffectiveDate");
                //tp = obj.GetType();
                //dt_eff = grid.GetRowValues(i, "EffectiveDate").GetType();
                //employeeNames[i] = "Effective Date: " + grid.GetRowValues(i, "EffectiveDate") + "     Expiry Date: " + grid.GetRowValues(i, "ExpiryDate");
                employeeNames[i] = grid.GetRowValues(i, "EffectiveDate");
                keyValues[i] = grid.GetRowValues(i, "EffectiveDate");
            }
            e.Properties["cpEmployeeNames"] = employeeNames;
            e.Properties["cpKeyValues"] = keyValues;
            
        }

        protected void GridView_RowInserting(object sender, ASPxDataInsertingEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;

        }

        protected void GridView_InitNewRow(object sender, ASPxDataInitNewRowEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            grid.ScrollToVisibleIndexOnClient = 0;
        }

        protected void GridView_AfterPerformCallback(object sender, ASPxGridViewAfterPerformCallbackEventArgs e)
        {
            SynchronizeFocusedRow();
        }

        protected void SynchronizeFocusedRow()
        {
            ASPxGridView grid = (ASPxGridView)DropDownEdit.FindControl("gv");
            object lookupKeyValue = DropDownEdit.KeyValue;
            grid.FocusedRowIndex = grid.FindVisibleIndexByKeyValue(lookupKeyValue);
        }

        protected void DropDownEdit_TextChanged(object sender, EventArgs e)
        {
            //string dd_text = DropDownEdit.Text;
            //string s_effdt;
            ////ADate[] aDate;
            ////EffectiveDt EffDt = new EffectiveDt();
            //ICollection al_dt = EffectiveDt.GetAllDt();

            //foreach (ADate adt in al_dt)
            //{
            //    s_effdt = adt.EffectiveDate.ToString("MMM d, yyyy");
            //    if (dd_text.Trim() == s_effdt.Trim())
            //    {
            //        lb_expirydt.Text = adt.ExpiryDate.ToString("MMM d, yyyy");
            //        return;
            //    }
            //}
        }

    }

    public class EffectiveDt
    {
        public static ICollection GetAllDt()
        {
            ArrayList al = new ArrayList();

            ADate aDate1 = new ADate();
            aDate1.EffectiveDate = Convert.ToDateTime("2012-10-16");
            
            al.Add(aDate1);
            ADate aDate2 = new ADate();
            aDate2.EffectiveDate = Convert.ToDateTime("2011-12-26");
            aDate2.ExpiryDate = Convert.ToDateTime("2012-10-15");
            al.Add(aDate2);
            ADate aDate3 = new ADate();
            aDate3.EffectiveDate = Convert.ToDateTime("2010-2-23");
            aDate3.ExpiryDate = Convert.ToDateTime("2011-12-25");
            al.Add(aDate3);

            return al;
        }
    }

    public class ADate
    {
        private DateTime effectiveDate;
        public DateTime EffectiveDate
        {
            get { return effectiveDate; }
            set { effectiveDate = value; }
        }

        private DateTime expiryDate;
        public DateTime ExpiryDate
        {
            get { return expiryDate; }
            set { expiryDate = value; }
        }

    }

}