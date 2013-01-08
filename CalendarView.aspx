<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Main.Master" AutoEventWireup="true"
    ValidateRequest="false" CodeBehind="CalendarView.aspx.cs" Inherits="Pelesys.Scheduling.Web.Files.CalendarView" %>

<%@ Register Assembly="DevExpress.Web.v12.1, Version=12.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.1, Version=12.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxSplitter" TagPrefix="dx" %>
<%@ Register Src="../Control/ucLocation.ascx" TagName="ucLocation" TagPrefix="uc3" %>
<%@ Register Src="../Control/ucResourceSelection.ascx" TagName="ucResourceSelection"
    TagPrefix="uc1" %>
<%@ Register Src="~/Control/ucSearchResults.ascx" TagName="ctrSearchResults" TagPrefix="uc4" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ MasterType VirtualPath="~/Master/Main.Master" %>
<asp:content id="Content1" contentplaceholderid="Head" runat="server">
    <script type="text/javascript" src="../js/eform/jquery.ui.core.js"></script>
    <script type="text/javascript" src="../js/eform/jquery.ui.draggable.js"></script>
    <script type="text/javascript" src="../js/eform/jquery.ui.droppable.js"></script>
    <script type="text/javascript">
        $(init);

        function init() {
            $('#searchResultWidnow').draggable(

          );
        }

        function LocDefineFancyBox() {

            $("#locationList").fancybox({
                'autoScale': false,
                'autoDimensions': false,
                'width': 1200,
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

            $('#locationList').trigger('click');
            // window.setTimeout('parent.$.fancybox.close();', 2500);


        }


    </script>
    <script type="text/javascript">
        function ClearSearch(IsHide) {

            if (IsHide) {
                $('#grid').hide();
                $('#searchResultWidnow').hide();

            }
            else {
                $('#grid').show();

                $('#searchResultWidnow').show();

            }


        }
        function ResizeSplitterPane(IsResizeToSmall) {
            var leftPane = CalendarViewSplitter.GetPaneByName('leftSearchBar');
            if (!IsResizeToSmall) {
                leftPane.SetSize(400);
                $('#searchTab').show();
                $("#SearchBarMasterView").addClass("SearchBar");
                $("#SearchBarSearch").addClass("SearchBarOnClick");
                $("#SearchBarMasterView").removeClass("SearchBarOnClick");
                $("#SearchBarSearch").removeClass('SearchBar');
            }
            else {

                leftPane.SetSize(104);
                $('#searchTab').hide();
                $("#SearchBarSearch").removeClass("SearchBarOnClick");
                $("#SearchBarMasterView").removeClass('SearchBar');
                $("#SearchBarSearch").addClass("SearchBar");
                $("#SearchBarMasterView").addClass("SearchBarOnClick");
            }

        }
    </script>
</asp:content>
<asp:content id="Content2" contentplaceholderid="Content" runat="server">
    <div style="visibility: visible; margin: 4px; padding: 4px; border-top: 6px solid white;
        border-left: 4px solid white; border-right: 4px solid white;">
        <dx:ASPxSplitter ID="ASPxSearch" runat="server" Height="880px" ClientInstanceName='CalendarViewSplitter'>
            <Panes>
                <dx:SplitterPane Name="leftSearchBar" MinSize="102px" MaxSize="680px" Size="104px"
                    ScrollBars="Auto">
                    <PaneStyle>
                        <Border BorderColor="LightGray" BorderStyle="Solid" BorderWidth="1px"></Border>
                    </PaneStyle>
                    <ContentCollection>
                        <dx:SplitterContentControl ID="searchBar" runat="server">
                            <div style="text-align: left;">
                                <table width="100%">
                                    <tr valign="top">
                                        <td style="width: 99px">
                                            <table border="0" style="background-color: #efefef;" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <div id="SearchBarMasterView" onclick=" ResizeSplitterPane(true);" class="SearchBarOnClick">
                                                            <asp:label runat="server" text="Master Calendar"></asp:label>
                                                        
                                                            <asp:image runat="server" imageurl="~/Images/mastercalender.png">
                                                            </asp:image>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div id="SearchBarSearch" onclick=" ResizeSplitterPane(false);" class="SearchBar">
                                                            <asp:label runat="server" text="Search"></asp:label><br />
                                                          
                                                            <asp:image runat="server" imageurl="~/Images/searchschedule.png">
                                                            </asp:image>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div id="SearchBarPersonalSechedule" class="SearchBar">
                                                            <asp:label runat="server" text="Personal Schedule"></asp:label>
                                                            <br />
                                                            <asp:image runat="server" imageurl="~/Images/personalschedule_a.png">
                                                            </asp:image>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div id="SearchBarManageCurriculum" class="SearchBar">
                                                            <asp:label runat="server" text="Manage Curriculum"></asp:label>
                                                            <br />
                                                            <asp:image runat="server" imageurl="~/Images/schedulecurriculum.png">
                                                            </asp:image>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div id="SearchBarNewMeeting" class="SearchBar">
                                                            <asp:label runat="server" text="New Meeting"></asp:label>
                                                            <br />
                                                            <br />
                                                            <asp:image runat="server" imageurl="~/Images/newmeeting.png">
                                                            </asp:image>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div id="SearchBarNewEvent" class="SearchBar">
                                                            <asp:label runat="server" text="New Event"></asp:label>
                                                            <br />
                                                            <br />
                                                            <asp:image runat="server" imageurl="~/Images/newevent.png">
                                                            </asp:image>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>
                                            <div id="searchTab" style="display: none;">
                                                <table border="0" style="background-color: #efefef;" cellpadding="0" cellspacing="0"
                                                    width="99%">
                                                    <tr align="left" valign="top">
                                                        <td>
                                                            <asp:updatepanel id="UpdatePanel2" runat="server">
                                                                <contenttemplate>
                                                                <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" CssClass="gray"
                                                                    Visible="true" Width="98%" Height="840px">
                                                                    <asp:TabPanel ID="Tabs" HeaderText="Search" runat="server" ToolTip="">
                                                                        <HeaderTemplate>
                                                                            <asp:Label ID="lblTab" runat="server" SkinID="label" Text="Search" ToolTip="" />
                                                                        </HeaderTemplate>
                                                                        <ContentTemplate>
                                                                            <asp:Panel ID="phTabs" runat="server">
                                                                                <div style="visibility: visible; background-color: #efefef; padding-top:6px;" class="detailEdit"   >
                                                                                       <table border="0"  cellpadding="4" cellspacing="4" width="100%" style=" height:100%">
                                                                                            <tr>
                                                                                                <td style=" width:150px">
                                                                                                 <asp:TextBox ID="txtName" runat="server"  
                                                                                                        Height="20px" Width="150px"></asp:TextBox>
                                                                                                   <asp:TextBoxWatermarkExtender ID="NameWatermark" runat="server" WatermarkText=" Name..."
                                                                                                        TargetControlID="txtName" WatermarkCssClass="SearchWaterMark">
                                                                                                    </asp:TextBoxWatermarkExtender>
                                                                                                </td>
                                                                                                 <td> &nbsp;
                                                                                                   <asp:LinkButton id="lnkClearSearch" runat="server" OnClientClick="ClearSearch(true); return false;"   text="Clear All"  SkinID ="bButton"  />
                                                                                                 
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <pel:AdvancedCalendar ID="calFrom" runat="server" IsRequired="false"   Width="130px" />
                                                                                                   
                                                                                                </td>
                                                                                                 <td>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                     <pel:AdvancedCalendar ID="calTo" runat="server" IsRequired="false"   Width="130px" />
                                                                                                 
                                                                                                </td>
                                                                                                 <td>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                     <asp:TextBox ID="txtLocation" runat="server"  
                                                                                                        Height="20px" Width="150px"></asp:TextBox>
                                                                                                   <asp:TextBoxWatermarkExtender ID="locWatermark" runat="server" WatermarkText=" Location..."
                                                                                                        TargetControlID="txtLocation" WatermarkCssClass="SearchWaterMark">
                                                                                                    </asp:TextBoxWatermarkExtender>
                                                                                                </td>
                                                                                                 <td> &nbsp;
                                                                                                 <asp:LinkButton id="lnkLocSearch" runat="server" text="..."  SkinID ="bButton"   OnClientClick="LocDefineFancyBox(); return false;"   />
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td colspan="2">
                                                                                                     <table border="0"  cellpadding="6" cellspacing="6" width="260px">
                                                                                                        <tr>
                                                                                                        <th  colspan="2">
                                                                                                            <asp:CheckBox runat="server"  ></asp:CheckBox> &nbsp;Published Curriculums
                                                                                                        </th>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                         <th  colspan="2">
                                                                                                          <asp:CheckBox runat="server"></asp:CheckBox> &nbsp;Unpublished Curriculums
                                                                                                        </th>
                                                                                                        
                                                                                                        </tr>
                                                                                                        
                                                                                                         <tr>
                                                                                                            <th><asp:CheckBox runat="server"></asp:CheckBox> &nbsp;Resources</th>
                                                                                                            
                                                                                                              <th><asp:CheckBox runat="server"></asp:CheckBox> &nbsp;Instructors</th>
                                                                                                        </tr>
                                                                                                          <tr>
                                                                                                            <th><asp:CheckBox runat="server"></asp:CheckBox> &nbsp;Students</th>
                                                                                                            
                                                                                                              <th><asp:CheckBox runat="server"></asp:CheckBox> &nbsp;Events</th>
                                                                                                        </tr>
                                                                                                         <tr>
                                                                                                            <th><asp:CheckBox runat="server"></asp:CheckBox> &nbsp;All</th>
                                                                                                         
                                                                                                              <th> &nbsp; &nbsp; &nbsp; &nbsp;<asp:LinkButton id="lnkSearch" OnClick="Search_click"   runat="server" text="Search"  SkinID ="bButton"  /></th>
                                                                                                        </tr>
                                                                                                       
                                                                                                        <tr>
                                                                                                            <td  colspan="2" >
                                                                                                                <hr style=" width:100%; background-color: Gray; height:2px; text-align:center; " />
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr  style=" height:22px;"> 
                                                                                                            <td colspan="2" >
                                                                                                            <table  border="0" >
                                                                                                                <tr>
                                                                                                                    <td >  <h4> <asp:Label runat="server" Text="Search Results"></asp:Label></h4> </td>
                                                                                                                    <td>   <asp:LinkButton id="lnkView"   OnClientClick="ClearSearch(false);" runat="server" text="View Selected"  SkinID ="bButton"  />
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                         
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                          <tr  style=" height:20px;" >
                                                                                                            <th  colspan="2" >
                                                                                                                <asp:Label runat="server" Text="Select events to view on the calendar"></asp:Label>
                                                                                                            </th>
                                                                                                        </tr>
                                                                                                         <tr>
                                                                                                            <td  colspan="2" style=" height:510px;">
                                                                                                                 <div id="grid" class="resultGridView" style="position: absolute; height: 510px; overflow: auto;  width:254px; border:1px solid lightgray; ">
                                                                                                                     <dx:ASPxGridView ID="gv" ClientInstanceName="grid" runat="server" 
                                                                                                                           KeyFieldName="ID"     Border-BorderColor="LightGray" Border-BorderStyle="Solid"
                                                                                                                            Border-BorderWidth=1   Font-Names="Verdana" Font-Size="10px"  ForeColor="#342F2F"  
                                                                                                                         AutoGenerateColumns="False"   Theme="Office2010Black"   
                                                                                                                                EnableRowsCache="True" Width="250px" DataSourceForceStandardPaging="False" 
                                                                                                                                SettingsPager-AlwaysShowPager="True" SettingsPager-Position="Bottom">
                                                                                                                                <Columns>
                                                                                                                               <dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0"  Width="26px" >
                                                                                                                                    <HeaderTemplate>
                                                                                                                                        <asp:CheckBox ID="CheckBox2" runat="server" />
                                                                                                                                    </HeaderTemplate>
                                                                                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                                                                                </dx:GridViewCommandColumn>
                                                                                                                                <dx:GridViewDataColumn FieldName="Name" VisibleIndex="1"  Caption="Name" SortOrder="Ascending"  Width="100px"   />
                                                                                                                                 <dx:GridViewDataColumn FieldName="Date" VisibleIndex="2"  Caption="Date" SortOrder="Ascending" Width="100px"    />
                                                                     
                                                                                                                                
                                                                 
                                                                                                                                </Columns>
                                                                                                                                <Settings ShowGroupPanel="False" />
                                                                                                                                <SettingsBehavior AllowFocusedRow="False" />
                                                                                                                                 <Settings GridLines="Vertical" />
                                                                                                                                 <Styles>
                                                                                                                                    <AlternatingRow Enabled="True" />
                                                                                                                                </Styles>
                                                                                                                                  <SettingsPager PageSize="10">
                                                                                                                                    <PageSizeItemSettings Visible="false"  ShowAllItem="true" />
                                                                                                                                </SettingsPager>
                                                                                                                                </dx:ASPxGridView>
                                                                                                                </div>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td  align='center' > <asp:LinkButton id="lnkClearSearch1" runat="server" OnClientClick="ClearSearch(true); return false;"   text="Clear All"  SkinID ="bButton"  /></td>
                                                                                                                <td  align='center' >
                                                                                                                 
                                                                                                                    
                                                                                                                       <asp:LinkButton id="lnkGo" runat="server" OnClientClick="ClearSearch(true); return false;"   text="Go Calendar"  SkinID ="bButton"  />
                                                                                                    
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                         </table>
                                                                                                
                                                                                                </td>
                                                                                            
                                                                                            </tr>
                                                                                       </table>
                                                                                </div>
                                                                            </asp:Panel>
                                                                        </ContentTemplate>
                                                                    </asp:TabPanel>
                                                                    <asp:TabPanel ID="TabPanel1" HeaderText="Resource Type Profile" runat="server" ToolTip="Add new tabs, remove tabs and manage tabs">
                                                                        <HeaderTemplate>
                                                                            <asp:Label ID="Label1" runat="server" SkinID="label" Text="Advanced" ToolTip="Add new tabs, remove tabs and manage tabs" />
                                                                        </HeaderTemplate>
                                                                        <ContentTemplate>
                                                                            <asp:Panel ID="Panel2" runat="server">
                                                                                <div style="visibility: visible; margin: 4px; padding-top: 8px;" class="detailEdit">
                                                                                    <div>
                                                                                  
                                                                                        </div>
                                                                                    </div>
                                                                            </asp:Panel>
                                                                        </ContentTemplate>
                                                                    </asp:TabPanel>
                                                                </asp:TabContainer>
                                                            </contenttemplate>
                                                            </asp:updatepanel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </dx:SplitterContentControl>
                    </ContentCollection>
                </dx:SplitterPane>
                <dx:SplitterPane>
                    <PaneStyle>
                        <Border BorderColor="LightGray" BorderStyle="Solid" BorderWidth="1px"></Border>
                    </PaneStyle>
                    <ContentCollection>
                        <dx:SplitterContentControl ID="SplitterContentControl2" runat="server">
                            <div id="scheduler_here" style='width: 100%; height: 100%; background-color: #fff;   overflow: auto'>
                                <dx:ASPxScheduler ID="ASPxScheduler1" runat="server" Width="100%" heighty="1000px"
                                    Theme="Office2010Black" OnPopupMenuShowing="ASPxScheduler1_PreparePopupMenu"       OnHtmlTimeCellPrepared= "ASPxScheduler1_HtmlTimeCellPrepared"
                                    GroupType="Resource" Start="2010-07-13">
                                     <ResourceNavigator Visibility="Never" />
                                    <Styles>
                                        <Appointment>
                                        </Appointment>
                                    </Styles>
                                    <views>
        
                                    <DayView ResourcesPerPage="4">
                                        <TimeRulers>
                                            <dx:TimeRuler />
                                        </TimeRulers>
                                        <DayViewStyles ScrollAreaHeight="400px" />
                                    </DayView>


                                    <WorkWeekView ResourcesPerPage="6">
                                        <TimeRulers>
                                            <dx:TimeRuler />
                                        </TimeRulers>
                                        <WorkWeekViewStyles ScrollAreaHeight="200px" />
                                    </WorkWeekView>
                                    <WeekView ResourcesPerPage="6">
                                        <WeekViewStyles>
                                            <DateCellBody Height="240px" />
                                        </WeekViewStyles>
                                    </WeekView>
                                    <MonthView ResourcesPerPage="6">
                                        <MonthViewStyles>
                                            <DateCellBody Height="240px" 
                                            />
                                        </MonthViewStyles>
                                    </MonthView>
                                    <TimelineView ResourcesPerPage="6">
                                         <TimelineViewStyles>
                                            <TimelineCellBody Height="240px"     />
                                        </TimelineViewStyles>
                                    </TimelineView>
                                </views>
                                    <storage enablereminders="false">
                                </storage>
                                </dx:ASPxScheduler>
                            </div>
                        </dx:SplitterContentControl>
                    </ContentCollection>
                </dx:SplitterPane>
            </Panes>
        </dx:ASPxSplitter>
    </div>
    <div id="searchResultWidnow" style="padding: 8px; z-index: 99999; position: absolute;
        top: 154px; left: 402px; width: 240px; height: 840px; background-color: #efefef;
        border: 2px solid White; cursor: pointer;">
        <table width="100%" style="height: 25px; z-index: 999;" border="0" cellpadding="2"
            cellspacing="2" class="detailEdit">
            <tr>
                <td align="center">
                    <h2>
                        <asp:label id="Label3" runat="server" text="Selected Events"></asp:label></h2>
                </td>
                <td>
                </td>
                <td align="right">
                    <asp:imagebutton id="ImageButton1" runat="server" imageurl="~/images/fancy_close.png"
                        onclientclick="  $('#searchResultWidnow').hide(); return false;" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:linkbutton id="lnkClearAll" runat="server" onclientclick="ClearSearch(true); return false;"
                        text="Clear All" skinid="bButton" />
                </td>
            </tr>
            <tr >
                <td colspan="2">
                    <div  id="SelectedEvent"  style=" width:230px; height:764px; position: absolute;  overflow:auto; border: 1px solid lightgray; margin-top:10px;  ">
                               <dx:ASPxGridView ID="gvEvents" ClientInstanceName="grid1" runat="server" 
                            KeyFieldName="SettingID"     Border-BorderColor="LightGray" Border-BorderStyle="Solid"
                            Border-BorderWidth=1   Font-Names="Verdana" Font-Size="10px"  ForeColor="#342F2F"  
                            AutoGenerateColumns="False"   Theme="Office2010Black"   
                                EnableRowsCache="True" Width="226px" DataSourceForceStandardPaging="False" 
                                SettingsPager-AlwaysShowPager="True" SettingsPager-Position="Bottom">
                                <Columns>
                                <dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0"  Width="30px" >
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="CheckBox2" runat="server" />
                                    </HeaderTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataColumn FieldName="Name" VisibleIndex="1"  Caption="" SortOrder="Ascending"  Width="200px"   />
                                 
                                                                                                                          
                                                                 
                                </Columns>
                                <Settings ShowGroupPanel="False" />
                                <SettingsBehavior AllowFocusedRow="False" />
                                    <Settings GridLines="Vertical" />
                                    <Styles>
                                    <AlternatingRow Enabled="True" />
                                </Styles>
                                    <SettingsPager PageSize="40">
                                    <PageSizeItemSettings Visible="false"  ShowAllItem="true" />
                                </SettingsPager>
                                </dx:ASPxGridView>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <asp:textbox id="hfCurrentId" runat="server" style="display: none">
    </asp:textbox>
    <asp:hiddenfield id="hfCurrentDomainID" runat="server" />
    <asp:hiddenfield id="hfInitialTreePath" runat="server" />
    <asp:hiddenfield id="hfCourseID" runat="server" />
    <asp:hiddenfield id="hfIsPublishOrShareCourse" runat="server" />
    <asp:hiddenfield id="hfIsShare" runat="server" />
    <a id="locationList" href="#Location" title="Location" style="display: none;">Inline</a>
    <asp:hiddenfield id="HiddenField3" runat="server" />
    <asp:hiddenfield id="HiddenField4" runat="server" />
    <div style="display: none;">
        <div id="Location" style="width: 840px; height: 520px;">
            <uc3:ucLocation ID="ucLocation1" runat="server" />
        </div>
    </div>
    <script type="text/javascript">

        $('.pageBody').css('padding', '0');
        $('body>div').css('background-color', '#efefef')
        //$('.tab-tc:last').removeClass("tab-tc");
       
    </script>
</asp:content>
