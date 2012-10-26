<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master/MainTab.Master"
    CodeBehind="ResourcePool.aspx.cs" Inherits="Pelesys.Scheduling.Web.Files.ResourcePool" %>
     <%@ Register Src="../Control/ucResourceProfile.ascx" TagName="ucResourceProfile"
    TagPrefix="uc1" %>
     <%@ Register Src="../Control/ucResourceInventoryProfile.ascx" TagName="ucResourceInventoryProfile"
    TagPrefix="uc2" %>
         <%@ Register Src="../Control/ucLocation.ascx" TagName="ucLocation"
    TagPrefix="uc3" %>

       <%@ Register Src="../Control/ucSelectExistingResources.ascx" TagName="ucSelectExistPool"
    TagPrefix="uc4" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ MasterType VirtualPath="~/Master/MainTab.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" runat="server">
    <style type="text/css">
        .splitContainer
        {
            height: 520px;
        }
        
        #userGroupPane
        {
            overflow: auto;
            height: 450px;
            background-color: #FFF;
            border: 1px lightgray solid;
            width: 96%;
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

        $(document).ready(function () {



            $("a.iframe").fancybox({
                'width': '100%',
                'height': '100%',
                'autoScale': false,
                'transitionIn': 'elastic',
                'transitionOut': 'elastic',
                'padding': 6,
                'zoomOpacity': true,
              
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


        });
        $(document).ready(function () {

            // first example
            $("#ddbrowser").treeview();


        });
        function iframeGotoPage(code, type) {
            // var node = $.jstree._focused().get_selected();
            $("#frmContent")[0].src
                = ($('#hdnIframePageName').val().length > 0 ? $('#hdnIframePageName').val() : 'ResourcePoolProfile.aspx')
                + '?type=' + type

                + '&Code=' + code

                + '&courseID=' + $('#<%=hfCourseID.ClientID%>').val()
                + '&action=load&nohead=1';
        }


        function iframeGotoInventoryPage(code, Type) {
            // var node = $.jstree._focused().get_selected();
            $("#frmContent")[0].src
                = ($('#hdnIframePageName').val().length > 0 ? $('#hdnIframePageName').val() : 'ResourceInventory.aspx')
                + '?type=' + type

                + '&Code=' + code

                + '&courseID=' + $('#<%=hfCourseID.ClientID%>').val()
                + '&action=load&nohead=1';
        }


        function iframeGotoSechduleCoursePage(code) {
            // var node = $.jstree._focused().get_selected();
            $("#frmContent")[0].src
                = ($('#hdnIframePageName').val().length > 0 ? $('#hdnIframePageName').val() : 'SchCourseProfile.aspx')
                + '?type=' + type

                + '&Code=' + code

                + '&courseID=' + $('#<%=hfCourseID.ClientID%>').val()
                + '&action=load&nohead=1';
        }
    </script>
    
     <script type="text/javascript">
         function InvenDefineFancyBox() {
         
             $("#resourceInventory").fancybox({
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

             InvenreadyFancy();
         }
         function InvenreadyFancy() {

             $('#resourceInventory').trigger('click');
             // window.setTimeout('parent.$.fancybox.close();', 2500);


         }


    </script>
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

       <script type="text/javascript">
           function DefineFancyBox() {

               $("#statusBox").fancybox({
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

               readyFancy();
           }
           function readyFancy() {

               $('#statusBox').trigger('click');
               // window.setTimeout('parent.$.fancybox.close();', 2500);addResourcePool


           }


    </script>



        <script type="text/javascript">
            function AddResourcePoolBox() {

                $("#addResourcePool").fancybox({
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

                addResourcePoolClick();
            }
            function addResourcePoolClick() {

                $('#addResourcePool').trigger('click');
                // window.setTimeout('parent.$.fancybox.close();', 2500);addResourcePool


            }


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentNav" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">
    <div class="splitContainer">
        <div>
            <div style="width: 100%; height: 50px; width: 100%; height: 60px;">
                <table cellpadding="2" cellspacing="2" width="100%" border="0">
                    <tr>
                        <th>
                            Location:
                        </th>
                        <td>
                            <pel:SearchTextBox ID="txtLoginName" runat="server" Objective="userloginname" ValidationGroup="search"
                                Width="82%" />
                            <asp:Button ID="Button1" runat="server" Text="..."  OnClientClick="LocDefineFancyBox(); return false;"  CssClass="ShortButton"  />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="right" style="padding-right: 5px;">
                            <asp:Button ID="bntSearch" runat="server" CssClass="refresh" ToolTip="Search" Text="Search"
                                SkinID="bntMiddle" />&nbsp;&nbsp;
                        </td>
                    </tr>
                </table>
            </div>
            <div id="userGroupPane">
                <div class="treeToolBar" id="treeToolBar">
                    <asp:Button ID="btnRefresh" runat="server" CssClass="refresh" ToolTip="Refresh" OnClientClick="refreshTree(); return false;" />
                    <asp:Button ID="btnAddCurriculum" runat="server" CssClass="add" ToolTip="Add New Curriculum"
                        OnClientClick="return AddNewNode('block');"></asp:Button>
                    <asp:Button ID="btnRemove" runat="server" CssClass="del" ToolTip="Delete" OnClientClick="return DelNode();" />
                    <input type="submit" value="" id="d_clip_button" onclick="return false;" ondblclick="return false;"
                        title="Add New Course" class="copy" />
                    <asp:Button ID="btnPaste" runat="server" CssClass="paste" ToolTip="Remove Course"
                        OnClientClick="return PasteNode();" Style="display: " />
                    <img id="loading" class="loading" src="../images/loading.gif" alt="loading..." />
                </div>
                <div id="structureTree" class="structureTree,jstree-drop,jstree-draggable">
                    <ul id="browser" class="filetree">
                        <li><span class="RType" style="font-size: 11px;" onclick="iframeGotoPage('Resources', 1);">
                            Resources</span>
                            <ul>
                                <li class="RLoc"><span class="RLoc" style="font-size: 11px; font-weight: normal;"
                                    onclick="iframeGotoPage('Room', 1);">Room</span>
                                    <ul>
                                        <li><span class="RLoc" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoPage('Class Room', 2)">
                                            Class Room</span>
                                           
                                        </li>
                                        <li><span class="RLoc" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoPage('Meeting Room', 2)">
                                            Meeting Room</span>
                                           
                                        </li>
                                        <li><span class="RLoc" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoPage('Office Room', 2)">
                                            Office Room</span>
                                           
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                            <ul>
                                <li class="RLoc"><span class="RLoc" style="font-size: 11px; font-weight: normal;"
                                    onclick="iframeGotoPage('Simulator', 1);">Simulator</span>
                                    <ul>
                                        <li><span class="RLoc" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoPage('A320', 1)">
                                            A320</span>
                                            <ul>
                                                <li><span class="RLoc" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoPage('Level 1', 1)">
                                                    Level 1</span>
                                                    <ul>
                                                        <li><span class="RLoc" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoPage('Visual/Dispaly 4', 2)">
                                                            Visual/Dispaly 4</span> </li>
                                                        <li><span class="RLoc" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoPage('Visual/Dispaly 5', 2)">
                                                            Visual/Display 5</span></li>
                                                        <li><span class="RLoc" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoPage('Visual/Dispaly 6', 2)">
                                                            Visual/Display 6</span></li>
                                                    </ul>
                                                </li>
                                                <li><span class="RLoc" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoPage('Level 2', 2)">
                                                    Level 2</span></li>
                                                <li><span class="RLoc" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoPage('Level 3', 2)">
                                                    Level 3</span></li>
                                            </ul>
                                        </li>
                                        <li><span class="RLoc" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoPage('B767', 1)">
                                            B767</span></li>
                                        <li><span class="RLoc" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoPage('B737', 1)">
                                            B737</span></li>
                                    </ul>
                                </li>
                            </ul>
                    <ul>
                        <li class="RPool"><span class="RPool" style="font-size: 11px; font-weight: normal;"
                            onclick="iframeGotoInventoryPage('155 Manual Book', 1);">155 Manual Book</span>
                            <ul>
                                <li><span class="RPool" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoInventoryPage('244 Manual Book', 2)">
                                    244 Manual Book</span></li>
                                <li><span class="RPool" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoInventoryPage('266 Manual Book', 2)">
                                    266 Manual Book</span></li>
                                <li><span class="RPool" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoInventoryPage(' 288 244 Manual Book', 2)">
                                    288 244 Manual Book</span></li>
                               
                            </ul>
                        </li>
                    </ul>
                    <ul>
                        <li class="RPool"><span class="RPool" style="font-size: 11px; font-weight: normal;"
                            onclick="iframeGotoPage('Office Furniture', 1);">Office Furniture</span>
                            <ul>
                                <li><span class="RPool" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoInventoryPage('Desk', 2)">
                                   Desk</span></li>
                                <li><span class="RPool" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoInventoryPage('Chair', 2)">
                                    Chair</span></li>
                                <li><span class="RPool" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoInventoryPage('Divisions', 2)">
                                    Divisions</span></li>
                               
                            </ul>
                        </li>
                    </ul>
                   
                  
                </div>
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

     <a id="resourceInventory" href="#ResourceInventoryProfile" title="Resource Inventory Profile" style="display:none;">Inline</a>
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <asp:HiddenField ID="HiddenField2" runat="server" />
        <div style="display: none;  ">
            <div id="ResourceInventoryProfile"   style=" width:850px; height:520px; ">
              
                      <uc2:ucResourceInventoryProfile ID="ucResourceInventoryProfile1" runat="server"  />
                   
            </div>
        </div>

     <a id="statusBox" href="#ResourceTypeProfile" title="Resource Proifle" style="display:none;">Inline</a>
        <asp:HiddenField ID="hidControlList" runat="server" />
        <asp:HiddenField ID="hidLabelList" runat="server" />
        <div style="display: none;  ">
            <div id="ResourceTypeProfile"   style=" width:800px; height:500px; ">
              
                      <uc1:ucResourceProfile ID="ucResourceProfile1" runat="server"  />
                   
            </div>
        </div>
         <a id="locationList" href="#Location" title="Location" style="display:none;">Inline</a>
        <asp:HiddenField ID="HiddenField3" runat="server" />
        <asp:HiddenField ID="HiddenField4" runat="server" />
        <div style="display: none;  ">
            <div id="Location"   style=" width:840px; height:100%; ">
              
                      <uc3:ucLocation ID="ucLocation1" runat="server"  />
                   
            </div>
        </div>


         <a id="addResourcePool" href="#ResourcePool" title="Add Existing Resource" style="display:none;">Inline</a>
        <asp:HiddenField ID="HiddenField5" runat="server" />
        <asp:HiddenField ID="HiddenField6" runat="server" />
        <div style="display: none;  ">
            <div id="ResourcePool"    style="width: 840px; height: 520px;">
              
                      <uc4:ucSelectExistPool ID="ucSelectExistPoolUI" runat="server"  />
                   
            </div>
        </div>



</asp:Content>
