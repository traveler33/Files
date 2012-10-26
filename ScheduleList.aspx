<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ScheduleList.aspx.cs" 
 MasterPageFile="~/Master/Main.Master"
Inherits="Pelesys.Scheduling.Web.Files.ScheduleList" %>

<%@ MasterType VirtualPath="~/Master/Main.Master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
   <div id="scheduler_here"  style=' position: absolute; top: 0px;  left: 2px; width:100%; height:100%; background-color:#fff;  overflow:hidden; '> 
     <dx:ASPxScheduler ID="ASPxScheduler1" runat="server" Width="100%" ActiveViewType="WorkWeek"  Theme="Office2003Blue" 
       OnPopupMenuShowing = "ASPxScheduler1_PreparePopupMenu"
        GroupType="Resource" Start="2010-07-13">
        <Views>
        
            <DayView ResourcesPerPage="2">
                <TimeRulers>
                    <dx:TimeRuler />
                </TimeRulers>
                <DayViewStyles ScrollAreaHeight="400px" />
            </DayView>
            <WorkWeekView ResourcesPerPage="2">
                <TimeRulers>
                    <dx:TimeRuler />
                </TimeRulers>
                <WorkWeekViewStyles ScrollAreaHeight="400px" />
            </WorkWeekView>
            <WeekView ResourcesPerPage="2">
                <WeekViewStyles>
                    <DateCellBody Height="150px" />
                </WeekViewStyles>
            </WeekView>
            <MonthView ResourcesPerPage="2">
                <MonthViewStyles>
                    <DateCellBody Height="100px" 
                    />
                </MonthViewStyles>
            </MonthView>
            <TimelineView ResourcesPerPage="2">
                <TimelineViewStyles>
                    <TimelineCellBody Height="250px" />
                </TimelineViewStyles>
            </TimelineView>
        </Views>
        <Storage EnableReminders="false">
        </Storage>
    </dx:ASPxScheduler>
   </div>
  
  </asp:Content>