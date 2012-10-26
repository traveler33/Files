<%@ Page Language="C#" MasterPageFile="~/Master/Main.Master" AutoEventWireup="true"
    CodeBehind="ResourcePoolProfile.aspx.cs" Inherits="Pelesys.Scheduling.Web.Files.ResourcePoolProfile" %>

<%@ MasterType VirtualPath="~/Master/Main.Master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
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
                            <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" CssClass="gray"
                                Visible="true" Width="98%" Height="360px">
                                <asp:TabPanel ID="Tabs" HeaderText="Resource Type Profile" runat="server" ToolTip="">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblTab" runat="server" SkinID="label" Text="Profile" ToolTip="" />
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <asp:Panel ID="phTabs" runat="server">
                                            <div style="visibility: visible;margin: 4px;  padding-top:6px;" class="detailEdit"  >
                                                <table border="0" cellpadding="6" cellspacing="6" style="width: 100%; height: 100%;">
                                                    <tr>
                                                        <th align="left"  style=" width="150px;">
                                                            Name:<span class="required"></span>
                                                        </th>
                                                        <td  width="250px;">
                                                            <pel:SearchTextBox ID="SearchTextBox1" runat="server" Objective="userloginname" ValidationGroup="search"
                                                                Width="240px" />
                                                        </td>
                                                        <td   style=" width:40px;">
                                                        </td>
                                                        <th valign="top" align="left" width="150px;" >
                                                            <asp:Label ID="lblFormList" runat="server" Text="Resource Type:"></asp:Label><span
                                                                class="required"></span>
                                                        </th>
                                                        <td>
                                                            <asp:DropDownList ID="DropDownList9" runat="server" Width="200px">
                                                            </asp:DropDownList>
                                                            <asp:Button ID="Button2" runat="server" Text="Detail" SkinID="bntMiddle" />
                                                        </td>
                                                    </tr>
                                                     <tr>
                                                        <th valign="top" align="left">
                                                            Description:
                                                        </th>
                                                        <td  colspan="3">
                                                            <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Width="240px" Height="120px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
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
                                                    <table cellpadding="4" cellspacing="4" border="0" width="100%" style="height: 25px;">
                                                        <tr>
                                                            <th align="left" style="width: 80px;">
                                                                <asp:Label ID="lblName" runat="server" Text="Name:" />
                                                            </th>
                                                            <td>
                                                                <pel:ValidateTextBox ID="txtName" runat="server" Required="false" MaxLength="120"
                                                                    Width="120px" />
                                                            </td>
                                                            <th align="left" style="width: 80px;">
                                                                <asp:Label ID="lblSNumber" runat="server" Text="Serial No:" />
                                                            </th>
                                                            <td>
                                                                <pel:ValidateTextBox ID="txtSNumber" runat="server" Required="false" MaxLength="120"
                                                                    Width="120px" />
                                                            </td>
                                                            <th align="left" style="width: 80px;">
                                                                <asp:Label ID="lblResourceType" runat="server" Text="Type:" />
                                                            </th>
                                                            <td>
                                                                <asp:DropDownList ID="ddlResourceType" runat="server" Width="150px">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td align="left">
                                                                <asp:Button ID="bnSearch" runat="server" CssClass="refresh" ToolTip="Search" Text="Search"
                                                                    SkinID="bntMiddle" />
                                                                &#160;
                                                                <asp:Button ID="bntAdvance" runat="server" SkinID="bntMiddle" ToolTip="Advance Search"
                                                                    Text="Advance..." OnClientClick="parent.$.fancybox.open({href : '/files/Resources.aspx?rec_id=0&action=load&nohead=1', type: 'iframe'}); return false;" />
                                                                &#160;
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <%--tool bar--%>
                                                    <div class="statusBar">
<%--                                                        <asp:LinkButton ID="lbAddNewEnrollment" runat="server" CausesValidation="false" CssClass="add"
                                                            OnClientClick="parent.DefineFancyBox();return false;"></asp:LinkButton>--%>
                                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CssClass="add"
            PostBackUrl="~/Files/ResourceProfile.aspx?rec_id=0&action=load&nohead=1" ></asp:LinkButton>

           
                                                         <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" CssClass="undelete"
                                                            OnClientClick="parent.AddResourcePoolBox();return false;"></asp:LinkButton>
                                                        <asp:LinkButton ID="lbDeleteEnrollment" runat="server" CausesValidation="false" CssClass="delete"
                                                            Style="display: none;"></asp:LinkButton>
                                                        <%--withdraw--%>
                                                        <asp:LinkButton ID="lbRecoverEnrollmentDeleted" runat="server" CausesValidation="false"
                                                            CssClass="undelete" Style="display: none;">
                                                        </asp:LinkButton>
                                                        <%--unwithdraw--%>
                                                    </div>
                                                    <%--list view--%>
                                                    <div class="resultGridView" style="position: absolute; height: 280px; overflow: auto;  width:98%; border:1px solid lightgray;">
                                                                          <dx:ASPxGridView ID="gv" ClientInstanceName="grid" runat="server" 
                                                               KeyFieldName="ResourceID"     Border-BorderColor="LightGray" Border-BorderStyle="Solid"
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
                                                                     <dx:GridViewDataHyperLinkColumn  Caption="Resource Type" VisibleIndex="2">
                                                                        <DataItemTemplate>
                                                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Simulator">
                                                                            </dx:ASPxLabel>
                                                                        </DataItemTemplate>
                                                                     </dx:GridViewDataHyperLinkColumn>
                                                                     
                                                                       <dx:GridViewDataHyperLinkColumn  Caption="SerialNumber" VisibleIndex="2">
                                                                        <DataItemTemplate>
                                                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text=" X-ClaseRoom-12333">
                                                                            </dx:ASPxLabel>
                                                                        </DataItemTemplate>
                                                                     </dx:GridViewDataHyperLinkColumn>
                                                                     

                                                                        <dx:GridViewDataHyperLinkColumn  Caption="Hourly Rate" VisibleIndex="2">
                                                                        <DataItemTemplate>
                                                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="140">
                                                                            </dx:ASPxLabel>
                                                                        </DataItemTemplate>
                                                                     </dx:GridViewDataHyperLinkColumn>
                                                                     

                                                                        <dx:GridViewDataHyperLinkColumn  Caption="Location & Organization" VisibleIndex="2">
                                                                        <DataItemTemplate>
                                                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text=" building No 3, DownTown Training Center">
                                                                            </dx:ASPxLabel>
                                                                        </DataItemTemplate>
                                                                     </dx:GridViewDataHyperLinkColumn>
                                                                     
                                                                 
                                                                    </Columns>
                                                                    <Settings ShowGroupPanel="False" />
                                                                    <SettingsBehavior AllowFocusedRow="False" />
                                                                     <Settings GridLines="Vertical" />
                                                                     <Styles>
                                                                        <AlternatingRow Enabled="True" />
                                                                    </Styles>
                                                                      <SettingsPager PageSize="10">
                                                                        <PageSizeItemSettings Visible="true"  ShowAllItem="true" />
                                                                    </SettingsPager>
                                                                    </dx:ASPxGridView>
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
                    <div id="Div2" class="SaveCancelPanel" style="width: 98%;">
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
    <script type="text/javascript">

        $('.pageBody').css('padding', '0');
        $('body>div').css('background-color', '#efefef')
        //$('.tab-tc:last').removeClass("tab-tc");
       
    </script>
</asp:Content>
