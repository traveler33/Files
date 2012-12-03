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
    public partial class RuleList : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Rule List";

            if (!IsPostBack)
            {
               

            }
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
               // SubjectName.Text = s_pNodeText;
            }
            else if (s_pNodeName == "RootNode" || s_pNodeName == "UsersNode")
            {
               // SubjectName.Text = s_NodeText;
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
            table.Rows.Add("Monday", "9:00am", "5:30pm");
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
            //ASPxGridView grid = (ASPxGridView)DropDownEdit.FindControl("gv");
            //object[] employeeNames = new object[grid.VisibleRowCount];
            //object[] keyValues = new object[grid.VisibleRowCount];
            ////DateTime dt_eff, dt_exp;
            ////object obj;
            ////Type tp;
            //for (int i = 0; i < grid.VisibleRowCount; i++)
            //{
            //    //obj = grid.GetRowValues(i, "EffectiveDate");
            //    //tp = obj.GetType();
            //    //dt_eff = grid.GetRowValues(i, "EffectiveDate").GetType();
            //    //employeeNames[i] = "Effective Date: " + grid.GetRowValues(i, "EffectiveDate") + "     Expiry Date: " + grid.GetRowValues(i, "ExpiryDate");
            //    employeeNames[i] = grid.GetRowValues(i, "EffectiveDate");
            //    keyValues[i] = grid.GetRowValues(i, "EffectiveDate");
            //}
            //e.Properties["cpEmployeeNames"] = employeeNames;
            //e.Properties["cpKeyValues"] = keyValues;

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
            //ASPxGridView grid = (ASPxGridView)DropDownEdit.FindControl("gv");
            //object lookupKeyValue = DropDownEdit.KeyValue;
            //grid.FocusedRowIndex = grid.FindVisibleIndexByKeyValue(lookupKeyValue);
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




   


}


/*
 * 
 *  ddlEventList.Items.Add(new ListItem("", ""));
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
 * 
    <script type="text/javascript" src="../js/eform/eFormJS.js"></script>
    <script type="text/javascript" src="../js/eform/jquery.ui.core.js"></script>
    <script type="text/javascript" src="../js/eform/jquery.ui.draggable.js"></script>
    <script type="text/javascript" src="../js/eform/jquery.ui.droppable.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {



            $("a.iframe").fancybox({
                'width': '100%',
                'height': '160%',
                'autoScale': false,
                'transitionIn': 'elastic',
                'transitionOut': 'elastic',
                'padding': 6,
                'zoomOpacity': true,
                'zoomSpeedIn': 500,
                'zoomSpeedOut': 500,
                'titlePosition': 'inside',
                'titleShow': true,
                'type': 'iframe',
                "onUpdate": function () {
                    $(".fancybox-title").css({ 'top': '-30px', 'bottom': 'auto' });
                },
                "afterLoad": function () {
                    $(".fancybox-title").css({ 'top': '-30px', 'bottom': 'auto' });
                }
            });

        }); 

       
    </script>
    <style type="text/css">
        .fancybox-custom .fancybox-skin
        {
            box-shadow: 0 0 50px #222;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div id="ResourceTypeTab" class="TabPanelControl" style="margin: 4px; padding: 1px; width:99%; overflow: hidden;">
        <table cellpadding="6" cellspacing="6" border="0"  width="100%">
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                          
                                            <div style="visibility: visible;margin: 4px;   padding-left:20px;  padding-top:12px; width:100%; height:370px; background-color: White; border: 1px solid lightgray;  " class="detailEdit"  >
                                                <table border="0" cellpadding="6" cellspacing="6" style="width: 100%; height: 100%;">
                                                    <tr>
                                                        <th align="left"  style=" width="150px;">
                                                            Name:<span class="required"></span>
                                                        </th>
                                                        <td  width="280px;">
                                                            <pel:SearchTextBox ID="SearchTextBox1" runat="server" Objective="userloginname" ValidationGroup="search"
                                                                Width="220px" />
                                                        </td>
                                                        <td   style=" width:40px;">
                                                        </td>
                                                        <th valign="top" align="left" width="150px;" >
                                                            <asp:Label ID="lblFormList" runat="server" Text="Event:"></asp:Label><span
                                                                class="required"></span>
                                                        </th>

                                                        <td>
                                                            <asp:DropDownList ID="ddlEventList" runat="server" Width="200px">
                                                            </asp:DropDownList>
                                                          
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Is System: </th>
                                                        <td> <asp:CheckBox runat="server"></asp:CheckBox></td>
                                                        <td style=" width:40px;"></td>
                                                        <th> IsActive:</th>
                                                        <td> <asp:CheckBox runat="server"></asp:CheckBox></td>
                                                    </tr>
                                                      <tr>
                                                        <th align="left"  style=" width="150px;">
                                                              <asp:Label ID="lblFormList1" runat="server" Text="Script Type:"></asp:Label>
                                                        </th>
                                                        <td  width="220px;">
                                                                <asp:DropDownList ID="ddlType1" runat="server" Width="200px">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td   style=" width:40px;">
                                                        </td>
                                                        <th valign="top" align="left" width="150px;" >
                                                            <asp:Label ID="lblType" runat="server" Text="Type:"></asp:Label><span
                                                                class="required"></span>
                                                        </th>

                                                        <td>
                                                            <asp:DropDownList ID="ddlType" runat="server" Width="200px">
                                                            </asp:DropDownList>
                                                          
                                                        </td>
                                                    </tr>
                                                     <tr>
                                                        <th valign="top" align="left"   colspan="3" >
                                                            Description:
                                                        </th>
                                                        <th>
                                                               
                                                        </th>
                                                        <td>
                                                         
                                                        </td>
                                                     </tr>

                                                    <tr>
                                                    
                                                 
                                                        <td  colspan="5">
                                                            <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Width="840px" Height="60px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                      <tr>
                                                        <th valign="top" align="left"   colspan="1"  >
                                                            Script:
                                                        </th>
                                                        <td>
                                                             <asp:Button ID="Button33" runat="server" Text="Parse" SkinID="bntMiddle" />
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <th>
                                                            Process Order:
                                                        </th>
                                                        <td>
                                                            <asp:TextBox runat="server" width="50px"></asp:TextBox>   <asp:Button ID="Button333" runat="server" Text="View Order" SkinID="bntMiddle" />
                                                        </td>
                                                     </tr>

                                                    <tr>
                                                    
                                                 
                                                        <td  colspan="5">
                                                            <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine" Width="840px" Height="60px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                      <tr>
                                                        <th valign="top" align="left"   colspan="3" >
                                                          Message:
                                                        </th>
                                                        <th></th>
                                                        <td></td>
                                                     </tr>

                                                    <tr>
                                                    
                                                 
                                                        <td  colspan="5">
                                                            <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine" Width="840px" Height="60px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                       
                                 
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="Div2" class="SaveCancelPanel" style="width: 100%;">
                        <table border="0" cellpadding="2" cellspacing="2" style="width: 100%; height: 100%;">
                            <tr>
                                <td style="width: 70%; font-size: 10px; font-weight: normal;">
                                    <asp:Panel ID="Panel1" runat="server">
                                    </asp:Panel>
                                </td>
                                <td align="left">
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                        <ContentTemplate>
                                           
                                            <asp:Button ID="Button3" runat="server" Text="Save" SkinID="bntMiddle" />
                                            <asp:Button ID="Button4" runat="server" Text="Cancel" SkinID="bntMiddle" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </div>
 
 * 
 * 
 * 
 * 
 * 
    <div class="searchField">
        <table cellpadding="6" cellspacing="6" border="0" width="1300px" style="height: 40px;"
            class="detailEdit">
            <tr>
                <th style="width: 110px">
                    <asp:Label ID="lblName" runat="server" Text="Name:" />
                </th>
                <td align="left" style="width: 300px">
                    <pel:ValidateTextBox ID="TypeName" runat="server" Required="false" MaxLength="200"
                        Width="200px" />
                </td>
                <td style="width: 20px">
                </td>
                <th style="width: 150px;">
                      <asp:Label ID="lblEvent" runat="server" Text="Event:" />
                </th>
            

                <td style="width: 230px">
                    <asp:dropdownlist runat="server"  width="200px" id="ddlEventList"  SkinID ="eFormDropDownList" >
                    </asp:dropdownlist>
                </td>
                <th style="width: 780px;">
                    
                </th>
              

                <td style="width: 10px">
                </td>
                <th style="width: 140px;">
                    <asp:Label ID="lblHasSerialNumber" runat="server" />
                      <asp:Button ID="bnSearch" runat="server" CssClass="refresh" ToolTip="Search" Text="Search"
                        SkinID="bntMiddle" />
                </th>
               
            </tr>
            <tr>
               
                <th align="left"  colspan="2" >
           
                 
           
                  

                </th>
                <td style="width: 60px">
                </td>
               

                <td >
                </td>
                <th>
                    
                </th>
                <th>
                   
                </th>
                <td >
                </td>
               
                <td valign="top"   align="left">
                  
                </td>
            </tr>
        </table>
    </div>
    <%--tool bar--%>
    <div class="statusBar">
        <asp:LinkButton ID="lbAddNewEnrollment" runat="server" CausesValidation="false" CssClass="add"
            PostBackUrl="~/Files/RuleProfile.aspx?rec_id=0"></asp:LinkButton>
        <asp:LinkButton ID="lbDeleteEnrollment" runat="server" CausesValidation="false" CssClass="delete"
            Style="display: none;"></asp:LinkButton>
        <%--withdraw--%>
        <asp:LinkButton ID="lbRecoverEnrollmentDeleted" runat="server" CausesValidation="false"
            CssClass="undelete" Style="display: none;">
        </asp:LinkButton>
        <%--unwithdraw--%>
    </div>
    <%--list view--%>
    <div class="resultGridView">
            <dx:ASPxGridView ID="gv" ClientInstanceName="grid" runat="server" 
                                                               KeyFieldName="ResourceTypeID"     Border-BorderColor="LightGray" Border-BorderStyle="Solid"
                                                                Border-BorderWidth=1   Font-Names="Verdana" Font-Size="10px"  ForeColor="#342F2F"  
                                                             AutoGenerateColumns="False"   Theme="Office2003Blue"
                                                                    EnableRowsCache="True" Width="100%" DataSourceForceStandardPaging="False" SettingsPager-AlwaysShowPager="True" SettingsPager-Position="Bottom">
                                                                    <Columns>
                                                                   <dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0"  Width="30px" >
                                                                        <HeaderTemplate>
                                                                           <asp:CheckBox ID="CheckBox2" runat="server" />
                                                                        </HeaderTemplate>
                                                                        
                                                                    </dx:GridViewCommandColumn>


                                                                    <dx:GridViewDataColumn FieldName="Name" VisibleIndex="1"  Caption="Name" SortOrder="Ascending"   />

                                                                   <dx:GridViewDataHyperLinkColumn  Caption="Is Active" VisibleIndex="3">
                                                                        <DataItemTemplate>
                                                                            <asp:CheckBox ID="CheckBox2" runat="server" />
                                                                        </DataItemTemplate>
                                                                     </dx:GridViewDataHyperLinkColumn>
                                                                     
                                                                   
                                                                     <dx:GridViewDataColumn FieldName="Event" VisibleIndex="2"  Caption="Event" SortOrder="Ascending"   />

                                                                      

                                                                     <dx:GridViewDataColumn FieldName="Message" VisibleIndex="3"  Caption="Message" SortOrder="Ascending"   />

                                                                    <dx:GridViewDataColumn FieldName="Script" VisibleIndex="4"  Caption="Script Type" SortOrder="Ascending"   />

                                                                       <dx:GridViewDataColumn FieldName="Type" VisibleIndex="5"  Caption="Type" SortOrder="Ascending"   />

                                                                          <dx:GridViewDataColumn FieldName="ProcessOrder" VisibleIndex="6"  Caption="Process Order" SortOrder="Ascending"   />
                                                                     
                                                                    </Columns>
                                                                    <Settings ShowGroupPanel="False" />
                                                                    <SettingsBehavior AllowFocusedRow="False" />
                                                                     <Settings GridLines="Vertical" />
                                                                     <Styles>
                                                                        <AlternatingRow Enabled="true" />
                                                                    </Styles>
                                                                      <SettingsPager PageSize="10">
                                                                        <PageSizeItemSettings Visible="true"  ShowAllItem="true" />
                                                                    </SettingsPager>
                                                                    </dx:ASPxGridView>

    </div>
 */