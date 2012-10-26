<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master/Main.Master"
    CodeBehind="Curriculum.aspx.cs" Inherits="Pelesys.Scheduling.Web.Files.Curriculum" %>

<%@ MasterType VirtualPath="~/Master/Main.Master" %>
<%@ Register Src="../Control/ucResourceSelection.ascx" TagName="ucResourceSelection"
    TagPrefix="uc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div id="Div1" class="TitlePanel" style="border-top: solid 2px white; margin: 4px;
        padding: 4px; height: 470px; width: 99%; min-width: 1000px; overflow: auto">
        
        <table border="0" cellpadding="2" cellspacing="2" width="100%">
            <tr>
                <td>
                    <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Height="370px"
                        Width="100%" CssClass="gray">
                        <asp:TabPanel HeaderText="Profile" Visible="true" runat="server" ID="dbstructure">
                            <ContentTemplate>
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
                                                            Location:
                                                        </th>
                                                        <td style="font-size: 8px; font-weight: normal;">
                                                            <asp:TextBox ID="TextBox1" runat="server" Width="320px"></asp:TextBox>
                                                            <asp:Button ID="Button3" runat="server" Text="..." CssClass="ShortButton" />
                                                        </td>
                                                        <td style="width: 20px;">
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
                                                            Schdeule Time
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
                                                            Sum of Cost Per Student:
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
                                                        <th valign="top" align="left" style="width: 150px; font-size: 11px; font-weight: normal;">
                                                            Note:
                                                        </th>
                                                        <td>
                                                            <asp:TextBox ID="TextBox17" runat="server" TextMode="MultiLine" Width="350px" Height="60px"></asp:TextBox>&nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel HeaderText="Module" Visible="true" runat="server" ID="TabPanel3">
                            <ContentTemplate>
                                <div style="visibility: visible; margin: 4px; height: 370px; overflow: auto;" class="detailEdit">
                                    <table border="0" cellpadding="2" cellspacing="2">
                                        <tr>
                                            <td style="width: 320px;" valign="top">
                                                <table border="0" cellpadding="6" cellspacing="6">
                                                    <tr>
                                                        <th>
                                                            <asp:Label runat="server" Text="Course:"></asp:Label>
                                                            <asp:Button ID="Button15" runat="server" Text="+" CssClass="ShortButton" />
                                                            <asp:Button ID="Button16" runat="server" Text="-" CssClass="ShortButton" />
                                                            <asp:ImageButton ID="ImageButton2"  ImageUrl="~/Images/moveup.gif" runat="server"   />
                                                             <asp:ImageButton ID="ImageButton3"   ImageUrl="~/Images/movedown.gif" runat="server"  />
                                                        </th>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            <asp:ListBox ID="lstCourseList" runat="server" Width="300px" SkinID="eFormList" Style="height: 312px;">
                                                            </asp:ListBox>
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
                                                                            <asp:TextBox ID="TextBox12" runat="server" Width="140px"> </asp:TextBox>
                                                                            &nbsp; Time Unit:
                                                                            <asp:DropDownList ID="ddlTimeUnit1" runat="server" Width="80px">
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
                                                                                <asp:TextBox ID="TextBox22" runat="server" TextMode="MultiLine" Rows="8" onkeydown="CheckLength(this,3000,72)"
                                                                                    onkeyup="CheckLength(this,3000,72)" Width="300px" MaxLength="3000"></asp:TextBox>
                                                                                <%--<pel:ValidateTextBox ID="txtDescription" runat="server" Required="false" TextMode="MultiLine" />--%>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                </tr> </table>
                                                            </div>
                                                        </ContentTemplate>
                                                    </asp:TabPanel>
                                                    <asp:TabPanel HeaderText="Resource requirement" Visible="true" runat="server" ID="TabPanel5">
                                                        <ContentTemplate>
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
                                                        </ContentTemplate>
                                                    </asp:TabPanel>
                                                    <asp:TabPanel HeaderText="Instructor Qalification" Visible="true" runat="server"
                                                        ID="TabPanel6">
                                                        <ContentTemplate>
                                                            <div style="visibility: visible; margin: 4px; padding-top: 5px;" class="detailEdit">
                                                                <table border="0" cellpadding="6" cellspacing="8" style="width: 960px; height: 100%;">
                                                                    <tr>
                                                                        <th>
                                                                          
                                                                            <asp:Button ID="Button4" runat="server" Text="+" CssClass="ShortButton" />
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
                                                                                            <dx:GridViewDataHyperLinkColumn Caption="Qualification" VisibleIndex="4">
                                                                                                <DataItemTemplate>
                                                                                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text=" 5">
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
                                                        </ContentTemplate>
                                                    </asp:TabPanel>
                                                </asp:TabContainer>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel HeaderText="Module Plan" Visible="true" runat="server" ID="TabPanel1">
                            <ContentTemplate>
                                <div style="height: 370px; width: 100%; overflow: auto;" class="detailEdit">
                                    <table border="0" cellpadding="6" cellspacing="6" width="100%">
                                        <tr>
                                            <td>
                                                <table cellpadding="6" cellspacing="6" border="0" width="1280px" style="height: 280px">
                                                    <tr>
                                                        <th style="width: 150px;">
                                                            <asp:Label ID="Label1" runat="server" Text="Weeks:"></asp:Label>
                                                        </th>
                                                        <td>
                                                            <asp:DropDownList ID="ddlWeeks" runat="server" Width="300px">
                                                            </asp:DropDownList>
                                                            <asp:Button ID="Button2" runat="server" Text="Generating" SkinID="bntMiddle" />
                                                            <asp:Button ID="Button1233" runat="server" Text="Report" SkinID="bntMiddle" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th style="width: 150px;">
                                                            <asp:Label ID="Label2" runat="server" Text="Course Plan:"></asp:Label>
                                                        </th>
                                                        <td align="left">
                                                            <asp:Button ID="Button41" runat="server" Text="+" CssClass="ShortButton" />
                                                            <asp:Button ID="Button51" runat="server" Text="-" CssClass="ShortButton" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 150px;">
                                                        </td>
                                                        <td valign="top">
                                                            <div style="border: 1px solid lightgray; width: 1110px; height: 274px; overflow: auto;">
                                                                <dx:ASPxGridView ID="gvweek1" ClientInstanceName="grid" runat="server" KeyFieldName="SettingID"
                                                                    Border-BorderColor="LightGray" Border-BorderStyle="Solid" Border-BorderWidth="1"
                                                                    Font-Names="Verdana" Font-Size="10px" ForeColor="#342F2F" AutoGenerateColumns="False"
                                                                      OnHtmlRowPrepared="grid_HtmlRowCreated"
                                                                    Theme="Office2003Blue" EnableRowsCache="True" Width="100%" DataSourceForceStandardPaging="False"
                                                                    SettingsPager-AlwaysShowPager="True" SettingsPager-Position="Bottom">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="Day" VisibleIndex="1" Width="60px">
                                                                            <DataItemTemplate>
                                                                                <asp:Label ID="lblDay" runat="server" Text="1"></asp:Label>
                                                                            </DataItemTemplate>
                                                                            <CellStyle HorizontalAlign="Center">
                                                                            </CellStyle>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataComboBoxColumn Caption="Course" VisibleIndex="2">
                                                                            <DataItemTemplate>
                                                                                <asp:DropDownList ID="ddlcourses"   Width="350px"  runat="server">
                                                                                </asp:DropDownList>
                                                                               
                                                                            </DataItemTemplate>
                                                                        </dx:GridViewDataComboBoxColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Note" VisibleIndex="2" Width="180px">
                                                                            <DataItemTemplate>
                                                                                <asp:TextBox ID="TextBox2" runat="server" Width="350px"></asp:TextBox>
                                                                            </DataItemTemplate>
                                                                            <CellStyle HorizontalAlign="Center">
                                                                            </CellStyle>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Duration" VisibleIndex="3" Width="80px">
                                                                            <DataItemTemplate>
                                                                                <asp:Label ID="lblDuration" runat="server" Text="1"></asp:Label>
                                                                            </DataItemTemplate>
                                                                            <CellStyle HorizontalAlign="Center">
                                                                            </CellStyle>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                        </dx:GridViewDataTextColumn>
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
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel HeaderText="Schedule" Visible="true" runat="server" ID="TabPanel4">
                            <ContentTemplate>
                                <div style="visibility: visible; margin: 4px;" class="detailEdit">
                                    <table border="0" cellpadding="2" cellspacing="2" width="100%">
                                        <tr>
                                            <th>
                                                <table border="0" cellpadding="2" cellspacing="2" width="900px">
                                                    <tr>
                                                        <td style="width: 60px;">
                                                            From:
                                                        </td>
                                                        <td align="left" style="width: 180px;">
                                                            <pel:AdvancedCalendar ID="adcEffectiveDate" runat="server" IsRequired="false" Width="140px" />
                                                        </td>
                                                        <td style="width: 20px;">
                                                        </td>
                                                        <td style="width: 60px;">
                                                            To:
                                                        </td>
                                                        <td align="left" style="width: 180px;">
                                                            <pel:AdvancedCalendar ID="AdvancedCalendar1" runat="server" IsRequired="false" Width="140px" />
                                                        </td>
                                                        <td style="width: 180px;">
                                                            <asp:Button ID="Button17" runat="server" Text="Generating" SkinID="bntMiddle" />
                                                            <asp:Button ID="Button18" runat="server" Text="Report" SkinID="bntMiddle" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </th>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <div id="scheduler_here" style='width: 99%; height: 330px; border: 1px solid lightgray;
                                                    overflow: auto;'>
                                                    <dx:ASPxScheduler ID="ASPxScheduler1" runat="server" Width="99%" ActiveViewType="WorkWeek"
                                                        GroupType="Resource" Start="2012-07-13" Theme="Office2003Blue">
                                                        <Views>
                                                            <DayView ResourcesPerPage="2">
                                                                <TimeRulers>
                                                                    <dx:TimeRuler />
                                                                </TimeRulers>
                                                                <DayViewStyles ScrollAreaHeight="240px" />
                                                            </DayView>
                                                            <WorkWeekView ResourcesPerPage="2">
                                                                <TimeRulers>
                                                                    <dx:TimeRuler />
                                                                </TimeRulers>
                                                                <WorkWeekViewStyles ScrollAreaHeight="240px">
                                                                </WorkWeekViewStyles>
                                                            </WorkWeekView>
                                                            <WeekView ResourcesPerPage="2">
                                                                <WeekViewStyles>
                                                                    <DateCellBody Height="150px" />
                                                                </WeekViewStyles>
                                                            </WeekView>
                                                            <MonthView ResourcesPerPage="2">
                                                                <MonthViewStyles>
                                                                    <DateCellBody Height="100px" />
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
                    <div id="Div2" class="SaveCancelPanel" style="width: 99.5%;">
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

        <a id="Resource" href="#ResourceTypeProfile" title="Add Resources" style="display: none;">
        Inline</a>
    <asp:HiddenField ID="hidControlList" runat="server" />
    <asp:HiddenField ID="hidLabelList" runat="server" />
    <div style="display: none;">
        <div id="ResourceTypeProfile" style="width: 770px; height: 520px;">
            <uc2:ucResourceSelection ID="ucResourceSelectione1" runat="server" />
        </div>
    </div>
    <script type="text/javascript">

        $('.pageBody').css('padding', '0');
        $('body>div').css('background-color', '#efefef')
        //$('.tab-tc:last').removeClass("tab-tc");
       
    </script>
</asp:Content>
