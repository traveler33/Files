<%@ Page Language="C#" AutoEventWireup="true"
MasterPageFile="~/Master/Main.Master"
 CodeBehind="CheckAvailability.aspx.cs" Inherits="Pelesys.Scheduling.Web.Files.CheckAvailability" %>


<%@ MasterType VirtualPath="~/Master/Main.Master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>
 
 
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
<br />
<div style="  padding:12px;  ">
 <div id="Div2" class="SaveCancelPanel" style=" padding:4px;  width:98%;">
        <table border="0" cellpadding="2" cellspacing="2" style="width: 100%; height: 100%;">
            <tr>
                <td  style="  width: 120px;    ">
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                   
                </td>
                <td align="left"  style=" width: 400px; font-size:11px; font-weight:  bold;">
                   <asp:Label ID="Label2" runat="server" Text="Schedule: Check Availability"></asp:Label>
                      
                </td>
          
                <td  >
                  <asp:UpdatePanel ID="UpdatePanel1" runat="server"   align="right" >
                        <ContentTemplate> 
                       
                                       
                          
                            &nbsp;
                            <asp:Button ID="bntCancel" runat="server" Text="Close"  SkinID="bntMiddle"  OnClientClick="window.close();"   />   
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                 <td  style="  width: 40px;    ">
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                   
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div id="Div1" class="TitlePanel">
        <div  style=" width: 98%; height:100%; background-color: #fff;  padding : 10px; border: 1px solid lightgray; ">
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
        CellGroupBy="Week"
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
            <DayPilot:Resource Name="Robert Chen" Value="A" Expanded="True"/>
            <DayPilot:Resource Name="Hellen Zhang" Value="B" Expanded="False" />
            <DayPilot:Resource Name="Kevin Chen" Value="C" ToolTip="Test" Expanded="False" />
            <DayPilot:Resource Name="Bin Yang" Value="D" Expanded="False" />
            <DayPilot:Resource Name="Manu elJuan" Value="E" Expanded="False" />
            <DayPilot:Resource Name="John Ali" Value="F" ToolTip="Test" Expanded="False" />
            <DayPilot:Resource Name="Omar Yassin" Value="G" Expanded="False" />
            
            <DayPilot:Resource Name="Reem Teresa" Value="H" Expanded="False" />
          <DayPilot:Resource Name="Sophia Lin" Value="I" ToolTip="Test" Expanded="False" />
            <DayPilot:Resource Name="Mary Linda" Value="J" Expanded="False" />
             <DayPilot:Resource Name="Reem Teresa" Value="H" Expanded="False" />
          <DayPilot:Resource Name="Sophia Lin" Value="I" ToolTip="Test" Expanded="False" />
            <DayPilot:Resource Name="Mary Linda" Value="J" Expanded="False" />
        
         
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
    <script type="text/javascript">

        $('.pageBody').css('padding', '0');
        $('body>div').css('background-color', '#efefef')
        //$('.tab-tc:last').removeClass("tab-tc");
       
    </script>
       
</asp:Content>
