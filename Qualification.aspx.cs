using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pelesys.Web;

namespace Pelesys.Scheduling.Web.Files
{
    public partial class Qualification : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Master.ShowPageTitle = false;
            Master.ShowphToolBar = false;

            if (!IsPostBack)
            {
                this.GridView1.DataSource = Administration.User.LoadListWhere<Administration.User>("Where T.UserID <30");
                this.GridView1.DataBind();
            
            }

        }



        protected void grvMergeHeader_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                GridView HeaderGrid = (GridView)sender;
                GridViewRow HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                TableCell HeaderCell = new TableCell();
                HeaderCell.Text = "";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.CssClass = "HeaderStyle-CssClass";
                HeaderCell.Style.Add("border", "solid 1px lightgray");
                HeaderCell.Style.Add("Padding", "2px");
                HeaderCell.Style.Add("font-size", "10px");
                HeaderCell.Style.Add("text-align", "center");
             

                //background: url(images/sprite.png) repeat-x 0px 0px;
                HeaderGridRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Airbus 330 Trainig 001";
                HeaderCell.CssClass = "HeaderStyle-CssClass";
                HeaderCell.Style.Add("border", "solid 1px lightgray");
                HeaderCell.Style.Add("Padding", "2px");
                HeaderCell.Style.Add("font-size", "10px");
                HeaderCell.Style.Add("text-align", "center");
              
                HeaderCell.ColumnSpan = 12;
                HeaderGridRow.Cells.Add(HeaderCell);



                HeaderCell = new TableCell();
                HeaderCell.Text = "Boeing 747 Traing 003 ";
                HeaderCell.Style.Add("border", "solid 1px lightgray");
                HeaderCell.CssClass = "HeaderStyle-CssClass";
                HeaderCell.Style.Add("Padding", "2px");
               
                HeaderCell.Style.Add("font-size", "10px");
                HeaderCell.Style.Add("text-align", "center");
                HeaderCell.ColumnSpan = 12;
                HeaderGridRow.Cells.Add(HeaderCell);

                this.GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);

            }
        }



        protected void gv_RowDataBound(Object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Display the company name in italics.
                for (Int32 i = 1; i <= 20; i++ )
                {

                    TextBox obox = e.Row.FindControl("course0" + i.ToString()) as TextBox;
                    if (obox != null)
                    {


                        obox.Attributes.Add("onclick", "SelectValue(true,'" + obox.ClientID + "')");  //"SelectValue(true,'" + obox.ClientID + "')"

                    }
                }
            }

        }
    }
}