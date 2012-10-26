<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master/MainTab.Master"
    CodeBehind="ResourceType.aspx.cs" Inherits="Pelesys.Scheduling.Web.Files.ResourceType" %>

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
                <th style="width: 150px">
                    <asp:Label ID="lblName" runat="server" Text="Name:" />
                </th>
                <td align="left" style="width: 300px">
                    <pel:ValidateTextBox ID="TypeName" runat="server" Required="false" MaxLength="200"
                        Width="200px" />
                </td>
                <td style="width: 20px">
                </td>
                <th style="width: 180px;">
                  <div style=" padding: 8px; border: 1px solid lightgray;">
                           <table  border="0"  cellpadding="2" cellspacing="1"  width="480px">
                    
                            <tr>
                                <th   style="width: 150px" >
                                    <asp:Label ID="Label1" runat="server"  Text="Specific Resource:" />
                                </th>
                                <td    >
                                       <asp:RadioButton ID="radSpecific" runat="server"  GroupName="Type"    TextAlign="Left" Checked="true" AutoPostBack="true"  OnCheckedChanged="radioButton_CheckedChanged"  /> 
                                </td>
                                <td   style="width: 60px"  ></td>
                                  <th   style="width: 200px" >
                                    <asp:Label ID="Label4" runat="server"    Text="Non-Specific Resource:" />
                                </th>
                                 <td>
                                     <asp:RadioButton ID="radNonSpecific" runat="server" GroupName="Type"   TextAlign="Left" AutoPostBack="true"  OnCheckedChanged="radioButton_CheckedChanged" />
                                        
                                </td>
                                 <td   style="width: 60px"  ></td>
                                   <th>
                                  <asp:Label ID="Label5" runat="server"  Text="Both:" />
                                </th>
                                 <td>  
                                     <asp:RadioButton ID="radBoth" runat="server"   GroupName="Type"   TextAlign="Left"  AutoPostBack="true"  OnCheckedChanged="radioButton_CheckedChanged" />
                                        
                                </td>
                            </tr>
                           <tr>
                              <td colspan="7" >
                            
                             
                                <table>
                                    <tr>
                                    <td>
                                         <asp:Label ID="lblEventLimit" runat="server" Text="Event Limit:"></asp:Label>
                                </td>
                                  <td  colspan="2">   
                                   <asp:TextBox ID="txtEventLimit" runat="server" Width="100px"></asp:TextBox>  
                                </td>
                                <td style="  width:  50px" >
                                
                                </td>
                                  <th   colspan="2">
                                <asp:Label ID="lblIsDeplete" runat="server"  Text="Is Deplete Material:" />
                                </th>
                                  <td>
                                 <asp:CheckBox ID="chkIsDeplete" runat="server" />
                                </td>
                                  <td>
                                
                                </td> 
                                    
                                    </tr>
                                
                                </table>
                              
                              </td>

                        </tr>
                    </table>
                     </div>
                </th>
                <td align="left"  style="width: 60px">
                    <asp:CheckBox ID="chkIsService" runat="server"  Visible ="false" />
                  
                     <asp:Label ID="lblIsFixed" runat="server"  Text="Is Porable Resource:"  />
                     <asp:Label ID="lblService" runat="server" Text="Is a Service:"  Visible = "false" />
                   
                </td>
                <th style="width: 130px">
                  
                </th>
                <th style="width: 180px;">
                    
                </th>
                <td align="left"  style="width: 60px">
                    <asp:CheckBox ID="chkIsFixed" runat="server" />
                </td>
                <td style="width: 10px">
                </td>
                <th style="width: 140px;">
                    <asp:Label ID="lblHasSerialNumber" runat="server" />
                      <asp:Button ID="bnSearch" runat="server" CssClass="refresh" ToolTip="Search" Text="Search"
                        SkinID="bntMiddle" />
                </th>
                <td align="left" style="width: 60px">
                    <asp:CheckBox ID="chkHasSerialNumber" runat="server" Visible = "False" />
                </td>
            </tr>
            <tr>
               
                <th align="left"  colspan="2" >
           
                 
           
                  

                </th>
                <td style="width: 60px">
                </td>
                <th>
                    <asp:Label ID="lblHasEventLimit" runat="server"   Text="Has Schedule Limit:" />
                </th>
                <td valign="bottom" >
                    <asp:CheckBox ID="chkHasEventLimit" runat="server" /> 
                   
                </td>
                <td >
                </td>
                <th>
                    <asp:Label ID="lblHasEventRestriction" runat="server"  Text="Has Restriction: " />
                </th>
                <th >
                    <asp:CheckBox ID="chkHasEventRestriction" runat="server" />
                </th>
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
            PostBackUrl="~/Files/ResourceTypeProfile.aspx?rec_id=0"></asp:LinkButton>
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
                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                    </dx:GridViewCommandColumn>
                                                                    <dx:GridViewDataColumn FieldName="Name" VisibleIndex="1"  Caption="Name" SortOrder="Ascending"   />

                                                                     <dx:GridViewDataHyperLinkColumn  Caption="Design Name" VisibleIndex="2">
                                                                        <DataItemTemplate>
                                                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text=" Airbus 322">
                                                                            </dx:ASPxLabel>
                                                                        </DataItemTemplate>
                                                                     </dx:GridViewDataHyperLinkColumn>
                                                                     
                                                                   
                                                                    <dx:GridViewDataHyperLinkColumn  Caption="Is Specific Resource" VisibleIndex="3">
                                                                        <DataItemTemplate>
                                                                            <asp:CheckBox ID="CheckBox2" runat="server" />
                                                                        </DataItemTemplate>
                                                                     </dx:GridViewDataHyperLinkColumn>

                                                                      

                                                                        <dx:GridViewDataHyperLinkColumn  Caption="Is Deplete Material" VisibleIndex="3">
                                                                        <DataItemTemplate>
                                                                            <asp:CheckBox ID="CheckBox4" runat="server" />
                                                                        </DataItemTemplate>
                                                                     </dx:GridViewDataHyperLinkColumn>

                                                                   

                                                                         <dx:GridViewDataHyperLinkColumn  Caption="Event Limit" VisibleIndex="3">
                                                                        <DataItemTemplate>
                                                                            <asp:Label ID="Label3" runat="server" Text="2"></asp:Label>
                                                                        </DataItemTemplate>
                                                                     </dx:GridViewDataHyperLinkColumn>


                                                                       <dx:GridViewDataImageColumn Caption="Detail" VisibleIndex="5">
                                                                       <DataItemTemplate>
                                                                           <dx:ASPxImage ID="ASPxImage1" runat="server"   ImageUrl="~/Images/sml_script.Png">
                                                                           </dx:ASPxImage>
                                                                       </DataItemTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                     </dx:GridViewDataImageColumn>
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
