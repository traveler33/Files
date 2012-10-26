<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GlobalCalendar.aspx.cs"  MasterPageFile="~/Master/Main.Master"
Inherits="Pelesys.Scheduling.Web.Files.GlobalCalendar" %>



<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>
<%@ MasterType VirtualPath="~/Master/Main.Master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
 <link type="text/css" href='Media/layout.css' rel="stylesheet" />    
    <link type="text/css" href='Media/elements.css' rel="stylesheet" /> 
      <link type="text/css" href='Themes/themes.css' rel="stylesheet" />     
	<script type="text/javascript" src="../js/disabled_iuppiter.js"></script>
	<script type="text/javascript" src="../js/modal.js"></script>

<script type="text/javascript">

    /* DayPilotScheduler.AfterRenderJavaScript handler */

    function afterRender(data, isCallBack) {
    }

    /* Fast filter helpers */

    function clear() {
        var filterBox = document.getElementById("TextBoxFilter");
        filterBox.value = '';
        filter();
    }
    function filter() {
        var filterBox = document.getElementById("TextBoxFilter");
        var filterText = filterBox.value;

        dps1.clientState = { "filter": filterText };
        dps1.commandCallBack("filter");
    }

    function key(e) {
        var keynum = (window.event) ? event.keyCode : e.keyCode;

        if (keynum === 13) {
            filter();
            return false;
        }

        return true;
    }

    /* Event editing helpers - modal dialog */
    function createEvent(start, end, resource) {
        var modal = new DayPilot.Modal();
        modal.top = 60;
        modal.width = 300;
        modal.opacity = 70;
        modal.border = "10px solid #d0d0d0";
        modal.closed = function () {
            if (this.result == "OK") {
                dps1.commandCallBack('refresh');
            }
            dps1.clearSelection();
        };

        modal.height = 250;
        modal.zIndex = 100;
        modal.showUrl("New.aspx?start=" + start.toStringSortable() + "&end=" + end.toStringSortable() + "&r=" + resource);
    }
</script>

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
    <div id="ResourceTypeTab" class="TabPanelControl"  style="  padding: 8px; border-top: 4px solid #fff;  "    >
         
    <div id="Div2" class="SaveCancelPanel" style=" width:99%;">
    <table border="0" cellpadding="2" cellspacing="2" style="width: 100%; height: 100%;"
       >
        <tr>
            <td align="right">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="RightAdminPanel">
                            <table border="0" width="100%"   class="detailEdit">
                                <tr>
                                 <td style="width: 50px;">
                                    </td>
                                    <td align="left">
                                        <asp:Button ID="Button1" runat="server" Text="&#x25c4;" CssClass="ShortButton" 
                                        OnClientClick="javascript:dps1.commandCallBack('previous'); return false;" />
                                        <asp:Button ID="bntSave" runat="server" Text="&#x25ba;"  CssClass="ShortButton" 
                                       OnClientClick="javascript:dps1.commandCallBack('next');return false;"  />
                                    <asp:Button ID="bntCancel" runat="server" Text="This Year" SkinID="bntMiddle" 
                                     OnClientClick="javascript:dps1.commandCallBack('this');return false;"   />
                                    </td>
                                    <th style="width: 450px;">
                                        Fast filter: <input type="text" id="Text1" onkeypress="return key(event);" />
                                          <asp:Button ID="Button2" runat="server" Text="Apply" SkinID="bntMiddle" 
                                     OnClientClick="javascript:filter();return false;"   />
                                       <asp:Button ID="Button3" runat="server" Text="Clear" SkinID="bntMiddle" 
                                     OnClientClick="javascript:clear();return false;"   />
                                       
                                    </th>
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
     <div  style="  width: 100%; height: 10px; ">
     </div>
<div  style=" width: 100%; height:100%; background-color: #fff;  padding : 10px; border: 1px solid lightgray;  height:425px; ">
    <DayPilot:DayPilotScheduler 
        ID="DayPilotScheduler1" 
        runat="server" 
        DataStartField="start" 
        DataEndField="end" 
        DataTextField="name" 
        DataValueField="id" 
        DataResourceField="column"  
        DataTagFields="id, name"
        HeaderFontSize="9pt" 
        HeaderHeight="22" 
        EventHeight="30"
        EventFontSize="11px" 
        Width="98%" 
        RowHeaderWidth="120"
        CellDuration="1440" 
        CellGroupBy="Month"
        TimeRangeSelectedHandling="JavaScript"
        TimeRangeSelectedJavaScript="createEvent(start, end, resource)"
        ClientObjectName="dps1" 
        EventMoveHandling="JavaScript" 
        OnEventMove="DayPilotScheduler1_EventMove" 
        EventMoveJavaScript="dps1.eventMoveCallBack(e, newStart, newEnd, newResource);"
        EventResizeHandling="CallBack"
        OnEventResize="DayPilotScheduler1_EventResize"
        OnTimeRangeSelected="DayPilotScheduler1_TimeRangeSelected" 
        EventClickHandling="ContextMenu"
        EventEditHandling="CallBack" 
        OnEventEdit="DayPilotScheduler1_EventEdit" 
        OnBeforeEventRender="DayPilotScheduler1_BeforeEventRender"
        OnEventMenuClick="DayPilotScheduler1_EventMenuClick" 
        ContextMenuID="DayPilotMenu2" 
        ContextMenuResourceID="DayPilotMenuRes"
        BusinessBeginsHour="5" 
        AfterRenderJavaScript="afterRender(data, isCallBack);" 
        OnBeforeResHeaderRender="DayPilotScheduler1_BeforeResHeaderRender"
        UseEventBoxes="Always" 
        EnableViewState="false" 
        ScrollLabelsVisible="false" 
        BubbleID="DayPilotBubble1" 
        ShowToolTip="false"
        HeightSpec="Fixed" 
        Height="380" 
        OnCommand="DayPilotScheduler1_Command" 
        OnEventClick="DayPilotScheduler1_EventClick"
        OnTimeRangeMenuClick="DayPilotScheduler1_TimeRangeMenuClick" 
        OnBeforeCellRender="DayPilotScheduler1_BeforeCellRender"
        TreeEnabled="true"
        TreeIndent="15"
        EventDoubleClickHandling="Edit"
        BorderColor="lightgray"
        ResourceBubbleID="DayPilotBubble1"
        
        CssClassPrefix="scheduler_silver_"
        HourNameBackColor="#efefef" 
        OnResourceHeaderMenuClick="DayPilotScheduler1_ResourceHeaderMenuClick"
        ResourceHeaderClickHandling="JavaScript" 
        OnResourceHeaderClick="DayPilotScheduler1_ResourceHeaderClick" 
        OnBeforeTimeHeaderRender="DayPilotScheduler1_BeforeTimeHeaderRender"
        ContextMenuSelectionID="DayPilotMenuSelection"
        
        EventCorners="Rounded"
        EventBorderColor="#efefef"
        DurationBarVisible="false"
        EventFontColor="#444444"
        >
        <Resources>
            <DayPilot:Resource Name="Aisa" Value="A" Expanded="True">
                <Children>
                    <DayPilot:Resource Name="East Aisa" Value="A.1" Expanded="False" >
                        <Children>
                            <DayPilot:Resource Name="China" Value="A.1.1" Expanded="False" />
                            <DayPilot:Resource Name="Korea" Value="A.1.2" Expanded="False" />
                        </Children>
                    </DayPilot:Resource>
                    <DayPilot:Resource Name="Middle East" Value="A.2" Expanded="False" />
                </Children>
            </DayPilot:Resource>
            <DayPilot:Resource Name="Vancouver" Value="B" Expanded="False" />
            <DayPilot:Resource Name="New York" Value="C" ToolTip="Test" Expanded="False" />
            <DayPilot:Resource Name="London" Value="D" Expanded="False" />
            
        
         
       </Resources>
    </DayPilot:DayPilotScheduler>
    
    <DayPilot:DayPilotMenu ID="DayPilotMenu2" runat="server" CssClassPrefix="menu_">
        <DayPilot:MenuItem Text="Open" Action="JavaScript" JavaScript="alert('Opening event (id ' + e.value() + ')');">
        </DayPilot:MenuItem>
        <DayPilot:MenuItem Text="Send" Action="JavaScript" JavaScript="alert('Sending event (id ' + e.value() + ')');">
        </DayPilot:MenuItem>
        <DayPilot:MenuItem Text="Refresh" Action="JavaScript" JavaScript="dps1.commandCallBack('refresh');">
        </DayPilot:MenuItem>
        <DayPilot:MenuItem Text="-" Action="NavigateUrl"></DayPilot:MenuItem>
        <DayPilot:MenuItem Text="Delete (CallBack)" Action="Callback" Command="Delete"></DayPilot:MenuItem>
        <DayPilot:MenuItem Action="PostBack" Command="Delete" Text="Delete (PostBack)" />
        <DayPilot:MenuItem Action="JavaScript" JavaScript="alert('x:' + dps1.eventOffset.x + ' y:' + dps1.eventOffset.y + ' resource:' + e.row());" Text="Mouse offset (relative to event)" />
        <DayPilot:MenuItem Action="NavigateUrl" NavigateUrl="javascript:alert('Going somewhere else (id {0})');"
            Text="NavigateUrl test" />
    </DayPilot:DayPilotMenu>
    
    <DayPilot:DayPilotMenu ID="DayPilotMenuSpecial" runat="server" ClientObjectName="cmSpecial" CssClassPrefix="menu_"
        >
        <DayPilot:MenuItem Text="Open" Action="JavaScript" JavaScript="alert('Opening event (id ' + e.value() + ')');">
        </DayPilot:MenuItem>
        <DayPilot:MenuItem Text="Send" Action="JavaScript" JavaScript="alert('Sending event (id ' + e.value() + ')');">
        </DayPilot:MenuItem>
        <DayPilot:MenuItem Text="Delete (JavaScript using callback)" Action="JavaScript"
            Command='Delete' JavaScript="if (confirm('Do you really want to delete event ' + e.text() + ' ?')) dps1.eventMenuClickCallBack(e, command);">
        </DayPilot:MenuItem>
    </DayPilot:DayPilotMenu>
    
    <DayPilot:DayPilotMenu ID="DayPilotMenuSelection" runat="server" CssClassPrefix="menu_" >
        <DayPilot:MenuItem Action="JavaScript" JavaScript="dps1.timeRangeSelectedCallBack(e.start, e.end, e.resource);"
            Text="Create new event (JavaScript)" />
        <DayPilot:MenuItem Action="PostBack" Command="Insert" Text="Create new event (PostBack)" />
        <DayPilot:MenuItem Action="CallBack" Command="Insert" Text="Create new event (CallBack)" />
        <DayPilot:MenuItem Text="-" Action="JavaScript"></DayPilot:MenuItem>
        <DayPilot:MenuItem Action="JavaScript" JavaScript="alert('Start: ' + e.start + '\nEnd: ' + e.end + '\nResource id: ' + e.resource);"
            Text="Show selection details" />
        <DayPilot:MenuItem Action="JavaScript" JavaScript="dps1.clearSelection();" Text="Clean selection" />
    </DayPilot:DayPilotMenu>

    <DayPilot:DayPilotMenu ID="DayPilotMenuRes" runat="server"  CssClassPrefix="menu_">
        <DayPilot:MenuItem Action="CallBack" Command="Insert" Text="Add child" />
        <DayPilot:MenuItem Text="-" Action="JavaScript"></DayPilot:MenuItem>
        <DayPilot:MenuItem Action="CallBack" Command="Delete" Text="Delete" />
        <DayPilot:MenuItem Action="CallBack" Command="DeleteChildren" Text="Delete children" />
        <DayPilot:MenuItem Text="-" Action="JavaScript"></DayPilot:MenuItem>
        <DayPilot:MenuItem Action="JavaScript" JavaScript="alert(e.name + '\n' + e.value);"
            Text="Show resource details" />
    </DayPilot:DayPilotMenu>

    
    <DayPilot:DayPilotBubble 
        ID="DayPilotBubble1" 
        runat="server" 
        OnRenderContent="DayPilotBubble1_RenderContent" 
        ClientObjectName="bubble" 
        OnRenderEventBubble="DayPilotBubble1_RenderEventBubble"
        Width="250"
        
        Corners="Rounded"
        >
    </DayPilot:DayPilotBubble>
    </div>

      </div>
                        
    </div>
    <br />
   
    <script type="text/javascript">

        $('.pageBody').css('padding', '0');
        $('body>div').css('background-color', '#efefef')
        //$('.tab-tc:last').removeClass("tab-tc");
       
    </script>
</asp:Content>
