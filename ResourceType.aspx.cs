using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pelesys.Web;
using eForm.Class;


namespace Pelesys.Scheduling.Web.Files
{
    public partial class ResourceType : PageBase
    {

        void Page_Init(object sender, EventArgs e)
        {
            // this.gv.LoadListHandler = DataSource;
            Master.Master.PageTitle = GetString("Page_ResourceTypePageTitle", "Resource Type");
            lblName.Text = GetString("Page_ResourceTypeName", "Name:");
            //   lblcategory.Text = GetString("Page_ResourceTypeCategory", "Category:");
            //this.lblIsFixed.Text = GetString("Page_ResourceTypeFixed", "Is Fixed");
            //this.lblService.Text = GetString("Page_ResourceTypeIsService", "Is Serviced");
            //this.lblHasSerialNumber.Text = GetString("Page_ResourceTypeHasSerialNumber", "Has Searial Number");
            //this.lblHasEventLimit.Text = GetString("Page_ResourceTypHasEventLimit", "Has Event Limit");
            //this.lblHasEventRestriction.Text = GetString("Page_ResourceTypeEventRestriction", "Has Event Restriction");
            //this.lblIsDeplete.Text = GetString("Page_ResourceTypeIsDeplete", "Is Deplete");
            this.bnSearch.Text = GetString("Page_ResourceTypeSearch", "Search");


            if (!IsPostBack)
            {   
                //ddlManageType.Items.Add(new ListItem("All", "0"));
                //ddlManageType.Items.Add(new ListItem("Specific", "1"));
                //ddlManageType.Items.Add(new ListItem("Non-Specific", "2"));
               

                checkOutCheckBox();
            }

        }
            
          // gv.LoadListHandler = DataSource;
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                IniForm();
            }
        }


        protected void IniForm()
        {

            gv.DataSource = Pelesys.Scheduling.ResourceType.GetDataBy();
             gv.DataBind();
        
        }

        protected void Search_Click(object sender, EventArgs e)
        { 
            
        
        }



        private void checkOutCheckBox()
        { 
           
           if (radBoth.Checked ==true)
            {


                lblHasEventLimit.Visible = false ;
                lblHasEventRestriction.Visible = false ;
                lblIsDeplete.Visible = true ;
                lblService.Visible = false;
                lblIsFixed.Visible = false;
                chkHasEventRestriction.Visible = false;
                chkIsDeplete.Visible=true;
                chkIsFixed.Visible = false;
                chkHasEventLimit.Visible = false;
                chkIsService.Visible = false;
                lblEventLimit.Visible = true;
                txtEventLimit.Visible = true; 

            }
                    else if ( radNonSpecific.Checked == true )
         
         
            {

                chkIsService.Visible = false ;
                lblService.Visible = false;
                chkIsDeplete.Visible = true;
                lblIsDeplete.Visible = true;
                lblEventLimit.Visible = false;
                txtEventLimit.Visible = false; 


            }  
           else if (radSpecific.Checked  == true )
         {
                lblHasEventLimit.Visible = false;
                lblHasEventRestriction.Visible = false;
                lblIsDeplete.Visible = false;
                lblService.Visible = false;
                lblIsFixed.Visible = false;
                chkHasEventRestriction.Visible = false;
                chkIsDeplete.Visible = false;
                chkIsFixed.Visible = false;
                chkHasEventLimit.Visible = false;
                chkIsService.Visible = false;
                lblEventLimit.Visible = true;
                txtEventLimit.Visible = true;
              
                chkIsDeplete.Visible = false;
                lblIsDeplete.Visible = false;
            

            
            }


        }



        protected void radioButton_CheckedChanged(object sender, EventArgs e)
        {
            checkOutCheckBox(); 
        
        }

        protected void OnSelectedIndexChanged(Object sender,
                                         EventArgs e)
        {


            checkOutCheckBox();
        }

        private void LoadData()
        {
         //   string sortExp = string.IsNullOrEmpty(gv.SortExp) ? "Name" : gv.SortExp;
           // Data.EFEntityObjectBase.SortDirection sortDir = gv.SortDir.HasValue ? (gv.SortDir.Value == SortDirection.Ascending ? Data.EFEntityObjectBase.SortDirection.ASC : Data.EFEntityObjectBase.SortDirection.DESC) : Data.EFEntityObjectBase.SortDirection.ASC;
          //  gv.Start(sortExp, sortDir);

        }


        //public List<ResourceType> DataSource(int startRowIndex, int pageRowCount, ref int totalRowCount, string sortExpression, Data.EFEntityObjectBase.SortDirection sortDirection)
        //{


        //  //  return Pelesys.Scheduling.ResourceType.LoadListAll<ResourceType>();

        //}

    }
}