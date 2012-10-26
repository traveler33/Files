using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pelesys.Web;
using Pelesys.Scheduling;
using Pelesys.Data;

namespace Pelesys.Scheduling.Web.Files
{
    public partial class Resources : PageBase
    {
        void Page_Init(object sender, EventArgs e)
        { 
             Master.Master.PageTitle = GetString("Page_ResourcesPageTitle", "Resources");
            //lblName.Text = GetString("Page_ResourceName", "Name:");
             Master.Master.ShowPageTitle = false;
             Master.Master.ShowphToolBar = false;
            ////   lblcategory.Text = GetString("Page_ResourceTypeCategory", "Category:");
            //this.lblResourceType.Text = GetString("Page_DropDownListResourceType", "Resource Type:");
            //this.lblSNumber.Text = GetString("Page_ResourceSNumber", "Serial Number:");


           // gv.LoadListHandler = DataSource;
        }


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
              //  LoadData(); 
            
            }

        }

      


        public List<Resource> DataSource(int startRowIndex, int pageRowCount, ref int totalRowCount, string sortExpression, Data.EFEntityObjectBase.SortDirection sortDirection)
        {


            return Pelesys.Scheduling.Resource.LoadListAll<Resource>();

        }


    }
}