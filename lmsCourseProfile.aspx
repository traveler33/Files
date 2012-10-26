<%@ Page Language="C#" MasterPageFile="~/Master/Main.Master" AutoEventWireup="true"
    CodeBehind="lmsCourseProfile.aspx.cs" Inherits="Pelesys.Scheduling.Web.Files.lmsCourseProfile" %>

<%@ MasterType VirtualPath="~/Master/Main.Master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script type="text/javascript">

        $(document).ready(function () {



            $("a.iframe").fancybox({
                'width': '60%',
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
    <style type="text/css">
        .fancybox-custom .fancybox-skin
        {
            box-shadow: 0 0 50px #222;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div id="Div1" class="TitlePanel">
        <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Height="420px"
            Width="100%" CssClass="gray">
            <asp:TabPanel HeaderText="Online Course Profile" Visible="true" runat="server" ID="dbstructure">
                <ContentTemplate>
                    <div style="visibility: visible; margin: 4px; padding-top: 6px;"   class="detailEdit" >
                        <table border="0" cellpadding="4" cellspacing="4" style="width: 100%; height: 100%;">
                            <tr>
                                <th align="left" >
                                    Course Name:
                                </th>
                                <td>
                                    <pel:SearchTextBox ID="txtLoginName" runat="server" Objective="userloginname" ValidationGroup="search"
                                        Width="78%" BackColor="LightGray" Enabled="false" />
                                </td>
                            </tr>
                            <tr>
                                <th align="left" >
                                    Course Code:
                                </th>
                                <td>
                                    <pel:SearchTextBox ID="SearchTextBox1" runat="server" Objective="userloginname" ValidationGroup="search"
                                        Width="78%" Enabled="false" />
                                </td>
                            </tr>
                            <tr>
                                <th style="vertical-align: top; " align="left">
                                    <asp:Label ID="lblDescription" runat="server" Text="Description:" />
                                </th>
                                <td class="editFieldControl">
                                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="3" onkeydown="CheckLength(this,3000,72)"
                                        onkeyup="CheckLength(this,3000,72)" Width="90%" MaxLength="3000" Enabled="false"></asp:TextBox>
                                    <%--<pel:ValidateTextBox ID="txtDescription" runat="server" Required="false" TextMode="MultiLine" />--%>
                                </td>
                            </tr>
                            <tr>
                                <th style="vertical-align: top;" align="left">
                                    <asp:Label ID="lblEffectiveDate" runat="server" Text="Effective Date:" />
                                </th>
                                <td class="editFieldControl" style="padding-top: 0px;">
                                    <pel:ValidateTextBox ID="ValidateTextBox2" runat="server" Required="true" MaxLength="25"
                                        Enabled="false" />
                                </td>
                            </tr>
                            <tr>
                                <th style="vertical-align: top; " align="left">
                                    <asp:Label ID="lblExpiryDate" runat="server" Text="Expiry Date:" />
                                </th>
                                <td class="editFieldControl" style="padding-top: 0px;">
                                    <pel:ValidateTextBox ID="ValidateTextBox1" runat="server" Required="true" MaxLength="25"
                                        Enabled="false" />
                                </td>
                            </tr>
                            <%--                                        <tr id="trIsPublished" runat="server">
                                            <th style="vertical-align: top;     font-size: 11px; font-weight: normal;"  align="left">
                                                <asp:Label ID="lblIsPublished" Text="Is Published:" runat="server" />
                                            </th>
                                            <td>
                                                <asp:CheckBox ID="CheckBox1" runat="server" />
                                            </td>
                                            
                                        </tr>--%>
                            <%--                                        <tr>
                                            <th style="vertical-align: top;   font-size: 11px; font-weight: normal;"  align="left">
                                                <asp:Label ID="lblCreator" runat="server" Text="Creator:" />
                                            </th>
                                            <td class="editFieldControl">
                                                <pel:ValidateTextBox ID="txtCreator" runat="server" Required="false" MaxLength="20" />
                                            </td>
                                            
                                        </tr>
                                        <tr>
                                            <th  style="vertical-align: top;     font-size: 11px; font-weight: normal;"  align="left">
                                                <asp:Label ID="lblSystem" runat="server" Text="System" />
                                            </th>
                                            <td class="editFieldControl">
                                                <pel:ValidateTextBox ID="txtSystem" runat="server" Required="false" MaxLength="20" />
                                            </td>
                                            
                                        </tr>
                                        <tr>
                                            <th style="vertical-align: top;   font-size: 11px; font-weight: normal;"  align="left">
                                                <asp:Label ID="lblCourseVersion" runat="server"   Text="Course Version:"/>
                                            </th>
                                            <td class="editFieldControl">
                                                <pel:ValidateTextBox ID="txtCourseVersion" runat="server" Required="false" MaxLength="20" />
                                            </td>
                                            
                                        </tr>--%>
                            <tr>
                                <th style="vertical-align: top; " align="left">
                                    <asp:Label ID="lblMaxTime" runat="server" Text="Max Time:" />
                                </th>
                                <td class="editFieldControl">
                                    <asp:TextBox ID="txtMaxTime" runat="server" MaxLength="20" Enabled="false" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtMaxTime"
                                        Display="Dynamic" ErrorMessage="*" ValidationExpression="^(([0-5]?\d?\d?\d?\d|6[0-4]\d\d\d|65[0-4]\d\d|655[0-2]\d|6553[0-5])):([0-5]?[0-9])(:([0-5]?[0-9]))?$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <th style="vertical-align: top;" align="left">
                                    <asp:Label ID="lblEstimateTime" runat="server" Text="Estimate Time" />
                                </th>
                                <td class="editFieldControl">
                                    <pel:ValidateTextBox ID="txtEstimateTime" runat="server" Required="false" MaxLength="50"
                                        Enabled="false" />
                                </td>
                            </tr>
                            <tr>
                                <th style="vertical-align: top; " align="left">
                                    <asp:Label ID="lblCompletion" runat="server" Text="Force Completion:" />
                                </th>
                                <td class="editFieldControl" style="padding-top: 0px;">
                                    <asp:TextBox ID="txtCompletion" runat="server" Enabled="false" />
                                </td>
                            </tr>
                            <%--                                        <tr>
                                            <th style="vertical-align: top;    font-size: 11px; font-weight: normal;"  align="left">
                                                <asp:Label ID="lblForcedCompletion" runat="server" Text="Is Forced Completion:" />
                                            </th>
                                            <td class="editFieldControl" style="padding-top: 0px;">
                                                 <asp:CheckBox ID="CheckBox2" runat="server" />
                                            </td>
                                             
                                        </tr>--%>

                             <tr  style="  height:30px; ">
                                    <td colspan ="2">
                                        <h3 style="width: 100%; height: 1px; background-color: lightgray;">
                                    </td>
                                </tr>
                            <tr>
                                <th valign="top" align="left" >
                                    Course Cost:
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox5" runat="server" Width="120px"></asp:TextBox>
                                </td>
                               
                            </tr>
                            <tr>
                                <th valign="top" align="left" >
                                    Cost Per Student:
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox6" runat="server" Width="120px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel HeaderText="Rules" Visible="true" runat="server" ID="relatedfiles">
                <ContentTemplate>
                    <asp:Panel ID="Panel3" runat="server">
                        <div style="visibility: visible; margin: 4px; padding-top: 6px;"  class="detailEdit">
                            <table border="0" cellpadding="4" cellspacing="4" style="width: 100%; height: 100%;">
                                <tr>
                                    <th valign="top" align="left" style="width: 150px; ">
                                        Prerequisite:
                                    </th>
                                    <td>
                                        <asp:TextBox ID="TextBox2" runat="server" MaxLength="20" Width="500px" Height="100px"
                                            TextMode="MultiLine" />
                                        <asp:Button ID="Button1" runat="server" Text="..."  CssClass="ShortButton" />
                                    </td>
                                </tr>
                                <%--                                 <tr>
                                    <th align="left" style=" width: 150px;  font-size: 11px; font-weight: normal; ">Course Length:<span class="required"></span></th>
                                    <td> 
                                        Days:  <asp:TextBox ID="TextBox1" runat="server" MaxLength="20" Width="100px" />Hour: <asp:DropDownList ID="DropDownList2" runat="server">
                                        </asp:DropDownList>  Minutes: 
                                        <asp:DropDownList ID="DropDownList1" runat="server">
                                        </asp:DropDownList> 
                                    </td>
                                
                                </tr>--%>
                                <tr>
                                    <th valign="top" align="left" style="width: 150px; ">
                                        Time Span:
                                    </th>
                                    <th style="font-size: 11px; font-weight: normal;">
                                        <asp:TextBox ID="TextBox9" runat="server" Width="200px"> </asp:TextBox>
                                        &nbsp; &nbsp; &nbsp; &nbsp; Time Unit Type:
                                        <asp:DropDownList ID="DropDownList4" runat="server" Width="100px">
                                        </asp:DropDownList>
                                    </th>
                                </tr>
                                <tr>
                                    <th align="left" style="width: 150px; ">
                                        Need Instructor:
                                    </th>
                                    <td>
                                        <asp:CheckBox ID="CheckBox4" runat="server" Checked="true" />
                                    </td>
                                </tr>
                                <%--                                <tr>
                                <th  valign="top" align="left" style="width: 150px; font-size: 11px; font-weight: normal;" >
                                     Pre Requisites:
                                </th>
                                <td   >
                                    <hr style="background-color: lightgary; width: 100%; height: 1px;" />
                                </td>
                            </tr>--%>
                                <tr>
                                    <th valign="top" align="left" style="width: 150px; ">
                                        Instructor Qualification:
                                    </th>
                                    <td valign="top">
                                        <asp:DropDownList ID="DropDownList3" runat="server" Width="500px" SkinID="eFormDropDownList">
                                        </asp:DropDownList>
                                        <asp:Button ID="Button2" runat="server" Text="Detail" SkinID="bntMiddle" />
                                    </td>
                                </tr>
                                <%--                                 <tr>
                                    <td valign="top" align="left" style="width: 150px; font-size: 11px; SkinID="bntMiddle"-weight: normal;">
                                        Student Qualificaton:
                                    </td>
                                    <td valign="top">
                                        <asp:DropDownList ID="DropDownList4" runat="server" Width="500px" SkinID="eFormDropDownList">
                                        </asp:DropDownList><asp:Button ID="Button12" runat="server" Text="Detail" SkinID="Eformbutton" />
                                    </td>
                                </tr>--%>
                            </table>
                        </div>
                    </asp:Panel>
                    <div style="visibility: visible; margin: 4px;">
                    </div>
                </ContentTemplate>
            </asp:TabPanel>
        </asp:TabContainer>
    </div>
    <div id="Div2" class="SaveCancelPanel" style="position: absolute; top: 458px; left: 1px; width:99%;" >
    <table border="0" cellpadding="2" cellspacing="2" style="width: 100%; height: 100%;">
        <tr>
            <td align="right">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="RightAdminPanel">
                            <table border="0" width="100%">
                                <tr>
                                    <td align="right">
                                      
                                        <asp:Button ID="bntSave" runat="server" Text="Save"  SkinID="bntMiddle" />
                                        <asp:Button ID="bntCancel" runat="server" Text="Cancel"  SkinID="bntMiddle" />
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
    <script type="text/javascript">

        $('.pageBody').css('padding', '0');
        $('body>div').css('background-color', '#efefef')
        //$('.tab-tc:last').removeClass("tab-tc");
       
    </script>
</asp:Content>
