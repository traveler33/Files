<%@ Page Language="C#" MasterPageFile="~/Master/MainTab.Master" AutoEventWireup="true"
    CodeBehind="Resources.aspx.cs" Inherits="Pelesys.Scheduling.Web.Files.Resources" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ MasterType VirtualPath="~/Master/MainTab.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentNav" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">
    <div style="width: 99%; height: 100%; padding: 2px; overflow: auto;">
        <table cellpadding="4" cellspacing="4" border="0" width="100%"  class="detailEdit">
            <tr>
                <td style="width: 660px; font-weight: bold; "  align="left">
                    <asp:Label ID="lblAdvanceDetail" runat="server" Text="Advance Search" />
                </td>
               
                <th style="width: 100%">
                </th>
                <td  align="right">
                    &nbsp;&nbsp;<asp:Button ID="Button1" runat="server" CssClass="refresh" ToolTip="Advance Search"
                        Text="Search" SkinID="bntMiddle" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <table cellpadding="3" cellspacing="3" border="0" width="100%" >
                       
                        <tr>
                            <th    align="left">
                                <asp:Label ID="Label2" runat="server" Text="Manufacture:" />
                            </th>
                            <td class="editFieldControl">
                                <pel:ValidateTextBox ID="ValidateTextBox2" runat="server" Required="false" MaxLength="100"
                                    Width="300px" />
                            </td>
                          
                        </tr>
                        <tr>
                            <th   align="left">
                                <asp:Label ID="Label3" runat="server" Text="Simulator Type:" />
                            </th>
                            <td class="editFieldControl">
                                <asp:DropDownList ID="DropDownList1" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <th   align="left">
                                <asp:Label ID="Label4" runat="server" Text="Simulator Level:" />
                            </th>
                            <td class="editFieldControl">
                                <asp:DropDownList ID="DropDownList2" runat="server">
                                </asp:DropDownList>
                            </td>
                           
                        </tr>
                        <tr>
                            <th   align="left">
                                <asp:Label ID="Label5" runat="server" Text="Is Ground:" />
                            </th>
                            <td class="editFieldControl">
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked="true" />
                            </td>
                        </tr>
                        <tr>
                            <th   align="left">
                                <asp:Label ID="Label6" runat="server" Text="Training Code:" />
                            </th>
                            <td class="editFieldControl">
                                <pel:ValidateTextBox ID="ValidateTextBox3" runat="server" Required="false" MaxLength="100"
                                    Width="300px" />
                            </td>
                           
                        </tr>
                        <tr>
                            <th   align="left">
                                <asp:Label ID="Label7" runat="server" Text="Part Suppliers:" />
                            </th>
                            <td class="editFieldControl">
                                <asp:DropDownList ID="DropDownList5" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <th   align="left">
                                <asp:Label ID="Label8" runat="server" Text="Special Software:" />
                            </th>
                            <td class="editFieldControl">
                                <asp:CheckBox ID="CheckBox2" runat="server" Checked="true" />
                            </td>
                            
                        </tr>
                        <tr>
                            <th   align="left">
                                <asp:Label ID="Label9" runat="server" Text="Need instructor:" />
                            </th>
                            <td class="editFieldControl">
                                <asp:CheckBox ID="CheckBox3" runat="server" Checked="true" />
                            </td>
                        
            </tr>
            <tr>
                <th   align="left">
                    <asp:Label ID="Label10" runat="server" Text="Learning Level:" />
                </th>
                <td class="editFieldControl">
                    <asp:DropDownList ID="DropDownList8" runat="server">
                    </asp:DropDownList>
                </td>
               
            </tr>
            <tr>
                <th  align="left">
                    <asp:Label ID="Label11" runat="server" Text="Part Suppliers:" />
                </th>
                <td class="editFieldControl">
                    <asp:DropDownList ID="DropDownList3" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <th    align="left">
                    <asp:Label ID="Label12" runat="server" Text="Special Software:" />
                </th>
                <td class="editFieldControl">
                    <asp:CheckBox ID="CheckBox4" runat="server" Checked="true" />
                </td>
               
            </tr>
            <tr>
                <th   align="left">
                    <asp:Label ID="Label13" runat="server" Text="Need instructor:" />
                </th>
                <td class="editFieldControl">
                    <asp:CheckBox ID="CheckBox5" runat="server" Checked="true" />
                </td>
            </tr>
            <tr>
                <th   align="left">
                    <asp:Label ID="Label14" runat="server" Text="Learning Level:" />
                </th>
                <td class="editFieldControl">
                    <asp:DropDownList ID="DropDownList4" runat="server">
                    </asp:DropDownList>
                </td>
               
            </tr>
            <tr>
                <th    align="left">
                    <asp:Label ID="Label15" runat="server" Text="Part Suppliers:" />
                </th>
                <td class="editFieldControl">
                    <asp:DropDownList ID="DropDownList6" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <th   align="left">
                    <asp:Label ID="Label16" runat="server" Text="Special Software:" />
                </th>
                <td class="editFieldControl">
                    <asp:CheckBox ID="CheckBox6" runat="server" Checked="true" />
                </td>
              
            </tr>
            <tr>
                <th   align="left">
                    <asp:Label ID="Label17" runat="server" Text="Need instructor:" />
                </th>
                <td class="editFieldControl">
                    <asp:CheckBox ID="CheckBox7" runat="server" Checked="true" />
                </td>
            </tr>
            <tr>
                <th    align="left">
                    <asp:Label ID="Label18" runat="server" Text="Learning Level:" />
                </th>
                <td class="editFieldControl">
                    <asp:DropDownList ID="DropDownList7" runat="server">
                    </asp:DropDownList>
                </td>
               
            </tr>
            <tr>
                <th    align="left">
                    <asp:Label ID="Label19" runat="server" Text="Part Suppliers:" />
                </th>
                <td class="editFieldControl">
                    <asp:DropDownList ID="DropDownList9" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <th   align="left">
                    <asp:Label ID="Label20" runat="server" Text="Special Software:" />
                </th>
                <td class="editFieldControl">
                    <asp:CheckBox ID="CheckBox8" runat="server" Checked="true" />
                </td>
               
            </tr>
        </table>
       </td>
       </tr>
    </table>
    </div>
  <script type="text/javascript">

      $('.pageBody').css('padding', '0');
      $('body>div').css('background-color', '#efefef')
      //$('.tab-tc:last').removeClass("tab-tc");
       
    </script>
</asp:Content>
