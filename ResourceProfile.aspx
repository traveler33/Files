<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Main.Master" AutoEventWireup="true" CodeBehind="ResourceProfile.aspx.cs" Inherits="Pelesys.Scheduling.Web.Files.ResourceProfile" %>
<%@ Register Src="../Control/ucResourceProfile.ascx" TagName="ucResourceProfile"
    TagPrefix="uc1" %>
<%@ Register Src="../Control/ucSimulatorData.ascx" TagName="ucSimulatorData"
    TagPrefix="uc2" %>
<%@ MasterType VirtualPath="~/Master/Main.Master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
 <div id="ResourceTypeTab" class="TabPanelControl" style="margin: 4px; padding: 1px; width:99%; overflow: hidden;">
        <table cellpadding="6" cellspacing="6" border="0"  width="100%">
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" CssClass="gray"
                                Visible="true" Width="98%" Height="350px">
                                <asp:TabPanel ID="Tabs" HeaderText="Resource Type Profile" runat="server" ToolTip="">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblTab" runat="server" SkinID="label" Text="Profile" ToolTip="" />
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <asp:Panel ID="phTabs" runat="server">
                                            <div style="visibility: visible;margin: 4px;  padding-top:6px;" class="detailEdit"  >
                                              <uc1:ucResourceProfile ID="ucResourceProfile1" runat="server" />
                                            </div>
                                        </asp:Panel>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel ID="TabPanel1" HeaderText="Resource Type Profile" runat="server" ToolTip="Add new tabs, remove tabs and manage tabs">
                                    <HeaderTemplate>
                                        <asp:Label ID="Label1" runat="server" SkinID="label" Text="Resources" ToolTip="Add new tabs, remove tabs and manage tabs" />
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <asp:Panel ID="Panel2" runat="server">
                                            <div style="visibility: visible; margin: 4px; padding-top: 8px;" class="detailEdit">
                                                <div>
                                                 <uc2:ucSimulatorData ID="ucSimulatorData" runat="server" />
                                                    </div>
                                                </div>
                                        </asp:Panel>
                                    </ContentTemplate>
                                </asp:TabPanel>
                            </asp:TabContainer>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="Div1" class="SaveCancelPanel" style="width: 98%;">
                        <table border="0" cellpadding="2" cellspacing="2" style="width: 100%; height: 100%;">
                            <tr>
                                <td style="width: 70%; font-size: 10px; font-weight: normal;">
                                    <asp:Panel ID="Panel12" runat="server">
                                    </asp:Panel>
                                </td>
                                <td align="left">
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                           
                                            <asp:Button ID="Button1" runat="server" Text="Save" SkinID="bntMiddle" />
                                            <asp:Button ID="Button2" runat="server" Text="Cancel" SkinID="bntMiddle" />
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


                    <script type="text/javascript">

                        $('.pageBody').css('padding', '0');
                        $('body>div').css('background-color', '#efefef')
                        //$('.tab-tc:last').removeClass("tab-tc");
       
    </script>
</asp:Content>
