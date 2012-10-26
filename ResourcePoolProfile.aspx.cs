using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pelesys.Common;
using Pelesys.Web;

namespace Pelesys.Scheduling.Web.Files
{
    public partial class ResourcePoolProfile :  PageBase
    {

        void Page_Init(object sender, EventArgs e)
        {
           


           // gv.LoadListHandler = DataSource;
        }



        protected void Page_Load(object sender, EventArgs e)
        {
            Master.ShowPageTitle = false;
            Master.ShowphToolBar = false;

            LoadData();
            if (Request.QueryString["Code"] != null)
            {
                SearchTextBox1.Text = Request.QueryString["Code"].ToString();
            }

            if (Request.QueryString["Type"] != null)
            {
                if (Request.QueryString["Type"].ToString() == "1")
                {
                    TabContainer1.Tabs[1].Visible = false;
                }
                else
                {
                    TabContainer1.Tabs[1].Visible = true; 
                }
            }




        }


        private void LoadData()
        {
           // string sortExp = string.IsNullOrEmpty(gv.SortExp) ? "Name" : gv.SortExp;
           // Data.EFEntityObjectBase.SortDirection sortDir = gv.SortDir.HasValue ? (gv.SortDir.Value == SortDirection.Ascending ? Data.EFEntityObjectBase.SortDirection.ASC : Data.EFEntityObjectBase.SortDirection.DESC) : Data.EFEntityObjectBase.SortDirection.ASC;
          //  gv.Start(sortExp, sortDir);
            gv.DataSource = Pelesys.Scheduling.Resource.LoadListAll<Resource>();
            gv.DataBind();

        }


        public List<Resource> DataSource(int startRowIndex, int pageRowCount, ref int totalRowCount, string sortExpression, Data.EFEntityObjectBase.SortDirection sortDirection)
        {


            return Pelesys.Scheduling.Resource.LoadListAll<Resource>();

        }

    }



}