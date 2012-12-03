<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master/Main.Master"
CodeBehind="RuleList.aspx.cs" Inherits="Pelesys.Scheduling.Web.Files.RuleList" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register Assembly="DevExpress.Web.v12.1, Version=12.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.1, Version=12.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxSplitter" TagPrefix="dx" %>
<%@ Register Src="../Control/ucLocation.ascx" TagName="ucLocation" TagPrefix="uc3" %>
<%@ Register Src="../Control/ucAddUsers.ascx" TagName="ucAddUser" TagPrefix="uc4" %>
<%@ MasterType VirtualPath="~/Master/Main.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
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
        var GridViewAdjustRequired = true;
        function DropDownHandler(s, e) {
            SynchronizeFocusedRow();
            if (GridViewAdjustRequired)
                gv.AdjustControl();
            GridViewAdjustRequired = false;
        }
        function GridViewInitHandler(s, e) {
            SynchronizeFocusedRow();
            e.visibleIndex = 0;
            RowClickHandler(s, e);
        }
        function RowClickHandler(s, e) {
            DropDownEdit.SetKeyValue(gv.cpKeyValues[e.visibleIndex]);
            DropDownEdit.SetText(gv.cpEmployeeNames[e.visibleIndex]);
            DropDownEdit.HideDropDown();
            lb_expirydt.Text = gv.cpKeyValues[e.visibleIndex];

            //           cde_expdt.valueOf
        }
        function EndCallbackHandler(s, e) {
            DropDownEdit.AdjustDropDownWindow();
            UpdateEditBox();
        }
        function SynchronizeFocusedRow() {
            var keyValue = DropDownEdit.GetKeyValue();
            var index = -1;
            if (keyValue != null)
                index = ASPxClientUtils.ArrayIndexOf(gv.cpKeyValues, keyValue);
            gv.SetFocusedRowIndex(index);
            gv.MakeRowVisible(index);
            UpdateEditBox();
        }
        function UpdateEditBox() {
            var rowIndex = gv.GetFocusedRowIndex();
            var focusedEmployeeName = rowIndex == -1 ? "" : gv.cpEmployeeNames[rowIndex];
            var employeeNameInEditBox = DropDownEdit.GetText();
            if (employeeNameInEditBox != focusedEmployeeName)
                DropDownEdit.SetText(focusedEmployeeName);
        }
        function OnTreeViewNodeClick(s, e) {
            var node = ASPxTreeView1.GetSelectedNode();
            var pnode = node.parent;
            if (node.name == "RootNode") {
            }
            else if (node.name == "UsersNode") {
                SubjectName.SetText(pnode.text);
            }
            else if (pnode.name == "RootNode" || pnode.name == "UsersNode") {
                SubjectName.SetText(node.text);
            }
        }
        function AddNewNode() {

            var node = ASPxTreeView1.GetSelectedNode();

            if (node.name == "RootNode") {
                //            alert(node.name.toString());
                LocDefineFancyBox();
                return false;
            }
            else if (node.name == "UsersNode") {
                UserDefineFancyBox();
                return false;
            }
            else {
                var pnode = node.parent;
                if (pnode.name == "RootNode" || pnode.name == "UsersNode") {
                    alert(node.text.toString());
                    node.nodes.add("Effective yyyy-mm-dd");
                }
            }
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
        function UserDefineFancyBox() {

            $("#SearchUsers").fancybox({
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

            UserReadyFancy();
        }
        function UserReadyFancy() {

            $('#SearchUsers').trigger('click');
            // window.setTimeout('parent.$.fancybox.close();', 2500);


        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div style="visibility: visible; margin: 4px; padding: 4px; border-top: 6px solid white;
        border-left: 4px solid white; border-right: 4px solid white;">
        <dx:ASPxSplitter ID="ASPxSplitter1" runat="server" Height="500px">
            <Panes>
                <dx:SplitterPane MinSize="100px" MaxSize="680px" Size="280px" ScrollBars="Auto" PaneStyle-Border-BorderColor="Lightgray"
                    PaneStyle-Border-BorderWidth="1px" PaneStyle-Border-BorderStyle="Solid">
<PaneStyle>
<Border BorderColor="LightGray" BorderStyle="Solid" BorderWidth="1px"></Border>
</PaneStyle>
                    <ContentCollection>
                        <dx:SplitterContentControl ID="SCC1" runat="server">
                            <div class="treeToolBar" id="treeToolBar">
                                <asp:Button ID="btnRefresh" runat="server" CssClass="refresh" ToolTip="Refresh" OnClientClick="refreshTree(); return false;" />
                                <asp:Button ID="btnAddCurriculum" runat="server" CssClass="add" ToolTip="Add New Node"
                                    OnClientClick="return AddNewNode();"></asp:Button>
                                <asp:Button ID="btnRemove" runat="server" CssClass="del" ToolTip="Delete Node" OnClientClick="return DelNode();" />
                                <input type="submit" value="" id="d_clip_button" onclick="return false;" ondblclick="return false;"
                                    title="Copy Node" class="copy" />
                                <asp:Button ID="btnPaste" runat="server" CssClass="paste" ToolTip="Paste Node" OnClientClick="return PasteNode();"
                                    Style="display: " />
                                <%--                <img id="loading" class="loading" src="../images/loading.gif" alt="loading..." />--%>
                            </div>
                            <dx:ASPxTreeView ID="ASPxTreeView1" runat="server" ClientInstanceName="ASPxTreeView1"
                                AllowSelectNode="true" EnableClientSideAPI="True" EnableCallBacks="True">
                                <ClientSideEvents NodeClick="OnTreeViewNodeClick" />
                                <Nodes>
                                    <dx:TreeViewNode Name="RootNode" Text="Rules">
                                        <Nodes>
                                            <dx:TreeViewNode Text="Curriculum Schedule Save">
                                                <Nodes>
                                                    <dx:TreeViewNode Name="UsersNode" Text="InventoryCheck
                                                    ">
                                                        <Nodes>
                                                            <dx:TreeViewNode Text="IsActive: Yes">
                                                            </dx:TreeViewNode>
                                                            <dx:TreeViewNode Text="Script Type: JS Script">
                                                            </dx:TreeViewNode>
                                                            <dx:TreeViewNode Text="Return Type: Message">
                                                            </dx:TreeViewNode>
                                                        </Nodes>
                                                    </dx:TreeViewNode>
                                                </Nodes>
                                            </dx:TreeViewNode>
                                            <dx:TreeViewNode Text="Curriculum Schedule Save">
                                                <Nodes>
                                                    <dx:TreeViewNode Name="UsersNode" Text="CurriculumB737SaveRule">
                                                        <Nodes>
                                                            <dx:TreeViewNode Text="IsActive: Yes">
                                                            </dx:TreeViewNode>
                                                            <dx:TreeViewNode Text="Script Type: JS Script">
                                                            </dx:TreeViewNode>
                                                            <dx:TreeViewNode Text="Return Type: Message">
                                                            </dx:TreeViewNode>
                                                        </Nodes>
                                                    </dx:TreeViewNode>
                                                </Nodes>
                                            </dx:TreeViewNode>
                                            <dx:TreeViewNode Text="Curriculum Instructor Save">
                                                <Nodes>
                                                    <dx:TreeViewNode Name="UsersNode" Text="InstructorSaveRule">
                                                        <Nodes>
                                                            <dx:TreeViewNode Text="IsActive: Yes">
                                                            </dx:TreeViewNode>
                                                            <dx:TreeViewNode Text="Script Type: JS Script">
                                                            </dx:TreeViewNode>
                                                            <dx:TreeViewNode Text="Return Type: Message">
                                                            </dx:TreeViewNode>
                                                        </Nodes>
                                                    </dx:TreeViewNode>
                                                </Nodes>
                                            </dx:TreeViewNode>
                                        </Nodes>
                                    </dx:TreeViewNode>
                                </Nodes>
                            </dx:ASPxTreeView>
                        </dx:SplitterContentControl>
                    </ContentCollection>
                </dx:SplitterPane>
                <dx:SplitterPane PaneStyle-Border-BorderColor="Lightgray" PaneStyle-Border-BorderWidth="1px"
                    PaneStyle-Border-BorderStyle="Solid">
<PaneStyle>
<Border BorderColor="LightGray" BorderStyle="Solid" BorderWidth="1px"></Border>
</PaneStyle>
                    <ContentCollection>
                        <dx:SplitterContentControl ID="SplitterContentControl2" runat="server">
                             <table cellpadding="6" cellspacing="6" border="0"  width="100%">
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                          
                                            <div style="visibility: visible;margin: 4px;   padding-left:20px;  padding-top:12px; width:100%; height:370px; background-color: White; border: 1px solid lightgray;  " class="detailEdit"  >
                                                <table border="0" cellpadding="6" cellspacing="6" style="width: 100%; height: 100%;">
                                                    <tr>
                                                        <th align="left"  style=" width="150px;">
                                                            Name:<span class="required"></span>
                                                        </th>
                                                        <td  width="280px;">
                                                            <pel:SearchTextBox ID="SearchTextBox1" runat="server" Objective="userloginname" ValidationGroup="search"
                                                                Width="220px" />
                                                        </td>
                                                        <td   style=" width:40px;">
                                                        </td>
                                                        <th valign="top" align="left" width="150px;" >
                                                            <asp:Label ID="lblFormList" runat="server" Text="Event:"></asp:Label><span
                                                                class="required"></span>
                                                        </th>

                                                        <td>
                                                            <asp:DropDownList ID="ddlEventList" runat="server" Width="200px">
                                                            </asp:DropDownList>
                                                          
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Is System: </th>
                                                        <td> <asp:CheckBox runat="server"></asp:CheckBox></td>
                                                        <td style=" width:40px;"></td>
                                                        <th> IsActive:</th>
                                                        <td> <asp:CheckBox runat="server"></asp:CheckBox></td>
                                                    </tr>
                                                      <tr>
                                                        <th align="left"  style=" width="150px;">
                                                              <asp:Label ID="lblFormList1" runat="server" Text="Script Type:"></asp:Label>
                                                        </th>
                                                        <td  width="220px;">
                                                                <asp:DropDownList ID="ddlType1" runat="server" Width="200px">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td   style=" width:40px;">
                                                        </td>
                                                        <th valign="top" align="left" width="150px;" >
                                                            <asp:Label ID="lblType" runat="server" Text="Type:"></asp:Label><span
                                                                class="required"></span>
                                                        </th>

                                                        <td>
                                                            <asp:DropDownList ID="ddlType" runat="server" Width="200px">
                                                            </asp:DropDownList>
                                                          
                                                        </td>
                                                    </tr>
                                                     <tr>
                                                        <th valign="top" align="left"   colspan="3" >
                                                            Description:
                                                        </th>
                                                        <th>
                                                               
                                                        </th>
                                                        <td>
                                                         
                                                        </td>
                                                     </tr>

                                                    <tr>
                                                    
                                                 
                                                        <td  colspan="5">
                                                            <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Width="840px" Height="60px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                      <tr>
                                                        <th valign="top" align="left"   colspan="1"  >
                                                            Script:
                                                        </th>
                                                        <td>
                                                             <asp:Button ID="Button33" runat="server" Text="Parse" SkinID="bntMiddle" />
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <th>
                                                            Process Order:
                                                        </th>
                                                        <td>
                                                            <asp:TextBox runat="server" width="50px"></asp:TextBox>   <asp:Button ID="Button333" runat="server" Text="View Order" SkinID="bntMiddle" />
                                                        </td>
                                                     </tr>

                                                    <tr>
                                                    
                                                 
                                                        <td  colspan="5">
                                                            <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine" Width="840px" Height="60px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                      <tr>
                                                        <th valign="top" align="left"   colspan="3" >
                                                          Message:
                                                        </th>
                                                        <th></th>
                                                        <td></td>
                                                     </tr>

                                                    <tr>
                                                    
                                                 
                                                        <td  colspan="5">
                                                            <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine" Width="840px" Height="60px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                       
                                 
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
                                <tr>
                                    <td>
                                        <div id="Div2" class="SaveCancelPanel" style="width: 100%;">
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
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </dx:SplitterContentControl>
                    </ContentCollection>
                </dx:SplitterPane>
            </Panes>
        </dx:ASPxSplitter>
    </div>
    <asp:TextBox ID="hfCurrentId" runat="server" Style="display: none"></asp:TextBox>
    <asp:HiddenField ID="hfCurrentDomainID" runat="server" />
    <asp:HiddenField ID="hfInitialTreePath" runat="server" />
    <asp:HiddenField ID="hfCourseID" runat="server" />
    <asp:HiddenField ID="hfIsPublishOrShareCourse" runat="server" />
    <asp:HiddenField ID="hfIsShare" runat="server" />
    <a id="locationList" href="#Location" title="Location" style="display: none;">Inline</a>
    <div style="display: none;">
        <div id="Location" style="width: 840px; height: 100%;">
            <uc3:ucLocation ID="ucLocation1" runat="server" />
        </div>
    </div>
    <a id="SearchUsers" href="#AddUser" title="Add Users" style="display: none;">Inline</a>
    <div style="display: none;">
        <div id="AddUser" style="width: 840px; height: 100%;">
            <uc4:ucAddUser ID="ucLocation2" runat="server" />
        </div>
    </div>
    <script type="text/javascript">

        $('.pageBody').css('padding', '0');
        $('body>div').css('background-color', '#efefef')
        //$('.tab-tc:last').removeClass("tab-tc");
       
    </script>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="Pelesys.Scheduling.Web.Files.EffectiveDt"
        SelectMethod="GetAllDt" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
    </asp:ObjectDataSource>
</asp:Content>
