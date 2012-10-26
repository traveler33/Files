<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseSchedule.aspx.cs"
    MasterPageFile="~/Master/Main.Master" Inherits="Pelesys.Scheduling.Web.Files.CourseSchedule" %>

<%@ MasterType VirtualPath="~/Master/Main.Master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="../Control/ucAddStudents.ascx" TagName="ucLocation" TagPrefix="uc1" %>
<%@ Register Src="../Control/ucResourceSelection.ascx" TagName="ucResourceSelection"
    TagPrefix="uc2" %>
<%@ Register Src="../Control/ucStudentDetail.ascx" TagName="ucStudentDetail" TagPrefix="uc3" %>
<%@ Register Src="../Control/ucAddInstructors.ascx" TagName="Instuctors" TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script type="text/javascript">
        var previouseBox = null;
        var currentBox = null;
        var CurrentText = "";
        var CurrentColor = null;


        function SetRadioButtonValue(ClientID, value, Color) {

            var Radio = document.getElementById(ClientID);
            if (Radio != null) {

                previouseBox.value = value;
                previouseBox.style.backgroundColor = Color;
                CurrentColor = Color;
                CurrentText = value;
            }

        }
        function SelectValue(ishide, clientID) {
            var control = document.getElementById('CourseSelected');
            var ID = 'CourseSelected';

            var txtbox = document.getElementById(clientID);
            if (previouseBox != null) {
                if (previouseBox.value == "") {
                    previouseBox.style.backgroundColor = "#fff";
                }
            }
            if (ishide == true) {
                if (txtbox != null) {
                    p = GetScreenCordinates(txtbox);
                }


                //alert(p.y);

                $("#" + ID).css({ visibility: "visible" });
                $("#" + ID).css({ display: "block" });
                control.style.left = p.x + "pt";
                control.style.top = p.y + "pt";
                if (txtbox.value == "") {
                    if (CurrentText != "") {
                        txtbox.style.backgroundColor = CurrentColor;
                        txtbox.value = CurrentText;
                    }
                    else {
                        txtbox.style.backgroundColor = "#FFD700";
                    }
                }
                previouseBox = txtbox;

            }
            else {

                $("#" + ID).css({ visibility: "hidden" });
                $("#" + ID).css({ display: "none" });
                if (previouseBox != null) {

                    if (previouseBox.value == "") {
                        previouseBox.style.backgroundColor = "#fff";
                    }
                }

            }



        }

        function LocDefineFancyBox() {

            $("#ResourceTypeProfile").fancybox({
                'autoScale': false,
                'autoDimensions': false,
                'width': 1000,
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

            $('#ResourceTypeProfile').trigger('click');
            // window.setTimeout('parent.$.fancybox.close();', 2500);


        }



    </script>
    <script type="text/javascript">
        function AddStudents() {

            $("#AddStudents").fancybox({
                'autoScale': false,
                'autoDimensions': false,
                'width': 1200,
                'transitionIn': 'elastic',
                'transitionOut': 'elastic',
                'padding': 4,

                'titlePosition': 'inside',
                'titleShow': true,

                "onUpdate": function () {
                    $(".fancybox-title").css({ 'top': '-30px', 'bottom': 'auto' });
                },
                "afterLoad": function () {
                    $(".fancybox-title").css({ 'top': '-30px', 'bottom': 'auto' });
                }
            });

            AddStudentClick();
        }
        function AddStudentClick() {

            $('#AddStudents').trigger('click');
            // window.setTimeout('parent.$.fancybox.close();', 2500);


        }


    </script>
    <script type="text/javascript">
	    $(document).ready(function () {
	       
	        $("#Resource").fancybox({
	            'autoScale': false,
                'autoDimensions': false,
                'width': 1000,
                'transitionIn': 'elastic',
                'transitionOut': 'elastic',
                'padding': 6,

                'titlePosition': 'inside',
                'titleShow': true,


	        });

	     
	    });




    function TriggerResource() 
    {  

        $('#Resource').trigger('click');
      //  window.setTimeout('parent.$.fancybox.close();', 2500);  StudentList
       
       
    }


    </script>
    <script type="text/javascript">
	    $(document).ready(function () {
	       
	        $("#StudentList").fancybox({
	            'autoScale': false,
                'autoDimensions': false,
                'width': 1000,
                'transitionIn': 'elastic',
                'transitionOut': 'elastic',
                'padding': 6,

                'titlePosition': 'inside',
                'titleShow': true,


	        });

	     
	    });




    function TriggerStudent() 
    {  

        $('#StudentList').trigger('click');
      //  window.setTimeout('parent.$.fancybox.close();', 2500);  StudentList
       
       
    }


    </script>
    <script type="text/javascript">
	    $(document).ready(function () {
	       
	        $("#Resource").fancybox({
	            'autoScale': false,
                'autoDimensions': false,
                'width': 1000,
                'transitionIn': 'elastic',
                'transitionOut': 'elastic',
                'padding': 6,

                'titlePosition': 'inside',
                'titleShow': true,


	        });

	     
	    });




    function TriggerResource() 
    {  

        $('#Resource').trigger('click');
      //  window.setTimeout('parent.$.fancybox.close();', 2500);  StudentList
       
       
    }


    </script>
    <script type="text/javascript">
	    $(document).ready(function () {
	       
	        $("#Schedule").fancybox({
	            'autoScale': false,
                'autoDimensions': false,
                'width': 1300,
                'transitionIn': 'elastic',
                'transitionOut': 'elastic',
                'padding': 6,

                'titlePosition': 'inside',
                'titleShow': true,


	        });

	     
	    });




    function TriggerSchedule() 
    {  

        $('#Schedule').trigger('click');
      //  window.setTimeout('parent.$.fancybox.close();', 2500);  StudentList
       
       
    }


    </script>


     <script type="text/javascript">
	    $(document).ready(function () {
	       
	        $("#Instructor").fancybox({
	            'autoScale': false,
                'autoDimensions': false,
                'width': 1000,
                'transitionIn': 'elastic',
                'transitionOut': 'elastic',
                'padding': 6,

                'titlePosition': 'inside',
                'titleShow': true,


	        });

	     
	    });




    function TriggerInstructor() 
    {  

        $('#Instructor').trigger('click');
      //  window.setTimeout('parent.$.fancybox.close();', 2500);  StudentList
       
       
    }


    </script>


    <script type="text/javascript">
        function StudentDetail() {

            $("#ScheduleDetail").fancybox({
                'autoScale': false,
                'autoDimensions': false,
                'width': 1300,
                'transitionIn': 'elastic',
                'transitionOut': 'elastic',
                'padding': 6,
                'overlayShow': true,
                'autoScale': false,

                'titlePosition': 'inside',
                'titleShow': true,

                "onUpdate": function () {
                    $(".fancybox-title").css({ 'top': '-30px', 'bottom': 'auto' });
                },
                'onComplete': function ()
                { $('#filed').focus(); },

                "afterLoad": function () {
                    $(".fancybox-title").css({ 'top': '-30px', 'bottom': 'auto' });
                }
            });

            StudentDetailClick();
        }
        function StudentDetailClick() {

            $('#ScheduleDetail').trigger('click');
            // window.setTimeout('parent.$.fancybox.close();', 2500);


        }

        function GetScreenCordinates(obj) {
            var p = {};
            p.x = obj.offsetLeft;
            p.y = obj.offsetTop;

            while (obj.offsetParent) {

                p.x = p.x + obj.offsetParent.offsetLeft;

                p.y = p.y + obj.offsetParent.offsetTop;

                if (obj == document.getElementsByTagName("body")[0]) {
                    break;
                }
                else {

                    obj = obj.offsetParent;

                }
            }

            p.x = p.x - 60;
            p.y = p.y - 200;
            return p;

        }
    </script>
    <script type="text/javascript">
	    $(document).ready(function () {
	       
	        $("#statusBox").fancybox({
	            'overlayShow': true,
	            'transitionIn': 'elastic',
	            'transitionOut': 'elastic',
                'padding': 6,
                'zoomOpacity': true,
                'zoomSpeedIn': 500,
                'zoomSpeedOut': 500,

	        });

	     
	    });
    function callBoxFancy(cclass, msg) 
    {    $('#status').text(msg);
         var currentClass =  $('#status').attr("class");
         if ( currentClass != cclass); 
         {
             $('#status').removeClass(currentClass);
         }
         $('#status').addClass(cclass);
     
        $('#statusBox').trigger('click');
      //  window.setTimeout('parent.$.fancybox.close();', 2500);
       
       
    }


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div id="Div1" class="TitlePanel" style="border-top: solid 2px white; margin: 4px;
        padding: 4px; height: 470px;">
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
                                                            <table border="0" cellpadding="2" cellspacing="2" width="900px">
                                                                <tr>
                                                                    <th style="width: 100px;">
                                                                        From:
                                                                    </th>
                                                                    <td align="left" style="width: 200px;">
                                                                        <pel:AdvancedCalendar ID="AdvancedCalendar8" runat="server" IsRequired="false" Width="120px" />
                                                                    </td>
                                                                    <th style="width: 100px;">
                                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;To:
                                                                    </th>
                                                                    <td align="left" style="width: 200px;">
                                                                        <pel:AdvancedCalendar ID="AdvancedCalendar9" runat="server" IsRequired="false" Width="120px" />
                                                                    </td>
                                                                    <th>
                                                                        Included Weekend
                                                                        <asp:CheckBox ID="CheckBox1" runat="server" />
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
                        <asp:TabPanel HeaderText="Curriculum" Visible="true" runat="server" ID="dbstructure">
                            <ContentTemplate>
                                <div class="detailEdit" style="visibility: visible; margin: 4px; padding-top: 6px;
                                    width: 98%;">
                                    <table border="0" cellpadding="4" cellspacing="4" style="width: 600px; height: 100%;"
                                        class="detailEdit">
                                        <tr>
                                            <th style="width: 150px;">
                                                <asp:Label ID="Label3" runat="server" Text="Curriculum Name:"></asp:Label>
                                            </th>
                                            <td>
                                                <asp:DropDownList ID="DropDownList3" runat="server" Width="230px" SkinID="eFormDropDownList">
                                                </asp:DropDownList>
                                                <asp:Button ID="Button4" runat="server" Text="Detail" SkinID="bntMiddle" OnClientClick="showModalNoFrame('../Files/CurriculumView.aspx?nohead=1', 'CurriculumDetail', 450, 350); return false;" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th valign="top" align="left" style="width: 150px;">
                                                Time Span:
                                            </th>
                                            <th>
                                                <asp:TextBox ID="TextBox9" runat="server" Width="110px"></asp:TextBox>
                                                Time Unit Type:
                                                <asp:DropDownList ID="DropDownList2" runat="server" Width="100px">
                                                </asp:DropDownList>
                                            </th>
                                        </tr>
                                        <tr>
                                            <th valign="top" align="left" style="width: 150px;">
                                                Max Students:
                                            </th>
                                            <td valign="top">
                                                <asp:TextBox ID="TextBox8" runat="server" Width="300px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th valign="top" align="left" style="width: 150px;">
                                                Has Break:
                                            </th>
                                            <td align="left">
                                                <asp:CheckBox ID="CheckBox3" runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel HeaderText="Resources" Visible="true" runat="server" ID="TabPanel4">
                            <ContentTemplate>
                                <div style="visibility: visible; margin: 4px;" class="detailEdit">
                                    <table border="0" cellpadding="2" cellspacing="2" width="100%">
                                        <tr>
                                            <td colspan="2" style="height: 10px;">
                                            </td>
                                        </tr>
                                        <th align="left">
                                            Courses:
                                        </th>
                                        <td style="width: 12px;">
                                        </td>
                                        <td style="width: 300px">
                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                <ContentTemplate>
                                                    <asp:Button ID="Button16" runat="server" Text="+" CssClass="ShortButton" OnClick="Resource_Click" />
                                                    <asp:Button ID="Button17" runat="server" Text="-" CssClass="ShortButton" />
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                        <td align="left">
                                            <asp:Button ID="Button5" runat="server" Text="Check Availability" CssClass="lButton"
                                                OnClientClick="showModalNoFrame('../Files/CheckAvailability.aspx?nohead=1', 'CheckAvailability', 450, 350); return false;" />
                                        </td>
                                        </tr>
                                        <tr>
                                            <th valign="top" align="left">
                                                <asp:ListBox ID="lstCourseList" runat="server" Width="240px" SkinID="eFormList" Style="height: 260px;">
                                                </asp:ListBox>
                                            </th>
                                            <td style="width: 12px;">
                                            </td>
                                            <td colspan="2">
                                                <div style="height: 260px; width: 700px; border: 1px solid lightgray; overflow: auto;">
                                                    <div class="resultGridView">
                                                        <dx:ASPxGridView ID="GridView5" ClientInstanceName="grid" runat="server" KeyFieldName="ResourcePoolID"
                                                            Border-BorderColor="LightGray" Border-BorderStyle="Solid" Border-BorderWidth="1"
                                                            Font-Names="Verdana" Font-Size="10px" ForeColor="#342F2F" AutoGenerateColumns="False"
                                                            Theme="Office2003Blue" EnableRowsCache="True" Width="100%" DataSourceForceStandardPaging="False"
                                                            SettingsPager-AlwaysShowPager="True" SettingsPager-Position="Bottom">
                                                            <Columns>
                                                                <dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0" Width="30px">
                                                                    <HeaderTemplate>
                                                                        <asp:CheckBox ID="CheckBox2" runat="server" />
                                                                    </HeaderTemplate>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </dx:GridViewCommandColumn>
                                                                <dx:GridViewDataColumn FieldName="Name" VisibleIndex="1" Caption="Name" SortOrder="Ascending" />
                                                                <dx:GridViewDataHyperLinkColumn Caption="Resource Type" VisibleIndex="2">
                                                                    <DataItemTemplate>
                                                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Simulator">
                                                                        </dx:ASPxLabel>
                                                                    </DataItemTemplate>
                                                                </dx:GridViewDataHyperLinkColumn>
                                                                <dx:GridViewDataTextColumn Caption="Quatity" VisibleIndex="3" Width="60px">
                                                                    <DataItemTemplate>
                                                                        <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="40px" Text="2">
                                                                        </dx:ASPxTextBox>
                                                                    </DataItemTemplate>
                                                                    <CellStyle HorizontalAlign="Center">
                                                                    </CellStyle>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <Settings ShowGroupPanel="False" />
                                                            <SettingsBehavior AllowFocusedRow="False" />
                                                            <Settings GridLines="Vertical" />
                                                            <Styles>
                                                                <AlternatingRow Enabled="True" />
                                                            </Styles>
                                                            <SettingsPager PageSize="10">
                                                                <PageSizeItemSettings Visible="true" ShowAllItem="true" />
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
                        <asp:TabPanel HeaderText="Instructors" Visible="true" runat="server" ID="TabPanel1">
                            <ContentTemplate>
                                <div style="visibility: visible; margin: 4px;" class="detailEdit">
                                    <table border="0" cellpadding="2" cellspacing="2" width="100%">
                                        <tr>
                                            <td style="width: 200px">
                                                <asp:Button ID="Button9" runat="server" Text="+" CssClass="ShortButton" OnClientClick=" TriggerInstructor() ;  return false;" />
                                                <asp:Button ID="Button10" runat="server" Text="-" CssClass="ShortButton" />
                                            </td>
                                            <td>
                                                <asp:Button ID="Button15" runat="server" Text="Check Availability" CssClass="lButton"
                                                    OnClientClick="showModalNoFrame('../Files/CheckAvailability.aspx?nohead=1', 'CheckAvailability', 450, 350); return false;" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <div style="height: 280px; width: 1300px; border: 1px lightgray solid; overflow: auto;">
                                                    <div class="resultGridView">
                                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="griview"
                                                            Height="0px" HeaderStyle-CssClass="HeaderStyle-CssClass" RowStyle-CssClass="RowStyle-CssClass"
                                                            AllowPaging="false" PagerSettingsVisible="false" GridLines="None" AlternatingRowStyle-CssClass="AlternatingRowStyle-CssClass"
                                                            EditRowStyle-CssClass="SelectedRowStyle-CssClass" Width="100%">
                                                            <Columns>
                                                                <asp:BoundField HeaderText="Name" SortExpression="FirstName" DataField="FirstName"
                                                                    ItemStyle-HorizontalAlign="left" HeaderStyle-Width="188px" HeaderStyle-CssClass="grid_head_center" />
                                                              
                                                                <asp:TemplateField HeaderText="Intrduction" HeaderStyle-Width="140" ItemStyle-HorizontalAlign="Left"
                                                                    HeaderStyle-CssClass="grid_head_center">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label2111e" runat="server" Text="5"></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Scecurity Traning 1" HeaderStyle-Width="140" ItemStyle-HorizontalAlign="Left"
                                                                    HeaderStyle-CssClass="grid_head_center">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label21111ee" runat="server" Text="5"></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Scecurity Traning 2" HeaderStyle-Width="140" ItemStyle-HorizontalAlign="Left"
                                                                    HeaderStyle-CssClass="grid_head_center">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label211111eeee" runat="server" Text="5"></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Scecurity Traning 3" HeaderStyle-Width="140" ItemStyle-HorizontalAlign="Left"
                                                                    HeaderStyle-CssClass="grid_head_center">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label2test" runat="server" Text="5"></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Scecurity Traning 4" HeaderStyle-Width="140" ItemStyle-HorizontalAlign="Left"
                                                                    HeaderStyle-CssClass="grid_head_center">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label21111tt" runat="server" Text="5"></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Summary" HeaderStyle-Width="140" ItemStyle-HorizontalAlign="Left"
                                                                    HeaderStyle-CssClass="grid_head_center">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label21111tt" runat="server" Text="5"></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel HeaderText="Students" Visible="true" runat="server" ID="TabPanel2">
                            <ContentTemplate>
                                <div style="visibility: visible; margin: 4px;" class="detailEdit">
                                    <table border="0" cellpadding="3" cellspacing="3" width="99%">
                                        <tr>
                                            <td colspan="2">
                                                <table border="0" cellpadding="1" cellspacing="1" style="width: 1200px; height: 99%;">
                                                    <tr>
                                                        <td valign="middle">
                                                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                                <ContentTemplate>
                                                                    <asp:Button ID="Button61" runat="server" Text="+" CssClass="ShortButton" OnClick="AddStudent_Click" />
                                                                    <asp:Button ID="Button7" runat="server" Text="-" CssClass="ShortButton" />
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="Button6" runat="server" Text="Check Availability" CssClass="lButton"
                                                                OnClientClick="showModalNoFrame('../Files/CheckAvailability.aspx?nohead=1', 'CheckAvailability', 450, 350); return false;" />
                                                        </td>
                                                        <td>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3">
                                                            <div style="height: 286px; width: 1050px; border: 1px lightgray solid; overflow: auto;">
                                                                <div class="resultGridView">
                                                                    <dx:ASPxGridView ID="gv" ClientInstanceName="grid" runat="server" KeyFieldName="UserID"
                                                                        Border-BorderColor="LightGray" Border-BorderStyle="Solid" Border-BorderWidth="1"
                                                                        Font-Names="Verdana" Font-Size="10px" ForeColor="#342F2F" AutoGenerateColumns="False"
                                                                        Theme="Office2003Blue" EnableRowsCache="True" Width="100%" DataSourceForceStandardPaging="False"
                                                                        SettingsPager-AlwaysShowPager="True" SettingsPager-Position="Bottom">
                                                                        <Columns>
                                                                            <dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0" Width="30px">
                                                                                <HeaderTemplate>
                                                                                    <asp:CheckBox ID="CheckBox2" runat="server" />
                                                                                </HeaderTemplate>
                                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                            </dx:GridViewCommandColumn>
                                                                            <dx:GridViewDataColumn FieldName="FirstName" VisibleIndex="1" Caption="Name" SortOrder="Ascending" />
                                                                            <dx:GridViewDataHyperLinkColumn Caption="Equipment" VisibleIndex="2">
                                                                                <DataItemTemplate>
                                                                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text=" Airbus 322">
                                                                                    </dx:ASPxLabel>
                                                                                </DataItemTemplate>
                                                                            </dx:GridViewDataHyperLinkColumn>
                                                                            <dx:GridViewDataHyperLinkColumn Caption="Job Role" VisibleIndex="3">
                                                                                <DataItemTemplate>
                                                                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Job Role">
                                                                                    </dx:ASPxLabel>
                                                                                </DataItemTemplate>
                                                                            </dx:GridViewDataHyperLinkColumn>
                                                                            <dx:GridViewDataHyperLinkColumn Caption="Group" VisibleIndex="4">
                                                                                <DataItemTemplate>
                                                                                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text=" Traing Group A">
                                                                                    </dx:ASPxLabel>
                                                                                </DataItemTemplate>
                                                                            </dx:GridViewDataHyperLinkColumn>
                                                                            <dx:GridViewDataImageColumn Caption="Detail" VisibleIndex="5">
                                                                                <DataItemTemplate>
                                                                                    <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/Images/sml_script.Png">
                                                                                    </dx:ASPxImage>
                                                                                </DataItemTemplate>
                                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                            </dx:GridViewDataImageColumn>
                                                                            <dx:GridViewDataColumn FieldName="FirstName" VisibleIndex="1" Caption="Location"
                                                                                SortOrder="Ascending" />
                                                                        </Columns>
                                                                        <Settings ShowGroupPanel="False" />
                                                                        <SettingsBehavior AllowFocusedRow="False" />
                                                                        <Settings GridLines="Vertical" />
                                                                        <Styles>
                                                                            <AlternatingRow Enabled="true" />
                                                                        </Styles>
                                                                        <SettingsPager PageSize="10">
                                                                            <PageSizeItemSettings Visible="true" ShowAllItem="true" />
                                                                        </SettingsPager>
                                                                    </dx:ASPxGridView>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                </div>
                                </div </td> </tr> </table> </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel HeaderText="Course Plan" Visible="true" runat="server" ID="TabPanel3">
                            <ContentTemplate>
                                <div style="visibility: visible; margin: 4px; height: 330px; overflow: auto;" class="detailEdit">
                                    <table border="0" cellpadding="6" cellspacing="6">
                                        <tr>
                                            <td style="width: 220px;" valign="top">
                                                <table border="0" cellpadding="6" cellspacing="6">
                                                    <tr>
                                                        <th style="width: 100px;">
                                                            <asp:Label ID="Label1" runat="server" Text="Total Weeks"></asp:Label>
                                                        </th>
                                                        <td align="left" style="width: 200px;">
                                                            <asp:TextBox ID="TextBox1" runat="server" Width="80px"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="Button3" runat="server" Text="Generating" SkinID="bntMiddle" />
                                                            <asp:Button ID="Button12" runat="server" Text="Report" SkinID="bntMiddle" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table cellpadding="6" cellspacing="6" border="0" width="1300px" style="height: 230px">
                                                    <tr>
                                                        <th style="width: 100px;">
                                                            <asp:Label ID="Label4" runat="server" Text="Weeks:"></asp:Label>
                                                        </th>
                                                        <td>
                                                            <asp:DropDownList ID="DropDownList7" runat="server" Width="300px" SkinID="eFormDropDownList">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">
                                                            <asp:Button ID="Button41" runat="server" Text="+" CssClass="ShortButton" />
                                                            <asp:Button ID="Button51" runat="server" Text="-" CssClass="ShortButton" />
                                                        </td>
                                                        <td valign="top">
                                                            <div style="border: 1px solid lightgray; width: 1180px; height: 226px; overflow: auto;">
                                                                <dx:ASPxGridView ID="gvweek1" ClientInstanceName="grid" runat="server" KeyFieldName="SettingID"
                                                                    Border-BorderColor="LightGray" Border-BorderStyle="Solid" Border-BorderWidth="1"
                                                                    Font-Names="Verdana" Font-Size="10px" ForeColor="#342F2F" AutoGenerateColumns="False"
                                                                    Theme="Office2003Blue" EnableRowsCache="True" Width="100%" DataSourceForceStandardPaging="False"
                                                                    SettingsPager-AlwaysShowPager="True" SettingsPager-Position="Bottom">
                                                                    <Columns>
                                                                        <dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0" Width="30px">
                                                                            <HeaderTemplate>
                                                                                <asp:CheckBox ID="CheckBox2" runat="server" />
                                                                            </HeaderTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                        </dx:GridViewCommandColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Day" VisibleIndex="1" Width="60px">
                                                                            <DataItemTemplate>
                                                                                <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="40px" Text="2">
                                                                                </dx:ASPxTextBox>
                                                                            </DataItemTemplate>
                                                                            <CellStyle HorizontalAlign="Center">
                                                                            </CellStyle>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataComboBoxColumn Caption="Resource" VisibleIndex="2">
                                                                            <DataItemTemplate>
                                                                                <dx:ASPxComboBox ID="ASPxComboBox1" Width="180px" runat="server" ValueType="System.String">
                                                                                </dx:ASPxComboBox>
                                                                            </DataItemTemplate>
                                                                        </dx:GridViewDataComboBoxColumn>
                                                                        <dx:GridViewDataComboBoxColumn Caption="Course" VisibleIndex="2">
                                                                            <DataItemTemplate>
                                                                                <dx:ASPxComboBox ID="ASPxComboBox1" Width="220px" runat="server" ValueType="System.String">
                                                                                </dx:ASPxComboBox>
                                                                            </DataItemTemplate>
                                                                        </dx:GridViewDataComboBoxColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Duration" VisibleIndex="3" Width="60px">
                                                                            <DataItemTemplate>
                                                                                <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="50px" Text="2">
                                                                                </dx:ASPxTextBox>
                                                                            </DataItemTemplate>
                                                                            <CellStyle HorizontalAlign="Center">
                                                                            </CellStyle>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataComboBoxColumn Caption="Instructors" VisibleIndex="2">
                                                                            <DataItemTemplate>
                                                                                <dx:ASPxComboBox ID="ASPxComboBox1" Width="200px" runat="server" ValueType="System.String">
                                                                                </dx:ASPxComboBox>
                                                                            </DataItemTemplate>
                                                                        </dx:GridViewDataComboBoxColumn>
                                                                        <dx:GridViewDataTimeEditColumn Caption="From" VisibleIndex="5">
                                                                            <DataItemTemplate>
                                                                                <dx:ASPxTimeEdit ID="ASPxTimeEdit1" runat="server" Width="100px">
                                                                                </dx:ASPxTimeEdit>
                                                                            </DataItemTemplate>
                                                                        </dx:GridViewDataTimeEditColumn>
                                                                        <dx:GridViewDataTimeEditColumn Caption="To" VisibleIndex="5">
                                                                            <DataItemTemplate>
                                                                                <dx:ASPxTimeEdit ID="ASPxTimeEdit1" runat="server" Width="100px">
                                                                                </dx:ASPxTimeEdit>
                                                                            </DataItemTemplate>
                                                                        </dx:GridViewDataTimeEditColumn>
                                                                        <dx:GridViewDataImageColumn Caption="Student's Detail" VisibleIndex="5">
                                                                            <DataItemTemplate>
                                                                                <asp:ImageButton runat="server" ImageUrl="~/Images/sml_script.Png" OnClientClick="TriggerSchedule(); return false;">
                                                                                </asp:ImageButton>
                                                                            </DataItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                        </dx:GridViewDataImageColumn>
                                                                    </Columns>
                                                                    <Settings ShowGroupPanel="False" />
                                                                    <SettingsBehavior AllowFocusedRow="False" />
                                                                    <Settings GridLines="Vertical" />
                                                                    <Styles>
                                                                        <AlternatingRow Enabled="True" />
                                                                    </Styles>
                                                                    <SettingsPager PageSize="10">
                                                                        <PageSizeItemSettings Visible="true" ShowAllItem="true" />
                                                                    </SettingsPager>
                                                                </dx:ASPxGridView>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
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

     <a id="Instructor" href="#selectintructore" title="Add Instructors" style="display: none;">
        Inline</a>
    <asp:HiddenField ID="HiddenField7" runat="server" />
    <asp:HiddenField ID="HiddenField8" runat="server" />
    <div style="display: none;">
        <div id="selectintructore" style="width: 820px; height: 510px;">
            <uc4:Instuctors ID="ucResourceSelection1" runat="server" />
        </div>
    </div>

    <a id="Resource" href="#ResourceTypeProfile" title="Add Students" style="display: none;">
        Inline</a>
    <asp:HiddenField ID="hidControlList" runat="server" />
    <asp:HiddenField ID="hidLabelList" runat="server" />
    <div style="display: none;">
        <div id="ResourceTypeProfile" style="width: 770px; height: 520px;">
            <uc2:ucResourceSelection ID="ucResourceSelectione1" runat="server" />
        </div>
    </div>
    <a id="StudentList" href="#AddStudents" title="Add Students" style="display: none;">
        Inline</a>
    <asp:HiddenField ID="HiddenField3" runat="server" />
    <asp:HiddenField ID="HiddenField4" runat="server" />
    <div style="display: none;">
        <div id="AddStudents" style="width: 840px; height: 520px;">
            <uc1:ucLocation ID="ucLocation1" runat="server" />
        </div>
    </div>
    <a id="Schedule" href="#ScheduleDetail" title="Schedule Detail" style="display: none;">
        Inline</a>
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:HiddenField ID="HiddenField2" runat="server" />
    <div style="display: none;">
        <div id="ScheduleDetail" style="width: 1200px; height: 520px;">
            <uc3:ucStudentDetail ID="ucstDetail" runat="server" />
        </div>
    </div>
    <a id="statusBox" href="#status" title="" style="display: none;">Inline</a>
    <asp:HiddenField ID="HiddenField5" runat="server" />
    <asp:HiddenField ID="HiddenField6" runat="server" />
    <div style="display: none;">
        <div id="status">
        </div>
    </div>
    <asp:Literal ID="litTrigger" runat="server"></asp:Literal>
    <script type="text/javascript">

        $('.pageBody').css('padding', '0');
        $('body>div').css('background-color', '#efefef')
        //$('.tab-tc:last').removeClass("tab-tc");
       
    </script>
</asp:Content>
