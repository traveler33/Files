<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master/MainTab.Master"
CodeBehind="RuleList.aspx.cs" Inherits="Pelesys.Scheduling.Web.Files.RuleList" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ MasterType VirtualPath="~/Master/MainTab.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentNav" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">
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
</asp:Content>
