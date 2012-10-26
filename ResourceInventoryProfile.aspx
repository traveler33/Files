<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResourceInventoryProfile.aspx.cs"
 MasterPageFile="~/Master/Main.Master"
 Inherits="Pelesys.Scheduling.Web.Files.ResourceInventoryProfile" %>

<%@ MasterType VirtualPath="~/Master/Main.Master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div style="visibility: visible; margin: 4px; padding-top: 4px; height: 90%; width: 90%; position: absolute; ">
                <table border="0" cellpadding="6" cellspacing="6" width="100%">
                    <tr>
                        <td align="left"  style=" font-weight:bold; font-size: 11px;"   colspan= "2"      >
                            <asp:Label ID="Label1" runat="server" Text="Add New Resource Inventory"></asp:Label></span>
                        </td>
                      
                    </tr>
                   
                    <tr>
                        <th align="left" style="width: 150px; font-size: 11px; font-weight: normal;">
                            <asp:Label ID="Label5" runat="server" Text="Locotion & Organization:"></asp:Label>
                            <span class="required">
                        </th>
                        <td class="detailEditColumn" align="left">
                            <asp:TextBox ID="TextBox4" runat="server" Width="300px" MaxLength="300"></asp:TextBox><asp:Button
                                ID="Button1" runat="server" Text="..." />
                        </td>
                    </tr>
                    <tr>
                        <th valign="top" align="left" style="width: 150px; font-size: 11px; font-weight: normal;">
                            <asp:Label ID="lblFormList" runat="server" Text="Resource Pool:"></asp:Label><span
                                class="required"></span>
                        </th>
                        <td>
                            <asp:DropDownList ID="DropDownList9" runat="server" Width="80%">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <th align="left" style="width: 150px; font-size: 11px; font-weight: normal;">
                            <asp:Label ID="Label2" runat="server" Text="Unit Cost Price:"></asp:Label>
                           
                        </th>
                        <td class="detailEditColumn" align="left">
                            <asp:TextBox ID="TextBox1" runat="server" Width="100px" MaxLength="100"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <th align="left" style="width: 150px; font-size: 11px; font-weight: normal;">
                            <asp:Label ID="Label3" runat="server" Text="Quantity:"></asp:Label> <span class="required"></span>
                        </th>
                        <td class="detailEditColumn" align="left">
                            <asp:TextBox ID="TextBox2" runat="server" Width="100px" MaxLength="100"></asp:TextBox>
                            
                        </td>
                    </tr>
                    <tr>
                        <th align="left" style="width: 150px; font-size: 11px; font-weight: normal;">
                            <asp:Label ID="Label4" runat="server" Text="Inventory Check:"></asp:Label>
                        </th>
                        <td class="detailEditColumn" align="left">
                            <asp:CheckBox ID="CheckBox1" runat="server" />
                            
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
   <div id="Div2" class="SaveCancelPanel" style="position: absolute; top: 542px; left: 1px; width:99%;">
        <table border="0" cellpadding="2" cellspacing="2" style="width: 100%; height: 100%;">
            <tr>
                <td style="width: 70%; font-size: 10px; font-weight: normal;">
                    <asp:Panel ID="Panel1" runat="server">
                    </asp:Panel>
                </td>
                <td align="left">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                        
                            <asp:Button ID="bntSave" runat="server" Text="Save" SkinID="bntMiddle" />
                            <asp:Button ID="bntCancel" runat="server" Text="Cancel" SkinID="bntMiddle" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
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
