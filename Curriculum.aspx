<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master/Main.Master"
    CodeBehind="Curriculum.aspx.cs" Inherits="Pelesys.Scheduling.Web.Files.Curriculum" %>

<%@ MasterType VirtualPath="~/Master/Main.Master" %>
<%@ Register Src="../Control/ucResourceSelection.ascx" TagName="ucResourceSelection"
    TagPrefix="uc2" %>
<%@ Register Src="../Control/ucSelectCourse.ascx" TagName="uccourseSelection" TagPrefix="uc3" %>
<%@ Register Src="../Control/ucInstructors.ascx" TagName="ucInstructorSelection" TagPrefix="uc4" %>
<%@ Register Assembly="DevExpress.Web.v12.1, Version=12.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeView" TagPrefix="dx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:content id="Content1" contentplaceholderid="Head" runat="server">
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
	       
	        $("#CourseSelection").fancybox({
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




    function TriggerCourseList() 
    {  

        $('#CourseSelection').trigger('click');
      //  window.setTimeout('parent.$.fancybox.close();', 2500);  StudentList
       
       
    }


    </script>
    <script type="text/javascript">

        $(document).ready(function () {



            $("a.iframe").fancybox({
                'width': '90%',
                'height': '90%',
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
  <script type="text/javascript">
	    $(document).ready(function () {
	       
	        $("#Course").fancybox({
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




    function TriggerCourse() 
    {  

        $('#Course').trigger('click');
      //  window.setTimeout('parent.$.fancybox.close();', 2500);  StudentList
       
       
    }

     function IsEditMode(IsShow) {

            if (IsShow) {
                $('#EditMode').hide();
                $('#EditGrid').hide();
                $('#PreviewMode').show();
                $('#CalendarView').show();

            }
            else {
                $('#EditMode').show();
                 $('#CalendarView').hide();
                $('#PreviewMode').hide();
                 $('#EditGrid').show();
            }


        }
    </script>

</asp:content>
<asp:content id="Content2" contentplaceholderid="Content" runat="server">
    <div id="Div1" class="TitlePanel" style="border-top: solid 2px white; margin: 4px;
        padding: 4px; height: 470px; width: 99%; min-width: 1000px; overflow: auto">
        <table border="0" cellpadding="2" cellspacing="2" width="100%">
            <tr>
                <td>
                    <asp:tabcontainer id="TabContainer1" runat="server" activetabindex="0" height="370px"
                        width="100%" cssclass="gray">
                        <asp:tabpanel headertext="Profile" visible="true" runat="server" id="dbstructure">
                            <contenttemplate>
                                <div class="detailEdit" style="visibility: visible; margin: 4px; padding-top: 6px;
                                    width: 98%;">
                                    <table border="0" cellpadding="5" cellspacing="4" style="width: 1280px; height: 100%;">
                                        <tr>
                                            <td>
                                                <table border="0" cellpadding="6" cellspacing="6" style="width: 90%; height: 100%;">
                                                    <tr>
                                                        <th align="left">
                                                            Curriculum Name:<span class="required"></span>
                                                        </th>
                                                        <td>
                                                            <pel:SearchTextBox ID="SearchTextBox1" runat="server" Width="350px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th align="left">
                                                            Curriculum Code:<span class="required"></span>
                                                        </th>
                                                        <td>
                                                            <pel:SearchTextBox ID="SearchTextBox2" runat="server" Width="350px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th valign="top" align="left">
                                                            Set Display Color: <span class="required"></span>
                                                        </th>
                                                        <td>
                                                            <asp:TextBox ID="TextBox3" runat="server" Width="330px"></asp:TextBox>
                                                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/cp_button.png" />
                                                            <asp:ColorPickerExtender ID="ColorPickerExtender2" runat="server" TargetControlID="TextBox3"
                                                                PopupButtonID="ImageButton1">
                                                            </asp:ColorPickerExtender>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th align="left">
                                                            Version:
                                                        </th>
                                                        <td>
                                                            <asp:TextBox ID="TextBox21" runat="server" Width="350px" BackColor="#efefef"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                  
                                                    <tr>
                                                        <th valign="top" align="left">
                                                            Objective:
                                                        </th>
                                                        <td>
                                                            <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine" Width="350px" Height="40px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                 
                                                  
                                                      <tr>
                                                        <th valign="top" align="left">
                                                            Schdeule 
                                                        </th>
                                                        <td valign="bottom">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td valign="bottom" colspan="2" style="height: 20px;">
                                                            <hr style="width: 100%; height: 1px; background-color: #F7F3F3;" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th valign="top" align="left">
                                                            Time Span:
                                                        </th>
                                                        <th>
                                                            <asp:TextBox ID="TextBox7" runat="server" Width="175px"></asp:TextBox>
                                                            Time Unit:
                                                            <asp:DropDownList ID="ddlTimeUnit" runat="server" Width="100px">
                                                            </asp:DropDownList>
                                                        </th>
                                                    </tr>
                                                    <tr>
                                                        <th valign="top" align="left">
                                                            Schedule Days:
                                                        </th>
                                                        <th style="font-size: 11px; font-weight: normal;">
                                                            <asp:CheckBox ID="CheckBox12" runat="server" Text="Monday" Checked="true" />&nbsp;&nbsp;
                                                            <asp:CheckBox ID="CheckBox13" runat="server" Text="Tuesday" Checked="true" />&nbsp;&nbsp;
                                                            <asp:CheckBox ID="CheckBox14" runat="server" Text="Wednesday" Checked="true" />&nbsp;&nbsp;
                                                            <asp:CheckBox ID="CheckBox15" runat="server" Text="Thursday" Checked="true" />&nbsp;&nbsp;
                                                            <asp:CheckBox ID="CheckBox16" runat="server" Text="Friday" Checked="true" />&nbsp;&nbsp;
                                                        </th>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                        </th>
                                                        <th>
                                                            <asp:CheckBox ID="CheckBox17" runat="server" Text="Saturday" />
                                                            <asp:CheckBox ID="CheckBox18" runat="server" Text="Sunday" />
                                                        </th>
                                                    </tr>
                                                    <tr>
                                                        <th align="left">
                                                            Business Hours:
                                                        </th>
                                                        <th style="font-size: 11px; font-weight: normal;">
                                                            Start Time:
                                                            <asp:TextBox ID="TextBox11" runat="server" MaxLength="20" Width="105px" />&nbsp;End
                                                            Time:
                                                            <asp:TextBox ID="TextBox14" runat="server" MaxLength="20" Width="105px" />
                                                        </th>
                                                    </tr>
                                                    <tr>
                                                        <th valign="top" align="left">
                                                            Lunch Period:
                                                        </th>
                                                        <th align="left">
                                                            Start Time:
                                                            <asp:TextBox ID="TextBox13" runat="server" MaxLength="20" Width="105px" />&nbsp;End
                                                            Time:
                                                            <asp:TextBox ID="TextBox30" runat="server" MaxLength="20" Width="105px" />
                                                        </th>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="width: 20px;">
                                            </td>
                                            <td>
                                                <table border="0" cellpadding="6" cellspacing="6" style="width: 100%; height: 100%;">
                                                  <tr>
                                                        <th valign="top" align="left">
                                                            Curriculum Cost
                                                        </th>
                                                        <td style="font-size: 11px; font-weight: normal;">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td valign="bottom" colspan="2" style="height: 20px;">
                                                            <hr style="width: 100%; height: 1px; background-color: #F7F3F3;" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th valign="top" align="left">
                                                            Sum of All Course Cost:
                                                        </th>
                                                        <td style="font-size: 11px; font-weight: normal;">
                                                            <asp:TextBox ID="TextBox5" runat="server" Width="350px" BackColor="#efefef"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th valign="top" align="left">
                                                            Per Student Fee:
                                                        </th>
                                                        <td style="font-size: 8px; font-weight: normal;">
                                                            <asp:TextBox ID="TextBox6" runat="server" Width="350px" BackColor="#efefef"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th valign="top" align="left">
                                                            Student Qualification
                                                        </th>
                                                        <td valign="top">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td valign="bottom" colspan="2" style="height: 20px;">
                                                            <hr style="width: 100%; height: 1px; background-color: #F7F3F3;" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th valign="top" align="left">
                                                            Max Students:
                                                        </th>
                                                        <td valign="top">
                                                            <asp:TextBox ID="TextBox15" runat="server" Width="350px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th valign="top" align="left" style="width: 150px; font-size: 11px; font-weight: normal;">
                                                            Qualification Description:
                                                        </th>
                                                        <td>
                                                            <asp:TextBox ID="TextBox18" runat="server" TextMode="MultiLine" Width="350px" Height="40px"></asp:TextBox>&nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th valign="top" align="left" style="width: 150px; font-size: 11px; font-weight: normal;">
                                                            Evaluation Methods:
                                                        </th>
                                                        <td>
                                                            <%--                                    <asp:TextBox ID="TextBox7" runat="server" TextMode="MultiLine" Width="98%" Height="60px"></asp:TextBox>--%>
                                                            <pel:SearchTextBox ID="SearchTextBox8" runat="server" Objective="userloginname" ValidationGroup="search"
                                                                Width="350px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th align="left" style="width: 150px; font-size: 11px; font-weight: normal;">
                                                            Certification Number:
                                                        </th>
                                                        <td>
                                                            <pel:SearchTextBox ID="SearchTextBox9" runat="server" Objective="userloginname" ValidationGroup="search"
                                                                Width="350px" />
                                                        </td>
                                                    </tr>
                                                     <tr>
                                                        <th align="left" style="width: 150px; font-size: 11px; font-weight: normal;">
                                                            Create Certificationr:
                                                        </th>
                                                        <td>
                                                            <pel:SearchTextBox ID="txtCreateCertificate" runat="server" Objective="userloginname" ValidationGroup="search"
                                                                Width="274px" />    <asp:Button ID="Button1" runat="server" Text="Browse..." SkinID="bntMiddle" />
                                                        </td>
                                                    </tr>
                                                       <tr>
                                                        <th valign="top" align="left" style="width: 150px; font-size: 11px; font-weight: normal;">
                                                            Note:
                                                        </th>
                                                        <td>
                                                            <asp:TextBox ID="TextBox17" runat="server" TextMode="MultiLine" Width="350px" Height="50px"></asp:TextBox>&nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </contenttemplate>
                        </asp:tabpanel>
                        <asp:tabpanel headertext="Module" visible="true" runat="server" id="TabPanel3">
                            <contenttemplate>
                                <div style="visibility: visible; margin: 4px; height: 370px; overflow: auto;" class="detailEdit">
                                    <table border="0" cellpadding="2" cellspacing="2">
                                        <tr>
                                            <td style="width: 350px;" valign="top">
                                                <table border="0" cellpadding="6" cellspacing="6">
                                                    <tr>
                                                        <th>
                                                            <asp:Label runat="server" Text="Course:"></asp:Label>
                                                            <asp:Button ID="Button15" runat="server" Text="+" CssClass="ShortButton"  OnClientClick="TriggerCourse()  ; return false;" />
                                                            <asp:Button ID="Button16" runat="server" Text="-" CssClass="ShortButton" />
                                                            <asp:ImageButton ID="ImageButton2"  ImageUrl="~/Images/moveup.gif" runat="server"   />
                                                             <asp:ImageButton ID="ImageButton3"   ImageUrl="~/Images/movedown.gif" runat="server"  />
                                                        </th>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            <div style ="  width:312px; height:310px; border: 1px solid lightgray; overflow:auto;     ">
                                                              <dx:ASPxTreeView ID="ASPxTreeView1" runat="server" ClientInstanceName="ASPxTreeView1"
                                                                    AllowSelectNode="true" EnableClientSideAPI="True" EnableCallBacks="True" 
                                                                     Width = "312px"  Height = "310px"   ShowTreeLines = "false" ShowExpandButtons = "true" 
                                                                        Font-Size="10px" 
                                                                      >
                                                                  
                                                                    <Nodes>
                                                                        <dx:TreeViewNode Name="RootNode" Text="Airbus 320 Introduction"    Image-Url = "~/images/computer.gif">
                                                                         </dx:TreeViewNode> 
                                                                                <dx:TreeViewNode Text="Airbus 320 Control"    Image-Url = "~/images/computer.gif">
                                                                                 </dx:TreeViewNode> 
                                                                                        <dx:TreeViewNode
                                                                                          Image-Url = "~/images/computer.gif"
                                                                                         Name="UsersNode" Text="Airbus 320 Landing">
                                                                                          </dx:TreeViewNode>
                                                                                                <dx:TreeViewNode Text="Airbus 320 Taking Off"    Image-Url = "~/images/computer.gif">
                                                                                                </dx:TreeViewNode>
                                                                                                <dx:TreeViewNode Text="Airbus 320 Supply"    Image-Url = "~/images/computer.gif">
                                                                                                </dx:TreeViewNode>
                                                                                                <dx:TreeViewNode Text="Airbus 320 Summary"    Image-Url = "~/images/computer.gif">
                                                                                                </dx:TreeViewNode>
                                                                                           
                                                                                     
                                                                          
                                                                                <dx:TreeViewNode Text="New York Airport"   Image-Url = "~/images/sml_script.png">
                                                                               </dx:TreeViewNode>
                                                                                        <dx:TreeViewNode Name="UsersNode" Text="Airbus 320 Location"    Image-Url = "~/images/sml_script.png">
                                                                                        </dx:TreeViewNode>
                                                                                                <dx:TreeViewNode Text="Airbus 320 Service Management"   Image-Url = "~/images/sml_script.png">
                                                                                                </dx:TreeViewNode>
                                                                                        <dx:TreeViewNode Text="Airbus 320 Security"    Image-Url = "~/images/sml_script.png">
                                                                                        </dx:TreeViewNode>
                                                                                      
                                                                            
                                                                                       
                                                                    </Nodes>
                                                                </dx:ASPxTreeView>
                                                            </div>
                                                        </th>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <asp:TabContainer ID="TabContainer2" runat="server" ActiveTabIndex="0" Height="320px"
                                                    Width="100%" CssClass="gray">
                                                    <asp:TabPanel HeaderText="Course Profile" Visible="true" runat="server" ID="TabPanel2">
                                                        <ContentTemplate>
                                                            <div style="visibility: visible; margin: 4px; padding-top: 8px; width: 960px;" class="detailEdit">
                                                                <table border="0" cellpadding="6" cellspacing="6" width="950px">
                                                                    <tr>
                                                                        <td>
                                                                            <table border="0" cellpadding="4" cellspacing="4" style="height: 100%;">
                                                                                <tr>
                                                                                    <th align="left" style="width: 150px;">
                                                                                        Course Name:<span class="required"></span>
                                                                                    </th>
                                                                                    <td>
                                                                                        <pel:SearchTextBox ID="txtLoginName" runat="server" Width="300px" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <th align="left">
                                                                                        Course Code:<span class="required"></span>
                                                                                    </th>
                                                                                    <td>
                                                                                        <pel:SearchTextBox ID="SearchTextBox5" runat="server" Width="300px" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <th valign="top" align="left">
                                                                                        Course Cost:
                                                                                    </th>
                                                                                    <td>
                                                                                        <asp:TextBox ID="TextBox8" runat="server" Width="300px"></asp:TextBox>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                        </td>
                                                                        <th valign="top" align="left">
                                                                            Cost Per Student:
                                                                        </th>
                                                                        <td>
                                                                            <asp:TextBox ID="TextBox9" runat="server" Width="300px"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th align="left" valign="top">
                                                                            Prerequisite:<asp:Button ID="Button19" runat="server" Text="..." CssClass="ShortButton" />
                                                                        </th>
                                                                        <td>
                                                                            <asp:TextBox ID="TextBox10" runat="server" Width="300px" Height="100px" TextMode="MultiLine" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th valign="top" align="left">
                                                                            Time Span:
                                                                        </th>
                                                                        <th>
                                                                            <asp:TextBox ID="TextBox12" runat="server" Width="110px"> </asp:TextBox>
                                                                            &nbsp; Time Unit:
                                                                            <asp:DropDownList ID="ddlTimeUnit1" runat="server" Width="100px">
                                                                            </asp:DropDownList>
                                                                        </th>
                                                                    </tr>
                                                                </table>
                                                                </td>
                                                                <td style="width: 20px;">
                                                                </td>
                                                                <td>
                                                                    <table border="0" cellpadding="4" cellspacing="4" style="height: 100%;">
                                                                        <tr>
                                                                            <th valign="top" align="left">
                                                                                Instructor Qualification:
                                                                            </th>
                                                                            <td valign="top">
                                                                                <asp:TextBox ID="TextBox19" runat="server" Width="300px" Height="100px" TextMode="MultiLine" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th align="left">
                                                                                <asp:Label ID="Label5" runat="server" Text="Description:" />
                                                                            </th>
                                                                            <td class="editFieldControl" colspan="4">
                                                                                <asp:TextBox ID="TextBox22" runat="server" TextMode="MultiLine" Rows="5" onkeydown="CheckLength(this,3000,72)"
                                                                                    onkeyup="CheckLength(this,3000,72)" Width="300px" MaxLength="3000"></asp:TextBox>
                                                                                <%--<pel:ValidateTextBox ID="txtDescription" runat="server" Required="false" TextMode="MultiLine" />--%>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                </tr> </table>
                                                            </div>
                                                        </contenttemplate>
                                                    </asp:tabpanel>
                                                    <asp:tabpanel headertext="Resource requirement" visible="true" runat="server" id="TabPanel5">
                                                        <contenttemplate>
                                                            <div style="visibility: visible; margin: 4px; padding-top: 8px;" class="detailEdit">
                                                                <table border="0" cellpadding="6" cellspacing="8" style="width: 960px; height: 100%;">
                                                                    <tr>
                                                                        <th>
                                                                   
                                                                          
                                                                            <asp:Button ID="Button6" runat="server" Text="+" CssClass="ShortButton"  OnClientClick="TriggerResource(); return false;" />
                                                                            <asp:Button ID="Button7" runat="server" Text="-" CssClass="ShortButton" />
                                                                        </th>
                                                                    </tr>
                                                                        
                                                                    
                                                                    <tr>
                                                                       
                                                                        <td valign="top">
                                                                            <div style="width: 700px; height: 256px; border: 1px solid lightgray; background-color: #fff;">
                                                                                <dx:ASPxGridView ID="gv" ClientInstanceName="grid" runat="server" KeyFieldName="ResourcePoolID"
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
                                                                                        <dx:GridViewDataColumn FieldName="Name" VisibleIndex="1" Caption="Resource Pool" SortOrder="Ascending" />
                                                                                        <dx:GridViewDataTextColumn Caption="Quantity" VisibleIndex="3" Width="80px">
                                                                                            <DataItemTemplate>
                                                                                                <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="70px" Text="2">
                                                                                                </dx:ASPxTextBox>
                                                                                            </DataItemTemplate>
                                                                                            <CellStyle HorizontalAlign="Center">
                                                                                            </CellStyle>
                                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                                        </dx:GridViewDataTextColumn>
                                                                                    </Columns>
                                                                                    <Settings ShowGroupPanel="False" />
                                                                                    <SettingsBehavior AllowFocusedRow="false" />
                                                                                    <Settings GridLines="Vertical" />
                                                                                    <Styles>
                                                                                        <AlternatingRow Enabled="true" />
                                                                                    </Styles>
                                                                                    <SettingsPager PageSize="10">
                                                                                        <PageSizeItemSettings Visible="true" ShowAllItem="true" />
                                                                                    </SettingsPager>
                                                                                </dx:ASPxGridView>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </contenttemplate>
                                                    </asp:tabpanel>
                                                    <asp:tabpanel headertext="Instructor Qalification" visible="true" runat="server"
                                                        id="TabPanel6">
                                                        <contenttemplate>
                                                            <div style="visibility: visible; margin: 4px; padding-top: 5px;" class="detailEdit">
                                                                <table border="0" cellpadding="6" cellspacing="8" style="width: 960px; height: 100%;">
                                                                    <tr>
                                                                        <th>
                                                                          
                                                                            <asp:Button ID="Button4" runat="server" Text="+" CssClass="ShortButton" onclientclick=" TriggerCourseList() ; return false; " />
                                                                            <asp:Button ID="Button5" runat="server" Text="-" CssClass="ShortButton" />
                                                                        </th>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 270px" valign="top">
                                                                            <div style="height: 260px; width: 800px; border: 1px lightgray solid; overflow: auto;">
                                                                                <div class="resultGridView">
                                                                                    <dx:ASPxGridView ID="GridView4" ClientInstanceName="grid" runat="server" KeyFieldName="UserID"
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
                                                                                            <dx:GridViewDataHyperLinkColumn Caption="Location" VisibleIndex="2">
                                                                                                <DataItemTemplate>
                                                                                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text=" Airbus 322">
                                                                                                    </dx:ASPxLabel>
                                                                                                </DataItemTemplate>
                                                                                            </dx:GridViewDataHyperLinkColumn>
                                                                                            <dx:GridViewDataHyperLinkColumn Caption="Job Role" VisibleIndex="3">
                                                                                                <DataItemTemplate>
                                                                                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Job Role">
                                                                                                    </dx:ASPxLabel>
                                                                                                </DataItemTemplate>
                                                                                            </dx:GridViewDataHyperLinkColumn>
                                                                                            <dx:GridViewDataHyperLinkColumn Caption="Qualification" VisibleIndex="4"   Width="120px" >
                                                                                                <DataItemTemplate   >
                                                                                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text=" " BackColor="Green" Width="20px" Height="20px"    >
                                                                                                    </dx:ASPxLabel>
                                                                                                  
                                                                                                </DataItemTemplate>
                                                                                                 <HeaderStyle HorizontalAlign="Center" />
                                                                                                   <CellStyle HorizontalAlign="Center" />
                                                                                            </dx:GridViewDataHyperLinkColumn>
                                                                                            <dx:GridViewDataImageColumn Caption="Detail" VisibleIndex="5">
                                                                                                <DataItemTemplate>
                                                                                                    <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/Images/sml_script.Png">
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
                                                                                            <PageSizeItemSettings Visible="true" ShowAllItem="true" />
                                                                                        </SettingsPager>
                                                                                    </dx:ASPxGridView>
                                                                                </div>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </contenttemplate>
                                                    </asp:tabpanel>
                                                </asp:tabcontainer>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:tabpanel headertext="Module Plan" visible="true" runat="server" id="TabPanel1">
                            <contenttemplate>
                                <div style="height: 370px; width: 100%; overflow: auto;" class="detailEdit">
                                    <table border="0" cellpadding="6" cellspacing="6" width="100%">
                                        <tr>
                                            <td>
                                                <table cellpadding="6" cellspacing="6" border="0" width="1380px" style="height: 310px"   >
                                                    <tr>
                                                        <th style="width: 250px;">
                                                           <asp:Button ID="bntGenerate" runat="server" Text="Generate" SkinID="bntMiddle" />
                                                             <asp:Button ID="bntAddWeek" runat="server" Text="+" CssClass="ShortButton" />
                                                            <asp:Button ID="bntRemoveWeek" runat="server" Text="-" CssClass="ShortButton" />
                                                            <asp:ImageButton ID="bntUP"  ImageUrl="~/Images/moveup.gif" runat="server"   />
                                                             <asp:ImageButton ID="bntDOWN"   ImageUrl="~/Images/movedown.gif" runat="server"  />
                                                        </th>
                                                        <th>
                                                            <div id="EditMode">
                                                            <asp:Button ID="Button41" runat="server" Text="+" CssClass="ShortButton" />
                                                            <asp:Button ID="Button51" runat="server" Text="-" CssClass="ShortButton" /> 
                                                           
                                                            <asp:Label runat="server" Text="Add or remove module"></asp:Label>
                                                            <asp:Button ID="bntReport" runat="server" Text="Report" SkinID="bntMiddle" />
                                                            <asp:Button ID="bntPreview" runat="server" Text="Preview Weekly Plan" cssclass="lButton"  onClientClick="IsEditMode(true); return false;"  />
                                                            </div>
                                                            <div id="PreviewMode" style=" display:none;">
                                                                 <asp:Button ID="bntBack" runat="server" Text="Back to Edit View" cssclass="lButton" onClientClick="IsEditMode(false); return false;" />
                                                            </div>
                                                        </th>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 250px;">
                                                             <dx:ASPxTreeView ID="ASPxTreeView2" runat="server" ClientInstanceName="ASPxTreeView1"
                                                                    AllowSelectNode="true" EnableClientSideAPI="True" EnableCallBacks="True"  Border-BorderColor="lightgray"
                                                                     Border-BorderStyle="Solid" Border-BorderWidth="1px"
                                                                     Width = "240px"  Height = "311px"   ShowTreeLines = "false" ShowExpandButtons = "true" 
                                                                        Font-Size="10px" 
                                                                      >
                                                                  
                                                                    <Nodes>
                                                                        <dx:TreeViewNode Name="rw1" Text="Week 1" >
                                                                           </dx:TreeViewNode> 
                                                                         <dx:TreeViewNode Name="rw2" Text="Week 2" >
                                                                            </dx:TreeViewNode> 
                                                                          <dx:TreeViewNode Name="rw3" Text="Week 3" >
                                                                             </dx:TreeViewNode> 
                                                                           <dx:TreeViewNode Name="rw4" Text="Week 4" >
                                                                              </dx:TreeViewNode> 
                                                                            <dx:TreeViewNode Name="rw5" Text="Week 5" >
                                                                               </dx:TreeViewNode> 
                                                                             <dx:TreeViewNode Name="rw6" Text="Week 6" >
                                                                                </dx:TreeViewNode> 
                                                                    </Nodes>
                                                                </dx:ASPxTreeView>
                                                        </td>
                                                        <td valign="top">
                                                            <div id="EditGrid" style="border: 1px solid lightgray; width: 1110px; height: 304px; overflow: auto;">
                                                                <dx:ASPxGridView ID="gvweek1" ClientInstanceName="grid" runat="server" KeyFieldName="SettingID"
                                                                    Border-BorderColor="LightGray" Border-BorderStyle="Solid" Border-BorderWidth="1"
                                                                    Font-Names="Verdana" Font-Size="10px" ForeColor="#342F2F" AutoGenerateColumns="False"
                                                                      OnHtmlRowPrepared="grid_HtmlRowCreated"
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
                                                                                <asp:Label ID="lblDay" runat="server" Text="1"></asp:Label>
                                                                            </DataItemTemplate>
                                                                            <CellStyle HorizontalAlign="Center">
                                                                            </CellStyle>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataComboBoxColumn Caption="Module" VisibleIndex="2">
                                                                            <DataItemTemplate>
                                                                                <asp:DropDownList ID="ddlcourses"   Width="350px"  runat="server">
                                                                                </asp:DropDownList>
                                                                               
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
                                                                         <dx:GridViewDataTextColumn Caption="Duration" VisibleIndex="6" Width="80px">
                                                                            <DataItemTemplate>
                                                                                <asp:Label ID="lblDuration" runat="server" Text="1"></asp:Label>
                                                                            </DataItemTemplate>
                                                                            <CellStyle HorizontalAlign="Center">
                                                                            </CellStyle>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                        </dx:GridViewDataTextColumn>
                                                                         <dx:GridViewDataTextColumn Caption="Note" VisibleIndex="7" Width="180px">
                                                                            <DataItemTemplate>
                                                                                <asp:TextBox ID="TextBox2" runat="server" Width="300px"></asp:TextBox>
                                                                            </DataItemTemplate>
                                                                            <CellStyle HorizontalAlign="Center">
                                                                            </CellStyle>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                    <Settings ShowGroupPanel="False" />
                                                                    <SettingsBehavior AllowFocusedRow="true" />
                                                                    <Settings GridLines="Vertical" />
                                                                    <Styles>
                                                                        <AlternatingRow Enabled="True" />
                                                                    </Styles>
                                                                    <SettingsPager PageSize="20">
                                                                        <PageSizeItemSettings Visible="true" ShowAllItem="true" />
                                                                    </SettingsPager>
                                                                </dx:ASPxGridView>
                                                            </div>
                                                             <div id="CalendarView" style=" display:none; border: 1px solid lightgray; width: 1210px; height: 314px; overflow: auto;">
                                                               <dx:ASPxScheduler ID="ASPxScheduler1" runat="server" Width="100%" ActiveViewType="WorkWeek"   
                                                               OptionsBehavior-ShowViewNavigator ="false"  
                                                                OptionsBehavior-ShowTimeMarker = "false"
                                                                 Theme="Office2010Black"      Start="2010-07-13" ClientInstanceName="ASPxClientScheduler1">
                                                                <Views>
                                                                    <DayView Enabled="False">
                                                                        <TimeRulers>
                                                                            <dx:TimeRuler />
                                                                        </TimeRulers>
                                                                    </DayView>
                                                                    <WorkWeekView    WorkTime-Start="07:00:00" WorkTime-End="20:00:00"  ShowWorkTimeOnly="true" ShowDayHeaders="true" NavigationButtonVisibility="Never"  ShowFullWeek="true" >
                                                                        <TimeRulers>
                                                                        <dx:TimeRuler />
                                                                        </TimeRulers>
                                                                          <Templates>
                                                                            <DateHeaderTemplate>
                                                                                <table>
                                                                                    <tr>
                                                                                        <td align="left">
                                                                                            <b>
                                                                                               
                                                                                        </td>
                                                                                        <td style="width: 100%; text-align: center;">
                                                                                            <%# System.Globalization.CultureInfo.CurrentCulture.DateTimeFormat.GetDayName(Container.Interval.Start.DayOfWeek) %>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </DateHeaderTemplate>
                                                                        </Templates>
                                                                    </WorkWeekView>
                                                                    <WeekView Enabled="False" />
                                                                    <MonthView Enabled="False" />
                                                                    <TimelineView Enabled="False" />
                                                                </Views>
                                                                <OptionsBehavior ShowViewSelector="False" />
                                                                <Storage EnableReminders="false" />
                                                            </dx:ASPxScheduler>
                                                                  
                                                                    
                                                             </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </contenttemplate>
                        </asp:tabpanel>
                 
                    </asp:TabContainer>
                </td>
            </tr>
            <tr style="height: 10px;">
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="Div2" class="SaveCancelPanel" style="width: 99.5%;">
                        <table border="0" cellpadding="2" cellspacing="2" style="width: 100%; height: 100%;">
                            <tr>
                                <td align="right">
                                    <asp:updatepanel id="UpdatePanel1" runat="server">
                                        <contenttemplate>
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

   <a id="Resource" href="#ResourceTypeProfile" title="Add Resources" style="display: none;">
       Inline</a>
    <asp:hiddenfield id="hidControlList" runat="server" />
    <asp:hiddenfield id="hidLabelList" runat="server" />
    <div style="display: none;">
        <div id="ResourceTypeProfile" style="width: 770px; height: 520px;">
            
              <uc2:ucResourceSelection ID="ucResourceSelectione1" runat="server" />
        </div>
    </div>

    <a id="CourseSelection" href="#CourseList" title="Add Instructors" style="display: none;">
        Inline</a>
    
    <div style="display: none;">
        <div id="CourseList" style="width: 710px; height: 580px;">
           <uc4:ucInstructorSelection ID="adducInstructorSelection" runat="server" />
        </div>
    </div>


     <a id="Course" href="#GetCourse" title="Add Course" style="display: none;">
        Inline</a>
    
    <div style="display: none;">
        <div id="GetCourse" style="width: 770px; height: 520px;">
         <uc3:uccourseSelection ID="ucCourseSelection2" runat="server" />
        </div>
    </div>






    <script type="text/javascript">

        $('.pageBody').css('padding', '0');
        $('body>div').css('background-color', '#efefef')
        //$('.tab-tc:last').removeClass("tab-tc");
       
    </script>
</asp:content>
