<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Main.Master" AutoEventWireup="true"
    CodeBehind="WorkHourUser.aspx.cs" Inherits="Pelesys.Scheduling.Web.Files.WorkHourUser" %>

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
                                    <dx:TreeViewNode Name="RootNode" Text="Location">
                                        <Nodes>
                                            <dx:TreeViewNode Text="Vancouver">
                                                <Nodes>
                                                    <dx:TreeViewNode Name="UsersNode" Text="Exception Personals">
                                                        <Nodes>
                                                            <dx:TreeViewNode Text="Ryan Anderson">
                                                            </dx:TreeViewNode>
                                                            <dx:TreeViewNode Text="Stephanie Farenhorst">
                                                            </dx:TreeViewNode>
                                                            <dx:TreeViewNode Text="Jackie Jiang">
                                                            </dx:TreeViewNode>
                                                        </Nodes>
                                                    </dx:TreeViewNode>
                                                </Nodes>
                                            </dx:TreeViewNode>
                                            <dx:TreeViewNode Text="New York">
                                                <Nodes>
                                                    <dx:TreeViewNode Name="UsersNode" Text="Exception Personals">
                                                        <Nodes>
                                                            <dx:TreeViewNode Text="Anna Hall">
                                                            </dx:TreeViewNode>
                                                            <dx:TreeViewNode Text="Mark Wilkins">
                                                            </dx:TreeViewNode>
                                                            <dx:TreeViewNode Text="Robert Chen">
                                                            </dx:TreeViewNode>
                                                        </Nodes>
                                                    </dx:TreeViewNode>
                                                </Nodes>
                                            </dx:TreeViewNode>
                                            <dx:TreeViewNode Text="Beijing">
                                                <Nodes>
                                                    <dx:TreeViewNode Name="UsersNode" Text="Exception Personals">
                                                        <Nodes>
                                                            <dx:TreeViewNode Text="Bo Wang">
                                                            </dx:TreeViewNode>
                                                            <dx:TreeViewNode Text="Li Yang">
                                                            </dx:TreeViewNode>
                                                            <dx:TreeViewNode Text="Xin Zhang">
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
                            <table border="0" cellpadding="6" cellspacing="6" width="100%">
                                <tr>
                                    <th align="left">
                                        <%--                                            <asp:Button ID="Button16" runat="server" Text="+" CssClass="ShortButton" OnClientClick="DefineFancyBox();return false;" />
                                            <asp:Button ID="Button17" runat="server" Text="-" CssClass="ShortButton" />--%>
                                        <%--                                             <asp:Label ID="SubjectName" runat="server"  Text="Vancouver"></asp:Label>--%>
                                        <dx:ASPxLabel ID="SubjectName" runat="server" ClientInstanceName="SubjectName" Text="Vancouver"
                                            Font-Size="Medium" Font-Bold="True">
                                        </dx:ASPxLabel>
                                    </th>
                                </tr>
                                <tr>
                                    <td>
                                        <div style="height: 30px; width: 80%; border: none; overflow: auto;">
                                            <table>
                                                <tr>
                                                    <th>
                                                        <dx:ASPxLabel ID="dxlb_effdt" runat="server" ClientInstanceName="lb_effectivedate"
                                                            Text="Effective Date:  " Font-Size="Small" Font-Bold="False">
                                                        </dx:ASPxLabel>
                                                    </th>
                                                    <td style="width: 50%"> 
                                                        <div class="resultGridView">
                                                            <dx:ASPxDropDownEdit ID="DropDownEdit" runat="server" ClientInstanceName="DropDownEdit"
                                                                DisplayFormatString="MMM d, yyyy" Width="170px" AllowUserInput="False" 
                                                                EnableAnimation="False" OnTextChanged="DropDownEdit_TextChanged">
                                                                <DropDownWindowStyle>
                                                                    <Border BorderWidth="0px" />
                                                                </DropDownWindowStyle>
                                                                <DropDownWindowTemplate>
                                                                    <table>
                                                                        <tr>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                            </td>
                                                                            <td>
                                                                                <dx:ASPxButton runat="server" Text="New">
                                                                                </dx:ASPxButton>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                        </tr>
                                                                    </table>
                                                                    <dx:ASPxGridView ID="gv" runat="server" AutoGenerateColumns="False" ClientInstanceName="gv"
                                                                        Settings-ShowColumnHeaders="true" Width="500px" DataSourceID="ObjectDataSource1"
                                                                        KeyFieldName="EffectiveDate" OnRowInserting="GridView_RowInserting" OnInitNewRow="GridView_InitNewRow"
                                                                        OnCustomJSProperties="GridView_CustomJSProperties" OnAfterPerformCallback="GridView_AfterPerformCallback">
                                                                        <SettingsBehavior ConfirmDelete="True" EnableRowHotTrack="True" AllowFocusedRow="True" />
                                                                        <Columns>
                                                                            <dx:GridViewDataDateColumn FieldName="EffectiveDate" PropertiesDateEdit-DisplayFormatString="MMM d, yyyy"
                                                                                VisibleIndex="1">
                                                                            </dx:GridViewDataDateColumn>
                                                                            <dx:GridViewDataDateColumn FieldName="ExpiryDate" PropertiesDateEdit-DisplayFormatString="MMM d, yyyy"
                                                                                VisibleIndex="2">
                                                                            </dx:GridViewDataDateColumn>
                                                                            <%--                    <dx:GridViewCommandColumn VisibleIndex="3">
                        <EditButton Visible="True">
                        </EditButton>
                        <NewButton Visible="True">
                        </NewButton>
                        <DeleteButton Visible="True">
                        </DeleteButton>
                        <CellStyle Wrap="False">
                        </CellStyle>
                    </dx:GridViewCommandColumn>--%>
                                                                        </Columns>
                                                                        <ClientSideEvents Init="GridViewInitHandler" RowClick="RowClickHandler" EndCallback="EndCallbackHandler" />
                                                                        <SettingsPager Mode="ShowAllRecords">
                                                                        </SettingsPager>
                                                                        <Settings ShowVerticalScrollBar="True" />
                                                                    </dx:ASPxGridView>
                                                                </DropDownWindowTemplate>
                                                                <ClientSideEvents DropDown="DropDownHandler" />
                                                            </dx:ASPxDropDownEdit>
                                                        </div>
                                                    </td>
                                                    <th>
                                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" ClientInstanceName="lb_expirydate" Text="Expiry Date:  "
                                                            Font-Size="Small" Font-Bold="False">
                                                        </dx:ASPxLabel>
                                                    </th>
                                                    <td align="right">
                                                        <dx:ASPxLabel ID="lb_expirydt" runat="server" ClientInstanceName="lb_expirydt" Text="aaa"
                                                            Font-Size="Small" Font-Bold="False">
                                                        </dx:ASPxLabel>
                                                        <%--<dx:ASPxDateEdit ID="de_expdt" runat="server" ClientInstanceName="cde_expdt">
                                                        </dx:ASPxDateEdit>--%>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 16px;">
                                        <hr style="width: 100%; height: 1px; background-color: White" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 330px;">
                                        <div class="rightContainer" style="height: 100%; width: 100%">
                                            <div style="height: 100%; width: 100%">
                                                <dx:ASPxGridView ID="gvd" runat="server" KeyFieldName="Weekday" Theme="Office2003Blue"
                                                    Width="60%" AutoGenerateColumns="False">
                                                    <SettingsBehavior AllowFocusedRow="True" />
                                                    <Columns>
                                                        <dx:GridViewDataColumn FieldName="Weekday" VisibleIndex="1">
                                                        </dx:GridViewDataColumn>
                                                        <dx:GridViewDataTextColumn FieldName="Starttime" VisibleIndex="2">
                                                            <DataItemTemplate>
                                                                <dx:ASPxTimeEdit ID="ASPxTimeEdit1" runat="server" Width="90%">
                                                                </dx:ASPxTimeEdit>
                                                            </DataItemTemplate>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="Endtime" VisibleIndex="3">
                                                            <DataItemTemplate>
                                                                <dx:ASPxTimeEdit ID="ASPxTimeEdit2" runat="server" Width="90%">
                                                                </dx:ASPxTimeEdit>
                                                            </DataItemTemplate>
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:ASPxGridView>
                                            </div>
                                        </div>
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
