<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Main.Master" AutoEventWireup="true" CodeBehind="CalendarView.aspx.cs" Inherits="Pelesys.Scheduling.Web.Files.CalendarView" %>

<%@ Register Src="../Control/ucLocation.ascx" TagName="ucLocation"
    TagPrefix="uc3" %>
<%@ Register Src="../Control/ucResourceSelection.ascx" TagName="ucResourceSelection"
    TagPrefix="uc1" %>
<%@ Register Src="~/Control/ucSearchResults.ascx" TagName="ctrSearchResults" TagPrefix="uc4"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ MasterType VirtualPath="~/Master/Main.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script type="text/javascript" src="../js/eform/eFormJS.js"></script>
    <script type="text/javascript" src="../js/eform/jquery.ui.core.js"></script>
    <script type="text/javascript" src="../js/eform/jquery.ui.draggable.js"></script>
    <script type="text/javascript" src="../js/eform/jquery.ui.droppable.js"></script>
        
    <style type="text/css">
        .splitContainer
        {
            height: 540px;
          
        }
        
        #userGroupPane
        {
            overflow: auto;
            height: 536px;
            background-color: #FFF;
            border: 1px lightgray solid;
            width: 98%;
        }
        .btnSave
        {
            background-color: #293A49;
            border: medium none;
            color: White;
            cursor: pointer;
            font-weight: bold;
            height: 24px;
            margin: 4px;
            min-width: 70px;
        }
        .loading
        {
            float: right;
            margin-top: 4px;
            margin-right: 4px;
            display: none;
        }
        .prerequisite .content
        {
            overflow: hidden !important;
        }
    </style>
    <script src="../js/exp_parser.js" type="text/javascript"></script>
    <script src="../js/jquery.splitter/splitter-16.js" type="text/javascript"></script>
     <script src="../js/jquery.jsTree/jquery.jstree.js" type="text/javascript"></script>
    <script src="../js/zeroclipboard/ZeroClipboard.js" type="text/javascript"></script>
    <script src="../js/jquery.cookie.js" type="text/javascript"></script>
 
	<script src="../lib/jquery.cookie.js" type="text/javascript"></script>
	<script src="../js/jquery.treeview.js" type="text/javascript"></script>
    

      <script type="text/javascript">

        $(init);

        function init() {
            $('#searchResultWidnow').draggable(

          );
           $('#MiniResultList').draggable(

          );
          
            $('.CssEformDragClass').draggable();



        }

  $(document).ready(function () {
	       
	        $("#MessageBox").fancybox({
	            'overlayShow': true,
	            'transitionIn': 'elastic',
	            'transitionOut': 'elastic',
                'padding': 6,
                'zoomOpacity': true,
                'zoomSpeedIn': 500,
                'zoomSpeedOut': 500,

	        });

	     
	    });
    function callMessageBox(cclass, msg) 
    {    $('#Message').text(msg);
         var currentClass =  $('#Message').attr("class");
         if ( currentClass != cclass); 
         {
             $('#Message').removeClass(currentClass);
         }
         $('#Message').addClass(cclass);
     
        $('#MessageBox').trigger('click');
        window.setTimeout('parent.$.fancybox.close();', 2500);
       
       
    }
    function resize(id, IsMin) {
    var control = document.getElementById(id);
    var divList = document.getElementById('MiniResultList');
    var ID ='MiniResultList';
    if (IsMin == true) {
      // alert('test');
        control.style.left = '20px';
        control.style.top =  '40px';
        $("#" + ID).css({ visibility: "visible" });
        $("#" + ID).css({ display: "block" });

        $("#" + id).css({ visibility: "hidden" });
        $("#" + id).css({ display: "none" });
    }
    else {
      
        $("#" + ID).css({ visibility: "hidden" });
        $("#" + ID).css({ display: "none" });
        $("#" + id).css({ visibility: "visible" });
        $("#" + id).css({ display: "block" });
    
     }
   
} 

    </script>

        <script type="text/javascript">
            function LDefineFancyBox() {

                $("#resource").fancybox({
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

                LcreadyFancy();
            }
            function LcreadyFancy() {

                $('#resource').trigger('click');
                // window.setTimeout('parent.$.fancybox.close();', 2500);


            }


    </script>
    <style type="text/css">
        .fancybox-custom .fancybox-skin
        {
            box-shadow: 0 0 50px #222;
        }
    </style>
   
       <script type="text/javascript">
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
    <style type="text/css">
        .fancybox-custom .fancybox-skin
        {
            box-shadow: 0 0 50px #222;
        }
    </style>

    <script type="text/javascript">
        //改造方法


        var domainID;
        var path;
        var currentCourseIDOrLessonID;
        var type;
        var iscopy;
        var isPublish;
        var isShare;

        var jstreePluginsArray;

        $(function () {
            $(window).keydown(function (evt) { iscopy = evt.which == 17 ? true : iscopy; }).keyup(function (evt) { iscopy = evt.which == 17 ? false : iscopy; });
            $(".splitContainer").splitter({
                type: "v",
                outline: true,
                sizeLeft: $(".splitContainer").width() * 0.25,
                resizeToWidth: true,
                dock: "left",
                dockSpeed: 200,
                dockKey: 'Z', // Alt-Shift-Z in FF/IE
                accessKey: 'I'	// Alt-Shift-I in FF/IE
            });
            isShare = $('#<%=hfIsShare.ClientID%>').val() == "true";
            if (isShare) {

            }
            currentCourseIDOrLessonID = $('#<%=hfCourseID.ClientID%>').val();
            domainID = $('#<%=hfCurrentDomainID.ClientID%>').val();
            if (domainID > 0) {
                path = eval($('#<%=hfInitialTreePath.ClientID%>').val());
            }

            var isTempPublish = $('#<%=hfIsPublishOrShareCourse.ClientID %>').val();
            if (isTempPublish == 'False') {
                jstreePluginsArray = ["json_data", "themes", "ui", "crrm", "types"];
                $(".forunpublished").hide();
            }
            else {
                jstreePluginsArray = ["json_data", "themes", "ui", "crrm", "types", "dnd"];
            }
            //  initializeTree();
            //   judgeBtnEnable();
        });
        $(document).ready(function () {

            // first example
            $("#browser").treeview();


        });  //resourceBrowser
        $(document).ready(function () {

            // first example
            $("#resourceBrowser").treeview();


        });
        $(document).ready(function () {

            // first example
            $("#Locationbrowser").treeview();


        });
        function iframeGotoPage(code) {
            // var node = $.jstree._focused().get_selected();
            $("#frmContent")[0].src
                = ($('#hdnIframePageName').val().length > 0 ? $('#hdnIframePageName').val() : 'ScheduleList.aspx')
                + '?type=' + type

                + '&Code=' + code

                + '&courseID=' + $('#<%=hfCourseID.ClientID%>').val()
                + '&action=load&nohead=1';
        }


        function iframeGotoCoursePage(code) {
            // var node = $.jstree._focused().get_selected();
            $("#frmContent")[0].src
                = ($('#hdnIframePageName').val().length > 0 ? $('#hdnIframePageName').val() : 'lmsCourseProfile.aspx')
                + '?type=' + type

                + '&Code=' + code

                + '&courseID=' + $('#<%=hfCourseID.ClientID%>').val()
                + '&action=load&nohead=1';
        }


        function iframeGotoSechduleListViewPage(code) {
            // var node = $.jstree._focused().get_selected();
            $("#frmContent")[0].src
                = ($('#hdnIframePageName').val().length > 0 ? $('#hdnIframePageName').val() : 'ScheduleView.aspx')
                + '?type=' + type

                + '&Code=' + code

                + '&courseID=' + $('#<%=hfCourseID.ClientID%>').val()
                + '&action=load&nohead=1';
        }

     
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="splitContainer" style=" position: absolute; top:1; left: 2px;  " > 
        <div>
           
            <div id="userGroupPane">
                  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" CssClass="gray"
                            Visible="true" Width="98.4%"  Height="507px" BorderStyle="None"    BorderColor="White"  BorderWidth="0" >
                            <asp:TabPanel ID="Tabs" HeaderText="Tab" runat="server" ToolTip="Schedule Search">
                                <HeaderTemplate>
                                    <asp:Label ID="lblTab" runat="server" SkinID="label" Text="Search" ToolTip="Schedule Search" />
                                    
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:Panel ID="phTabs" runat="server">
                                        <div style=" padding-top: 5px ">
                                        <table cellpadding="1" cellspacing="1" border="0" style="width: 98%; height: 460px;">
                                            <tr>
                                                <td colspan="2" valign="top" align="center">
                                                   
                                                        <asp:Accordion ID="accordion1" runat="server" HeaderCssClass="cssFormDesignAccordionHead"
                                                            HeaderSelectedCssClass="cssFormDesignSelectedHead" ContentCssClass="cssFormDesignAccordionContent"
                                                            Width="240px" BorderColor="#F0F0F0" BorderStyle="Solid" BorderWidth="1px" Height="440px"
                                                            FadeTransitions="false" TransitionDuration="250" FramesPerSecond="40" RequireOpenedPane="false"
                                                            SuppressHeaderPostbacks="true">
                                                            <Panes>
                                                                <asp:AccordionPane ID="AccordionPane1" HeaderCssClass="cssFormDesignAccordionHead" HeaderSelectedCssClass="cssFormDesignSelectedHead"
                                                                    ContentCssClass="cssFormDesignAccordionContent" runat="server" ToolTip="Search Filter">
                                                                    <Header>
                                                                        <asp:Label ID="Label1" runat="server" SkinID="label" Text="Search Filter"></asp:Label>
                                                                    </Header>
                                                                    <Content>
                                                                         <table cellpadding="1" cellspacing="1" border ="0"  width="100%" style=" height: 290px" >
                                                                                    <tr>
                                                                                        <td valign="top">
                                                                                            <asp:ListBox ID="ListBox1" runat="server"  Width="100%"   SkinID="eFormList"  Height="280px" ></asp:ListBox>
                                                                                        
                                                                                        </td>
                                                                                    
                                                                                    </tr>
                                                                            </table>
                                                                    </Content>
                                                                </asp:AccordionPane>
                                                                <asp:AccordionPane ID="AccordionPane2" HeaderCssClass="cssFormDesignAccordionHead"
                                                                    HeaderSelectedCssClass="cssFormDesignSelectedHead" ContentCssClass="cssFormDesignAccordionContent"
                                                                    runat="server" ToolTip="Curriculum Search">
                                                                    <Header>
                                                                        <asp:Label ID="Label2" runat="server" SkinID="label" Text="Curriculum Search"></asp:Label>
                                                                    </Header>
                                                                    <Content>
                                                                            <table cellpadding="1" cellspacing="1" border ="0"  width="100%" style=" height: 300px" >
                                                                                    <tr>
                                                                                        <td valign='top'>
                                                                                        
                                                                                            <table cellpadding="2" cellspacing="2" width="100%" border="0">
                                                                                                <tr>
                                                                                                    <th  style=" font-size: 11px; font-weight: normal; "  align ="left">
                                                                                                       From:
                                                                                                    </th>
                                                                                                    <td>
                                                                                                          <pel:AdvancedCalendar ID="adcEffectiveDate" runat="server" IsRequired="false"   Width="82%" /> 
                                                                                                    </td>
                                                                                                </tr>

                                                                                                 <tr>
                                                                                                    <th  style=" font-size: 11px; font-weight: normal; "  align ="left"> 
                                                                                                        To:
                                                                                                    </th>
                                                                                                    <td>
                                                                                                           <pel:AdvancedCalendar ID="AdvancedCalendar1" runat="server" IsRequired="false"  Width="82%"  /> 
                                                                                                    </td>
                                                                                                </tr>


                                                                                                 <tr>
                                                                                                    <th  style=" font-size: 11px; font-weight: normal; "  align ="left">
                                                                                                        Location:
                                                                                                    </th>
                                                                                                    <td>
                                                                                                        <pel:SearchTextBox ID="SearchTextBox15" runat="server" Objective="userloginname" ValidationGroup="search"
                                                                                                            Width="82%" /><asp:Button ID="Button41" runat="server" Text="..." CssClass="ShortButton"
                                                                                                             OnClientClick="LocDefineFancyBox(); return false;"
                                                                                                             />
                                                                                                    </td>
                                                                                                </tr>

                                                                                                 <tr>
                                                                                                    <th style=" font-size: 11px; font-weight: normal; "   align ="left" valign="top">
                                                                                                        Type:
                                                                                                    </th>
                                                                                                    <th style=" font-size: 11px; font-weight: normal; ">

                                                                                                        <div  style="  border: 1px lightgray solid;  padding:4px; font-size: 11px; font-weight: normal;" >
                                                                                                            <table border="0"  cellpadding="1" cellspacing="1" width="100%">
                                                                                                                <tr>
                                                                                                                    <th   align ="left" style=" font-size: 11px; font-weight: normal; " >
                                                                                                                       <asp:Label runat="server" Text="Curriculum"></asp:Label>
                                                                                                                    </th>
                                                                                                                      <td>
                                                                                                                     <asp:CheckBox runat="server"  id="checkbox1"   ></asp:CheckBox>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                              
                                                                                                                 <tr>
                                                                                                                    <th   align ="left"  style=" font-size: 11px; font-weight: normal; " >
                                                                                                                       <asp:Label runat="server" Text="Resources"></asp:Label>
                                                                                                                    </th>
                                                                                                                      <td> 
                                                                                                                     <asp:CheckBox runat="server"  id="checkbox2"   ></asp:CheckBox>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                 <tr>
                                                                                                                    <th   align ="left"  style=" font-size: 11px; font-weight: normal; " >
                                                                                                                       <asp:Label runat="server" Text="Instructors"></asp:Label>
                                                                                                                    </th>
                                                                                                                      <td>
                                                                                                                     <asp:CheckBox runat="server"  id="checkbox3"   ></asp:CheckBox>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                 <tr>
                                                                                                                    <th  align ="left"  style=" font-size: 11px; font-weight: normal; " >
                                                                                                                       <asp:Label runat="server" Text="Students"></asp:Label>
                                                                                                                    </th>
                                                                                                                      <td>
                                                                                                                     <asp:CheckBox runat="server"  id="checkbox4"   ></asp:CheckBox>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                 
                                                                                                            </table>


                                                                                                        
                                                                                                            
                                                                                                       </div>
                                                                                                    </th>
                                                                                                </tr>
                                                                                                   <tr>
                                                                                                    <th style=" font-size: 11px; font-weight: normal; "   align ="left" valign="top">
                                                                                                       View:
                                                                                                    </th>
                                                                                                    <th style=" font-size: 11px; font-weight: normal; ">

                                                                                                        <div  style="  border: 1px lightgray solid;  padding:4px; font-size: 11px; font-weight: normal;" >
                                                                                                            <table border="0"  cellpadding="1" cellspacing="1" width="100%">
                                                                                                                <tr>
                                                                                                                    <th   align ="left" style=" font-size: 11px; font-weight: normal; " >
                                                                                                                       <asp:Label ID="Label12" runat="server" Text="List View"></asp:Label>
                                                                                                                    </th>
                                                                                                                      <td>
                                                                                                                      <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                                                                                            <ContentTemplate>
                                                                                                                               <asp:CheckBox runat="server"  id="chkListView"   OnCheckedChanged="CourseShowListView" AutoPostBack="true" >
                                                                                                                                 </asp:CheckBox>
                                                                                                                            </ContentTemplate>
                                                                                                                          
                                                                                                                          </asp:UpdatePanel>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                              
                                                                                                           
                                                                                                            </table>


                                                                                                        
                                                                                                            
                                                                                                       </div>
                                                                                                    </th>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td colspan="2" align="right" >
                                                                                                        <asp:Button ID="bntSearch" runat="server"  ToolTip="Search" Text="Search"   OnClientClick="EFormShowPanel(true, 'searchResultWidnow'); return false;"
                                                                                                             SkinID="bntMiddle" />
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </td>
                                                                                    
                                                                                    </tr>

                                                                                 
                                                                            </table>
                                                                    </Content>
                                                                </asp:AccordionPane>
                                                                <asp:AccordionPane ID="AccordionPane3" HeaderCssClass="cssFormDesignAccordionHead" HeaderSelectedCssClass="cssFormDesignSelectedHead"
                                                                    ContentCssClass="cssFormDesignAccordionContent" runat="server" ToolTip="Location Search">
                                                                    <Header>
                                                                        <asp:Label ID="Label4" runat="server" SkinID="label" Text="Meeting Search"></asp:Label>
                                                                    </Header>
                                                                    <Content>

                                                                        <table cellpadding="1" cellspacing="1" border ="0"  width="100%" style=" height: 300px" >
                                                                                    <tr>
                                                                                        <td valign='top'>
                                                                                        
                                                                                            <table cellpadding="2" cellspacing="2" width="100%" border="0">
                                                                                                <tr>
                                                                                                    <th  style=" font-size: 11px; font-weight: normal; "  align ="left">
                                                                                                       From:
                                                                                                    </th>
                                                                                                    <td>
                                                                                                          <pel:AdvancedCalendar ID="AdvancedCalendar2" runat="server" IsRequired="false"   Width="82%" /> 
                                                                                                    </td>
                                                                                                </tr>

                                                                                                 <tr>
                                                                                                    <th  style=" font-size: 11px; font-weight: normal; "  align ="left"> 
                                                                                                        To:
                                                                                                    </th>
                                                                                                    <td>
                                                                                                           <pel:AdvancedCalendar ID="AdvancedCalendar3" runat="server" IsRequired="false"  Width="82%"  /> 
                                                                                                    </td>
                                                                                                </tr>


                                                                                                 <tr>
                                                                                                    <th  style=" font-size: 11px; font-weight: normal; "  align ="left">
                                                                                                        Location:
                                                                                                    </th>
                                                                                                    <td>
                                                                                                        <pel:SearchTextBox ID="SearchTextBox12" runat="server" Objective="userloginname" ValidationGroup="search"
                                                                                                            Width="82%" /><asp:Button ID="Button13" runat="server" Text="..." CssClass="ShortButton"
                                                                                                             OnClientClick="LocDefineFancyBox(); return false;"
                                                                                                             />
                                                                                                    </td>
                                                                                                </tr>

                                                                                                 <tr>
                                                                                                    <th style=" font-size: 11px; font-weight: normal; "   align ="left" valign="top">
                                                                                                        Type:
                                                                                                    </th>
                                                                                                    <th style=" font-size: 11px; font-weight: normal; ">

                                                                                                        <div  style="  border: 1px lightgray solid;  padding:4px; font-size: 11px; font-weight: normal;" >
                                                                                                            <table border="0"  cellpadding="1" cellspacing="1" width="100%">
                                                                                                                <tr>
                                                                                                                    <th   align ="left" style=" font-size: 11px; font-weight: normal; " >
                                                                                                                       <asp:Label ID="Label9" runat="server" Text="Meeting"></asp:Label>
                                                                                                                    </th>
                                                                                                                      <td>
                                                                                                                     <asp:CheckBox runat="server"  id="checkbox5"   ></asp:CheckBox>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                    <tr>
                                                                                                                    <th   align ="left" style=" font-size: 11px; font-weight: normal; " >
                                                                                                                       <asp:Label ID="Label10" runat="server" Text="Attendeers"></asp:Label>
                                                                                                                    </th>
                                                                                                                      <td>
                                                                                                                     <asp:CheckBox runat="server"  id="checkbox6"   ></asp:CheckBox>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                    <tr>
                                                                                                                    <th   align ="left" style=" font-size: 11px; font-weight: normal; " >
                                                                                                                       <asp:Label ID="Label11" runat="server" Text="Meeting Subject"></asp:Label>
                                                                                                                    </th>
                                                                                                                      <td>
                                                                                                                     <asp:CheckBox runat="server"  id="checkbox7"   ></asp:CheckBox>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                
                                                                                                            </table>


                                                                                                        
                                                                                                            
                                                                                                       </div>
                                                                                                    </th>
                                                                                                </tr>
                                                                                                   <tr>
                                                                                                    <th style=" font-size: 11px; font-weight: normal; "   align ="left" valign="top">
                                                                                                       View:
                                                                                                    </th>
                                                                                                    <th style=" font-size: 11px; font-weight: normal; ">

                                                                                                        <div  style="  border: 1px lightgray solid;  padding:4px; font-size: 11px; font-weight: normal;" >
                                                                                                            <table border="0"  cellpadding="1" cellspacing="1" width="100%">
                                                                                                                <tr>
                                                                                                                    <th   align ="left" style=" font-size: 11px; font-weight: normal; " >
                                                                                                                       <asp:Label ID="Label22" runat="server" Text="List View"></asp:Label>
                                                                                                                    </th>
                                                                                                                      <td>
                                                                                                                          <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                                                                                            <ContentTemplate>
                                                                                                                               <asp:CheckBox runat="server"  id="chkShowListView"   OnCheckedChanged="ShowListView" AutoPostBack="true" >
                                                                                                                                 </asp:CheckBox>
                                                                                                                            </ContentTemplate>
                                                                                                                          
                                                                                                                          </asp:UpdatePanel>
                                                                                                                  
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                              
                                                                                                           
                                                                                                            </table>


                                                                                                        
                                                                                                            
                                                                                                       </div>
                                                                                                    </th>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td colspan="2" align="right" >
                                                                                                        <asp:Button ID="Button14" runat="server"  ToolTip="Search" Text="Search"  
                                                                                                         OnClientClick="EFormShowPanel(true, 'searchResultWidnow'); return false;"
                                                                                                             SkinID="bntMiddle" />
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </td>
                                                                                    
                                                                                    </tr>

                                                                                 
                                                                            </table>
                                                                    </Content>
                                                                </asp:AccordionPane>
                                                                <asp:AccordionPane ID="AccordionPane4" HeaderCssClass="cssFormDesignAccordionHead"
                                                                    HeaderSelectedCssClass=".cssFormDesignSelectedHead" ContentCssClass="cssFormDesignAccordionContent"
                                                                    runat="server" ToolTip="Resource Search">
                                                                    <Header>
                                                                        <asp:Label ID="Label5" runat="server" SkinID="label" Text="Simple Event Search"></asp:Label>
                                                                    </Header>
                                                                    <Content>
                                                                          <table cellpadding="1" cellspacing="1" border ="0"  width="100%" style=" height: 300px" >
                                                                                    <tr>
                                                                                        <td valign='top'>
                                                                                        
                                                                                            <table cellpadding="2" cellspacing="2" width="100%" border="0">
                                                                                                <tr>
                                                                                                    <th  style=" font-size: 11px; font-weight: normal; "  align ="left">
                                                                                                       From:
                                                                                                    </th>
                                                                                                    <td>
                                                                                                          <pel:AdvancedCalendar ID="AdvancedCalendar4" runat="server" IsRequired="false"   Width="82%" /> 
                                                                                                    </td>
                                                                                                </tr>

                                                                                                 <tr>
                                                                                                    <th  style=" font-size: 11px; font-weight: normal; "  align ="left"> 
                                                                                                        To:
                                                                                                    </th>
                                                                                                    <td>
                                                                                                           <pel:AdvancedCalendar ID="AdvancedCalendar5" runat="server" IsRequired="false"  Width="82%"  /> 
                                                                                                    </td>
                                                                                                </tr>


                                                                                                 <tr>
                                                                                                    <th  style=" font-size: 11px; font-weight: normal; "  align ="left">
                                                                                                        Location:
                                                                                                    </th>
                                                                                                    <td>
                                                                                                        <pel:SearchTextBox ID="SearchTextBox14" runat="server" Objective="userloginname" ValidationGroup="search"
                                                                                                            Width="82%" /><asp:Button ID="Button15" runat="server" Text="..." CssClass="ShortButton"
                                                                                                             OnClientClick="LocDefineFancyBox(); return false;"
                                                                                                             />
                                                                                                    </td>
                                                                                                </tr>

                                                                                               
                                                                                                   <tr>
                                                                                                    <th style=" font-size: 11px; font-weight: normal; "   align ="left" valign="top">
                                                                                                       View:
                                                                                                    </th>
                                                                                                    <th style=" font-size: 11px; font-weight: normal; ">

                                                                                                        <div  style="  border: 1px lightgray solid;  padding:4px; font-size: 11px; font-weight: normal;" >
                                                                                                            <table border="0"  cellpadding="1" cellspacing="1" width="100%">
                                                                                                                <tr>
                                                                                                                    <th   align ="left" style=" font-size: 11px; font-weight: normal; " >
                                                                                                                       <asp:Label ID="Label31" runat="server" Text="List View"></asp:Label>
                                                                                                                    </th>
                                                                                                                      <td>
                                                                                                                     <asp:CheckBox runat="server"  id="checkbox27"   ></asp:CheckBox>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                              
                                                                                                           
                                                                                                            </table>


                                                                                                        
                                                                                                            
                                                                                                       </div>
                                                                                                    </th>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td colspan="2" align="right" >
                                                                                                        <asp:Button ID="Button16" runat="server"  ToolTip="Search" Text="Search"   OnClientClick="EFormShowPanel(true, 'searchResultWidnow'); return false;"
                                                                                                             SkinID="bntMiddle" />
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </td>
                                                                                    
                                                                                    </tr>

                                                                                 
                                                                            </table>
                                                                    </Content>
                                                                </asp:AccordionPane>
                                                                <asp:AccordionPane ID="AccordionPane5" HeaderCssClass="cssFormDesignAccordionHead" HeaderSelectedCssClass=".cssFormDesignSelectedHead"
                                                                    ContentCssClass="cssFormDesignAccordionContent" runat="server" ToolTip="Instructor Search">
                                                                    <Header>
                                                                        <asp:Label ID="Label6" runat="server" SkinID="label" Text="Instructor Search"></asp:Label>
                                                                    </Header>
                                                                    <Content>
                                                                         <table cellpadding="1" cellspacing="1" border ="0"  width="100%" style=" height: 300px" >
                                                                                    <tr>
                                                                                        <td  valign="top">
                                                                                             <table cellpadding="2" cellspacing="2" width="100%" border="0"   >
                                                                                                  <tr>
                                                                                                    <th  style=" font-size: 11px; font-weight: normal; "  align ="left">
                                                                                                       From:
                                                                                                    </th>
                                                                                                    <td>
                                                                                                          <pel:AdvancedCalendar ID="AdvancedCalendar6" runat="server" IsRequired="false"   Width="82%" /> 
                                                                                                    </td>
                                                                                                </tr>

                                                                                                 <tr>
                                                                                                    <th  style=" font-size: 11px; font-weight: normal; "  align ="left"> 
                                                                                                        To:
                                                                                                    </th>
                                                                                                    <td>
                                                                                                           <pel:AdvancedCalendar ID="AdvancedCalendar7" runat="server" IsRequired="false"  Width="82%"  /> 
                                                                                                    </td>
                                                                                                </tr>

                                                                                                <tr>
                                                                                                    <th  style=" font-size: 11px; font-weight: normal; "    align ="left"    >
                                                                                                        Name:
                                                                                                    </th>
                                                                                                    <td>
                                                                                                        <pel:SearchTextBox ID="SearchTextBox1" runat="server" Objective="userloginname" ValidationGroup="search"
                                                                                                            Width="92%" />
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <th style=" font-size: 11px; font-weight: normal; "  align ="left">
                                                                                                        Email:
                                                                                                    </th>
                                                                                                    <td>
                                                                                                        <pel:SearchTextBox ID="SearchTextBox2" runat="server" Objective="userloginname" ValidationGroup="search"
                                                                                                            Width="92%" />
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <th style=" font-size: 11px; font-weight: normal; "  align ="left">
                                                                                                        User Group:
                                                                                                    </th>
                                                                                                    <td>
                                                                                                        <pel:SearchTextBox ID="SearchTextBox3" runat="server" Objective="userloginname" ValidationGroup="search"
                                                                                                            Width="92%" />
                                                                                                    </td>
                                                                                                </tr>
                                                                                                   <tr>
                                                                                                    <th style=" font-size: 11px; font-weight: normal; "   align ="left" valign="top">
                                                                                                       View:
                                                                                                    </th>
                                                                                                    <th style=" font-size: 11px; font-weight: normal; ">

                                                                                                        <div  style="  border: 1px lightgray solid;  padding:4px; font-size: 11px; font-weight: normal;" >
                                                                                                            <table border="0"  cellpadding="1" cellspacing="1" width="100%">
                                                                                                                <tr>
                                                                                                                    <th   align ="left" style=" font-size: 11px; font-weight: normal; " >
                                                                                                                       <asp:Label ID="Label18" runat="server" Text="List View"></asp:Label>
                                                                                                                    </th>
                                                                                                                      <td>
                                                                                                                     <asp:CheckBox runat="server"  id="checkbox14"   ></asp:CheckBox>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                              
                                                                                                           
                                                                                                            </table>


                                                                                                        
                                                                                                            
                                                                                                       </div>
                                                                                                    </th>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td colspan="2" align="right" style="padding-right: 5px;">
                                                                                                        <asp:Button ID="Button1" runat="server" CssClass="refresh" ToolTip="Search" Text="Search"
                                                                                                             SkinID="bntMiddle" />&nbsp;&nbsp;
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        
                                                                                        </td>
                                                                                    
                                                                                    </tr>
                                                                            </table>
                                                                    </Content>
                                                                </asp:AccordionPane>
                                                                 <asp:AccordionPane ID="AccordionPane6" HeaderCssClass="cssFormDesignAccordionHead" HeaderSelectedCssClass=".cssFormDesignSelectedHead"
                                                                    ContentCssClass="cssFormDesignAccordionContent" runat="server" ToolTip="Instructor Search">
                                                                    <Header>
                                                                        <asp:Label ID="Label7" runat="server" SkinID="label" Text="Student Search"></asp:Label>
                                                                    </Header>
                                                                    <Content>
                                                                         <table cellpadding="1" cellspacing="1" border ="0"  width="100%" style=" height: 300px" >
                                                                                    <tr>
                                                                                        <td  valign="top">
                                                                                             <table cellpadding="2" cellspacing="2" width="100%" border="0"   >
                                                                                                 <tr>
                                                                                                    <th  style=" font-size: 11px; font-weight: normal; "  align ="left">
                                                                                                       From:
                                                                                                    </th>
                                                                                                    <td>
                                                                                                          <pel:AdvancedCalendar ID="AdvancedCalendar8" runat="server" IsRequired="false"   Width="82%" /> 
                                                                                                    </td>
                                                                                                </tr>

                                                                                                 <tr>
                                                                                                    <th  style=" font-size: 11px; font-weight: normal; "  align ="left"> 
                                                                                                        To:
                                                                                                    </th>
                                                                                                    <td>
                                                                                                           <pel:AdvancedCalendar ID="AdvancedCalendar9" runat="server" IsRequired="false"  Width="82%"  /> 
                                                                                                    </td>
                                                                                                </tr>

                                                                                                <tr>
                                                                                                    <th  style=" font-size: 11px; font-weight: normal; "    align ="left"    >
                                                                                                        Name:
                                                                                                    </th>
                                                                                                    <td>
                                                                                                        <pel:SearchTextBox ID="SearchTextBox18" runat="server" Objective="userloginname" ValidationGroup="search"
                                                                                                            Width="92%" />
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <th style=" font-size: 11px; font-weight: normal; "  align ="left">
                                                                                                        Email:
                                                                                                    </th>
                                                                                                    <td>
                                                                                                        <pel:SearchTextBox ID="SearchTextBox19" runat="server" Objective="userloginname" ValidationGroup="search"
                                                                                                            Width="92%" />
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <th style=" font-size: 11px; font-weight: normal; "  align ="left">
                                                                                                        User Group:
                                                                                                    </th>
                                                                                                    <td>
                                                                                                        <pel:SearchTextBox ID="SearchTextBox20" runat="server" Objective="userloginname" ValidationGroup="search"
                                                                                                            Width="92%" />
                                                                                                    </td>
                                                                                                </tr>
                                                                                                   <tr>
                                                                                                    <th style=" font-size: 11px; font-weight: normal; "   align ="left" valign="top">
                                                                                                       View:
                                                                                                    </th>
                                                                                                    <th style=" font-size: 11px; font-weight: normal; ">

                                                                                                        <div  style="  border: 1px lightgray solid;  padding:4px; font-size: 11px; font-weight: normal;" >
                                                                                                            <table border="0"  cellpadding="1" cellspacing="1" width="100%">
                                                                                                                <tr>
                                                                                                                    <th   align ="left" style=" font-size: 11px; font-weight: normal; " >
                                                                                                                       <asp:Label ID="Label19" runat="server" Text="List View"></asp:Label>
                                                                                                                    </th>
                                                                                                                      <td>
                                                                                                                     <asp:CheckBox runat="server"  id="checkbox15"   ></asp:CheckBox>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                              
                                                                                                           
                                                                                                            </table>


                                                                                                        
                                                                                                            
                                                                                                       </div>
                                                                                                    </th>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td colspan="2" align="right" style="padding-right: 5px;">
                                                                                                        <asp:Button ID="Button11" runat="server" CssClass="refresh" ToolTip="Search" Text="Search"
                                                                                                             SkinID="bntMiddle" />&nbsp;&nbsp;
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        
                                                                                        </td>
                                                                                    
                                                                                    </tr>
                                                                            </table>
                                                                    </Content>
                                                                </asp:AccordionPane>
                                                               </Panes>
                                                        </asp:Accordion> 
                                                    
                                                </td>
                                            </tr>
                                            <tr align="center" valign="bottom">
                                                <td>
                                                   
                                                </td>
                                            </tr>
                                        </table>

                                        </div>
                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:TabPanel>
                              <asp:TabPanel HeaderText="Field" Visible="true" runat="server" ID="TabPanel1" ToolTip="">
                                 <HeaderTemplate>
                                    <asp:Label ID="Label8" runat="server" SkinID="label" Text="Advanced..." ToolTip="Configure location, time zone..." />
                                   
                                </HeaderTemplate>
                                
                                <ContentTemplate>
                                    <asp:Panel ID="Panel1" runat="server">
                                             <table cellpadding="1" cellspacing="1" border ="0"  width="100%" style=" height: 300px" >
                                                        <tr>
                                                            <td  valign="top">
                                                                    <table cellpadding="2" cellspacing="2" width="100%" border="0"   >
                                                                    <tr>
                                                                        <th  style=" font-size: 11px; font-weight: normal; "    align ="left"    >
                                                                            Name:
                                                                        </th>
                                                                        <td>
                                                                            <pel:SearchTextBox ID="SearchTextBox4" runat="server" Objective="userloginname" ValidationGroup="search"
                                                                                Width="82%" /><asp:Button ID="Button3" runat="server" Text="..." CssClass="ShortButton" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th style=" font-size: 11px; font-weight: normal; "  align ="left">
                                                                            Email:
                                                                        </th>
                                                                        <td>
                                                                            <pel:SearchTextBox ID="SearchTextBox5" runat="server" Objective="userloginname" ValidationGroup="search"
                                                                                Width="82%" /><asp:Button ID="Button4" runat="server" Text="..." CssClass="ShortButton" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th style=" font-size: 11px; font-weight: normal; "  align ="left">
                                                                            User Group:
                                                                        </th>
                                                                        <td>
                                                                            <pel:SearchTextBox ID="SearchTextBox6" runat="server" Objective="userloginname" ValidationGroup="search"
                                                                                Width="82%" /><asp:Button ID="Button5" runat="server" Text="..."  CssClass="ShortButton" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2"  style=" height: 25px;">
                                                                            <hr  style=" background-color: #F2F2F2; width:100%;  height: 1px;  "  />
                                                                        
                                                                        </td>
                                                                    
                                                                    </tr>
                                                                     <tr>
                                                                        <th  style=" font-size: 11px; font-weight: normal; "    align ="left"    >
                                                                            Location:
                                                                        </th>
                                                                        <td>
                                                                            <pel:SearchTextBox ID="SearchTextBox7" runat="server" Objective="userloginname" ValidationGroup="search"
                                                                                Width="82%" /><asp:Button ID="Button6" runat="server" Text="..."  CssClass="ShortButton" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th style=" font-size: 11px; font-weight: normal; "  align ="left">
                                                                            Organization:
                                                                        </th>
                                                                        <td>
                                                                            <pel:SearchTextBox ID="SearchTextBox8" runat="server" Objective="userloginname" ValidationGroup="search"
                                                                                Width="82%" /><asp:Button ID="Button7" runat="server" Text="..." CssClass="ShortButton" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th style=" font-size: 11px; font-weight: normal; "  align ="left">
                                                                            Resource Type:
                                                                        </th>
                                                                        <td>
                                                                            <pel:SearchTextBox ID="SearchTextBox9" runat="server" Objective="userloginname" ValidationGroup="search"
                                                                                Width="82%" /><asp:Button ID="Button8" runat="server" Text="..."  CssClass="ShortButton" />
                                                                        </td>
                                                                    </tr>
                                                                     <tr>
                                                                        <th style=" font-size: 11px; font-weight: normal; "  align ="left">
                                                                            Resource:
                                                                        </th>
                                                                        <td>
                                                                            <pel:SearchTextBox ID="SearchTextBox13" runat="server" Objective="userloginname" ValidationGroup="search"
                                                                                Width="82%" /><asp:Button ID="Button12" runat="server" Text="..."  CssClass="ShortButton" />
                                                                        </td>
                                                                    </tr>

                                                                       <tr>
                                                                        <td colspan="2"  style=" height: 25px;">
                                                                            <hr  style=" background-color: #F2F2F2; width:100%;  height: 1px;  "  />
                                                                        
                                                                        </td>
                                                                    
                                                                    </tr>
                                                                     <tr>
                                                                        <th  style=" font-size: 11px; font-weight: normal; "    align ="left"    >
                                                                            Instructors:
                                                                        </th>
                                                                        <td>
                                                                            <pel:SearchTextBox ID="SearchTextBox10" runat="server" Objective="userloginname" ValidationGroup="search"
                                                                                Width="82%" /><asp:Button ID="Button9" runat="server" Text="..." CssClass="ShortButton" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th style=" font-size: 11px; font-weight: normal; "  align ="left">
                                                                            Students:
                                                                        </th>
                                                                        <td>
                                                                            <pel:SearchTextBox ID="SearchTextBox11" runat="server" Objective="userloginname" ValidationGroup="search"
                                                                                Width="82%" /><asp:Button ID="Button10" runat="server" Text="..." CssClass="ShortButton" />
                                                                        </td>
                                                                    </tr>
                                                                    
                                                                    <tr>
                                                                        <td colspan="2" align="right" style="padding-right: 5px;">
                                                                            <asp:Button ID="Button2" runat="server" CssClass="refresh" ToolTip="Search" Text="Search"
                                                                                SkinID="bntMiddle" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                                        
                                                            </td>
                                                                                    
                                                        </tr>
                                                    </table>
                                     </asp:Panel>
                                </ContentTemplate>
                            </asp:TabPanel>

                          
                        </asp:TabContainer>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="rightContainer" style="width: 1200px">
            <iframe id="frmContent" name="frmContent" frameborder="0" style="height: 99%; width: 100%;">
            </iframe>
        </div>
    </div>
    <%--  <asp:HiddenField ID="hfCurrentId" runat="server" />--%>
    <%--<input type="text" id="hfCurrentId" runat="server" style="display: none" />--%>
    <asp:TextBox ID="hfCurrentId" runat="server" Style="display: none"></asp:TextBox>
    <asp:HiddenField ID="hfCurrentDomainID" runat="server" />
    <asp:HiddenField ID="hfInitialTreePath" runat="server" />
    <asp:HiddenField ID="hfCourseID" runat="server" />
    <asp:HiddenField ID="hfIsPublishOrShareCourse" runat="server" />
    <asp:HiddenField ID="hfIsShare" runat="server" />
    <input id="hdnIframePageName" type="hidden" />
   
    <%-- 
   <script type="text/javascript">        init();</script>
    --%>

     <script type="text/javascript">
         iframeGotoPage('');
     </script>
      <a id="resource" href="#ResourceTypeProfile" title="Add Resource Pool" style="display: none;">
        Inline</a>
    <asp:HiddenField ID="hidControlList" runat="server" />
    <asp:HiddenField ID="hidLabelList" runat="server" />
    <div style="display: none;">
        <div id="ResourceTypeProfile" style="width: 810px; height: 570px;">
            <uc1:ucResourceSelection ID="ucResourceSelectione1" runat="server" />
        </div>
    </div>
    <div id="MiniResultList"   class="EFormPanel"  style="  z-index:99999;  position:absolute; top:110px; left:220px; width:150px; height:20px; ">
    <div class="MinResultWindowPanel">
     <table width="100%" style="height: 25px; z-index:999;" border="0" cellpadding="2" cellspacing="2" class="detailEdit" >
        <tr>
            <td  align="left" >
                <asp:Label ID="Label3" runat="server" Text="Search Results:"></asp:Label>   
            </td>
               <td></td>
                  <td align="right">
                      <asp:ImageButton ID="ImageButton2" runat="server"   ImageAlign="Top" ImageUrl="~/images/blueplus.gif"  OnClientClick="resize('searchResultWidnow', false); return false; " />
                    
                      <asp:ImageButton ID="ImageButton1" runat="server"   ImageUrl="~/images/fancy_close.png"     OnClientClick="EFormShowPanel(false, 'MiniResultList'); return false;" />
                  </td>
        </tr>
         </table>
    </div>
    </div>

     <div id="searchResultWidnow" class="EFormPanel"  style="  z-index:99999;  position:absolute; top:10px; left:10px; ">
        <uc4:ctrSearchResults ID="ctrFormDesign1" runat="server" />
    </div>

      <a id="locationList" href="#Location" title="Location" style="display:none;">Inline</a>
        <asp:HiddenField ID="HiddenField3" runat="server" />
        <asp:HiddenField ID="HiddenField4" runat="server" />
        <div style="display: none;  ">
            <div id="Location"   style=" width:840px; height:520px; ">
              
                      <uc3:ucLocation ID="ucLocation1" runat="server"  />
                   
            </div>
        </div>

</asp:Content>
