using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pelesys.Web;
using System.Data;

namespace Pelesys.Scheduling.Web.Files
{
    public partial class RuleList : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Rule List";

            if (!IsPostBack)
            {
                ddlEventList.Items.Add(new ListItem("", ""));
                ddlEventList.Items.Add(new ListItem("Curriculum Schedule Save", "Curriculum Schedule"));
                ddlEventList.Items.Add(new ListItem("Meeting Schedule Save", "Meeting Schedule Save"));
                ddlEventList.Items.Add(new ListItem("Simple Schedule Save", "Simple Schedule"));
                ddlEventList.Items.Add(new ListItem("Resource Save", "Rsource Save"));


                DataTable dt1 = new DataTable();
                dt1.Columns.Add("SettingID", typeof(int)); ;
                dt1.Columns.Add("Name", typeof(string)); ;
                dt1.Columns.Add("Event", typeof(string));
                dt1.Columns.Add("Message", typeof(string));
                dt1.Columns.Add("Script", typeof(string));
                dt1.Columns.Add("Type", typeof(string));
                dt1.Columns.Add("ProcessOrder", typeof(string));
              
              
                DataRow odtr = dt1.NewRow();
                odtr["Name"] = "Curriculum b737 Save Rule";

                odtr["Event"] = "Curriculum Schedule Save";
                odtr["Message"] = "This curriculum can not be recurrence.";
                odtr["Script"] = "SQL Script";
                odtr["Type"] = "Mandatory";
                odtr["ProcessOrder"] = "1";
                dt1.Rows.Add(odtr);



                DataRow odtr1 = dt1.NewRow();
           
                odtr1["Name"] = "Curriculum Resource Save Rule";

                odtr1["Event"] = "Curriculum Schedule Save";
                odtr1["Message"] = "Resource Type not match to course type.";
                odtr1["Script"] = "VB Script";
                odtr1["Type"] = "Warning";
                odtr1["ProcessOrder"] = "1";
                dt1.Rows.Add(odtr1); 

                DataRow odtr2 = dt1.NewRow();
              
                odtr2["Name"] = "Curriculum Instructor Save Rule";

                odtr2["Event"] = "Curriculum Schedule Save";
                odtr2["Message"] = "Each course must have one instructgor.";
                odtr2["Script"] = "VB Script";
                odtr2["Type"] = "Mandatory";
                odtr2["ProcessOrder"] = "2";
                dt1.Rows.Add(odtr2);


                DataRow odtr3 = dt1.NewRow();
                
                odtr3["Name"] = "Curriculum Inventory Save Rule";

                odtr3["Event"] = "Curriculum Schedule Save";
                odtr3["Message"] = "Not enought inventory!";
                odtr3["Script"] = "JS Script";
                odtr3["Type"] = "Mandatory";
                odtr3["ProcessOrder"] = "3";
              
                dt1.Rows.Add(odtr3);


                DataRow odtr4 = dt1.NewRow();

               
                odtr4["Name"] = "Instructor Save Rule";

                odtr4["Event"] = "Curriculum Schedule Save";
                odtr4["Message"] = "It is agaisnt Instructor vacation rule.";
                odtr4["Script"] = "VB Script";
                odtr4["Type"] = "Warning";
                odtr4["ProcessOrder"] = "4";
              
            
                dt1.Rows.Add(odtr4);


              




                gv.DataSource = dt1;
                gv.DataBind();

            }
        }
    }
}