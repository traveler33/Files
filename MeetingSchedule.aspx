<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MeetingSchedule.aspx.cs"
    MasterPageFile="~/Master/Main.Master" Inherits="Pelesys.Scheduling.Web.Files.MeetingSchedule" %>

<%@ Register Src="../Control/ucRecurrence.ascx" TagName="ucLocation" TagPrefix="uc1" %>
<%@ MasterType VirtualPath="~/Master/Main.Master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script type="text/javascript">
        function LocDefineFancyBox() {

            $("#StudentList").fancybox({
                'autoScale': false,
                'autoDimensions': false,
                'width': 1300,
                'transitionIn': 'elastic',
                'transitionOut': 'elastic',
                'padding': 6,

                'titlePosition': 'inside',
                'titleShow': true,

                "onUpdate": function () {
                    $(".fancybox-title").css({ 'top': '-30px', 'bottom': 'auto' });
                },
                "afterLoad": function () {
                    $(".fancybox-title").css({ 'top': '-30px', 'bottom': 'auto' });
                }
            });

            LocreadyFancy();
        }
        function LocreadyFancy() {

            $('#StudentList').trigger('click');
            // window.setTimeout('parent.$.fancybox.close();', 2500);


        }


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div id="Div1" class="TitlePanel" style="border-top: solid 2px white;  margin: 4px; padding: 4px; height: 470px;">
        <table border="0" cellpadding="2" cellspacing="2" width="100%">
            <tr>
                <td>
                    <div id="Div3" class="SaveCancelPanel" style="width: 100%;">
                        <table border="0" cellpadding="2" cellspacing="2" style="width: 100%; height: 100%;">
                            <tr>
                                <td align="right">
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <div class="RightAdminPanel">
                                                <table border="0" width="100%" class="detailEdit">
                                                    <tr>
                                                        <td align="left">
                                                            <table border="0" cellpadding="2" cellspacing="2" width="1100px">
                                                                <tr>
                                                                    <th style="width: 100px;">
                                                                        From:
                                                                    </th>
                                                                    <td align="left" style="width: 160px;">
                                                                        <pel:AdvancedCalendar ID="AdvancedCalendar8" runat="server" IsRequired="false" Width="120px" />
                                                                    </td>
                                                                    <th style="width: 100px;">
                                                                        Prep Time:
                                                                    </th>
                                                                    <td style="width: 50px;">
                                                                        <asp:TextBox ID="TextBox4" runat="server" Width="30px"></asp:TextBox>
                                                                    </td>
                                                                    <th style="width: 100px;">
                                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;To:
                                                                    </th>
                                                                    <td align="left" style="width: 160px;">
                                                                        <pel:AdvancedCalendar ID="AdvancedCalendar9" runat="server" IsRequired="false" Width="120px" />
                                                                    </td>
                                                                    <th style="width: 100px;">
                                                                        Cleanup Time:
                                                                    </th>
                                                                    <td style="width: 50px;">
                                                                        <asp:TextBox ID="TextBox5" runat="server" Width="30px"></asp:TextBox>
                                                                    </td>
                                                                    <th style="width: 180px;">
                                                                        Included Weekend:
                                                                        <asp:CheckBox ID="CheckBox1" runat="server" />
                                                                    </th>
                                                                    <th>
                                                                        <asp:Button ID="Button6" runat="server" Text="Recurrence" SkinID="bntMiddle" OnClientClick="LocDefineFancyBox();" />
                                                                    </th>
                                                                    <th>
                                                                    </th>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td style="width: 150px;">
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="height: 10px;">
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Height="330px"
                        Width="100%" CssClass="gray">
                        <asp:TabPanel HeaderText="Profile" Visible="true" runat="server" ID="dbstructure">
                            <ContentTemplate>
                                <div class="detailEdit" style="visibility: visible; margin: 4px; padding-top: 6px;
                                    width: 98%;">
                                    <table border="0" cellpadding="8" cellspacing="8" style="width: 1200px; height: 100%;"
                                        class="detailEdit">
                                        <tr>
                                            <th style="width: 150px;">
                                                <asp:Label ID="Label3" runat="server" Text="Meeting Subject:"></asp:Label>
                                            </th>
                                            <td>
                                                <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Width="700" Height="120px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th valign="top" align="left" style="width: 150px;">
                                                Meeting Type:
                                            </th>
                                            <td align="left">
                                                <asp:DropDownList ID="DropDownList1" runat="server" Width="300px">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td  colspan="2" >
                                                <table cellpadding="1" cellspacing="1" width="1120px">
                                                    <tr>
                                                        <th valign="top" align="left" style="width: 150px;">
                                                            Host:
                                                        </th>
                                                        <td>
                                                            <asp:TextBox ID="TextBox9" runat="server" Width="300px"></asp:TextBox>
                                                            <asp:Button ID="Button2" runat="server" Text="..." CssClass="ShortButton" />
                                                       </td>
                                                       <td style="  width:40px ">
                                                       
                                                       </td>
                                                            <th valign="top" align="left" style="width: 150px;">
                                                                Booked By:
                                                            </th>
                                                            <td>
                                                                <asp:TextBox ID="TextBox3" runat="server" Width="300px"></asp:TextBox>
                                                                <asp:Button ID="Button3" runat="server" Text="..." CssClass="ShortButton" />
                                                            </td>
                                                        </tr>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel HeaderText="Meeting Room" Visible="true" runat="server" ID="TabPanel4">
                            <ContentTemplate>
                                <div style="visibility: visible; margin: 4px;" class="detailEdit">
                                    <table border="0" cellpadding="2" cellspacing="2" width="100%">
                                      
                                        <tr>
                                            <th align="left">
                                                Meeting Room:
                                            </th>
                                            <td>
                                                <asp:Button ID="Button16" runat="server" Text="+" CssClass="ShortButton" OnClientClick="DefineFancyBox();return false;" />
                                                <asp:Button ID="Button17" runat="server" Text="-" CssClass="ShortButton" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th valign="top" align="left">
                                            </th>
                                            <td>
                                                <div style="height: 270px; width: 1050px; border: 1px lightgray solid; overflow: auto;">
                                                    <asp:TreeView ID="TreeView1" runat="server">
                                                    </asp:TreeView>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel HeaderText="Meeting Resource" Visible="true" runat="server" ID="TabPanel2">
                            <ContentTemplate>
                                <div style="visibility: visible; margin: 4px;" class="detailEdit">
                                    <table border="0" cellpadding="2" cellspacing="2" width="100%">
                                        <tr>
                                            <th  colspan="2">
                                                    <table cellpadding ="0" cellspacing="0">
                                                                              <tr>
                                                                <th align="left">
                                                                    Meeting Resource:
                                                                </th>
                                                                <td>
                                                                    <asp:Button ID="Button4" runat="server" Text="+" CssClass="ShortButton" OnClientClick="DefineFancyBox();return false;" />
                                                                    <asp:Button ID="Button5" runat="server" Text="-" CssClass="ShortButton" />
                                                                </td>
                                                                <td  style="  width: 740px;  "    ></td>
                                                                   <td align="left">
                                                                                <asp:Button ID="Button7" runat="server" Text="Check Availability" CssClass="lButton"
                                                                                    OnClientClick="showModalNoFrame('../Files/CheckAvailability.aspx?nohead=1', 'CheckAvailability', 450, 350); return false;" />
                                                                            </td>
                                                            </tr>
                                                    </table>
                                            </th>
                                        </tr>
                                      
                                        <tr>
                                            <th valign="top" align="left">
                                            </th>
                                            <td>
                                                <div style="height: 286px; width: 1050px; border: 1px lightgray solid; overflow: auto;">
                                                    <div class="resultGridView">
                                                  <dx:ASPxGridView ID="GridView1" ClientInstanceName="grid" runat="server" 
                                                               KeyFieldName="UserID"     Border-BorderColor="LightGray" Border-BorderStyle="Solid"
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
                                                                    <dx:GridViewDataColumn FieldName="FirstName" VisibleIndex="1"  Caption="Resource Name" SortOrder="Ascending"   />

                                                                     <dx:GridViewDataHyperLinkColumn  Caption="Location" VisibleIndex="2">
                                                                        <DataItemTemplate>
                                                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text=" Airbus 322">
                                                                            </dx:ASPxLabel>
                                                                        </DataItemTemplate>
                                                                     </dx:GridViewDataHyperLinkColumn>
                                                                     
                                                                      <dx:GridViewDataHyperLinkColumn  Caption="Resource Type" VisibleIndex="3">
                                                                        <DataItemTemplate>
                                                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Job Role">
                                                                            </dx:ASPxLabel>
                                                                        </DataItemTemplate>
                                                                     </dx:GridViewDataHyperLinkColumn>


                                                                       <dx:GridViewDataHyperLinkColumn  Caption="Contact Person" VisibleIndex="4">
                                                                        <DataItemTemplate>
                                                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text=" Traing Group A">
                                                                            </dx:ASPxLabel>
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
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel HeaderText="Attendees" Visible="true" runat="server" ID="TabPanel1">
                            <ContentTemplate>
                                <div style="visibility: visible; margin: 4px;" class="detailEdit">
                                    <table border="0" cellpadding="2" cellspacing="2" width="100%">
                                        <tr>
                                            <th align="left">
                                                Add Attendees:
                                            </th>
                                            <td>
                                                <table border="0" cellpadding="2" cellspacing="2" width="100%">
                                                    <tr>
                                                        <th align="left" style="width: 800px;">
                                                            <asp:Button ID="Button9" runat="server" Text="+" CssClass="ShortButton" OnClientClick="LocDefineFancyBox(); return false;" />
                                                            <asp:Button ID="Button10" runat="server" Text="-" CssClass="ShortButton" />
                                                          
                                                        </th>
                                                        <td align="left">
                                                            <asp:Button ID="Button15" runat="server" Text="Check Availability" CssClass="lButton"
                                                                OnClientClick="showModalNoFrame('../Files/CheckAvailability.aspx?nohead=1', 'CheckAvailability', 450, 350); return false;" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th valign="top" align="left">
                                            </th>
                                            <td>
                                                <div style="height: 286px; width: 1050px; border: 1px lightgray solid; overflow: auto;">
                                                    <div class="resultGridView">
                                                             <dx:ASPxGridView ID="GridView4" ClientInstanceName="grid" runat="server" 
                                                               KeyFieldName="UserID"     Border-BorderColor="LightGray" Border-BorderStyle="Solid"
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
                                                                    <dx:GridViewDataColumn FieldName="FirstName" VisibleIndex="1"  Caption="Name" SortOrder="Ascending"   />

                                                                     <dx:GridViewDataHyperLinkColumn  Caption="Equipment" VisibleIndex="2">
                                                                        <DataItemTemplate>
                                                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text=" Airbus 322">
                                                                            </dx:ASPxLabel>
                                                                        </DataItemTemplate>
                                                                     </dx:GridViewDataHyperLinkColumn>
                                                                     
                                                                      <dx:GridViewDataHyperLinkColumn  Caption="Job Role" VisibleIndex="3">
                                                                        <DataItemTemplate>
                                                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Job Role">
                                                                            </dx:ASPxLabel>
                                                                        </DataItemTemplate>
                                                                     </dx:GridViewDataHyperLinkColumn>


                                                                       <dx:GridViewDataHyperLinkColumn  Caption="Group" VisibleIndex="4">
                                                                        <DataItemTemplate>
                                                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text=" Traing Group A">
                                                                            </dx:ASPxLabel>
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
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel HeaderText="Notes" Visible="true" runat="server" ID="TabPanel5">
                            <ContentTemplate>
                                <div style="visibility: visible; margin: 4px;" class="detailEdit">
                                    <table border="0" cellpadding="2" cellspacing="2" width="850px">
                                        <tr>
                                            <td colspan="2" style="height: 10px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th style="width: 150px;">
                                                Notes:
                                            </th>
                                            <td align="center">
                                                <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Width="700px" Height="240px"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                    </asp:TabContainer>
                </td>
            </tr>
            <tr style="height: 10px;">
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="Div2" class="SaveCancelPanel" style="width: 100%;">
                        <table border="0" cellpadding="2" cellspacing="2" style="width: 100%; height: 100%;">
                            <tr>
                                <td align="right">
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <div class="RightAdminPanel">
                                                <table border="0" width="100%">
                                                    <tr>
                                                        <td align="right">
                                                          
                                                            <asp:Button ID="bntSave" runat="server" Text="Save" SkinID="bntMiddle" />
                                                            <asp:Button ID="bntCancel" runat="server" Text="Cancel" SkinID="bntMiddle" />
                                                        </td>
                                                        <td style="width: 150px;">
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
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
    <asp:TextBox ID="hfCurrentId" runat="server" Style="display: none"></asp:TextBox>
    <asp:HiddenField ID="hfCurrentDomainID" runat="server" />
    <asp:HiddenField ID="hfInitialTreePath" runat="server" />
    <asp:HiddenField ID="hfCourseID" runat="server" />
    <asp:HiddenField ID="hfIsPublishOrShareCourse" runat="server" />
    <asp:HiddenField ID="hfIsShare" runat="server" />
    <input id="hdnIframePageName" type="hidden" />
    <script type="text/javascript">

        $('.pageBody').css('padding', '0');
        $('body>div').css('background-color', '#efefef')
        //$('.tab-tc:last').removeClass("tab-tc");
       
    </script>
    <a id="StudentList" href="#AddStudents" title="Recurrence" style="display: none;">Inline</a>
    <asp:HiddenField ID="HiddenField3" runat="server" />
    <asp:HiddenField ID="HiddenField4" runat="server" />
    <div style="display: none;">
        <div id="AddStudents" style="width: 840px; height: 520px;">
            <uc1:ucLocation ID="ucLocation1" runat="server" />
        </div>
    </div>
</asp:Content>
