<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CurriculumView.aspx.cs"
MasterPageFile="~/Master/Main.Master"
 Inherits="Pelesys.Scheduling.Web.Files.CurriculumView" %>


<%@ MasterType VirtualPath="~/Master/Main.Master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

 
 
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">


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
<br />
<div style="  padding:12px;  ">
 <div id="Div2" class="SaveCancelPanel" style=" padding:4px;  width:98%;">
        <table border="0" cellpadding="2" cellspacing="2" style="width: 100%; height: 100%;">
            <tr>
                <td  style="  width: 120px;    ">
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                   
                </td>
                <td align="left"  style=" width: 400px; font-size:11px; font-weight:  bold;">
                   <asp:Label ID="Label2" runat="server" Text="Schedule: Curriculum View"></asp:Label>
                      
                </td>
          
                <td  >
                  <asp:UpdatePanel ID="UpdatePanel1" runat="server"   align="right" >
                        <ContentTemplate> 
                       
                                       
                          
                            &nbsp;
                            <asp:Button ID="bntCancel" runat="server" Text="Close"  SkinID="bntMiddle"  OnClientClick="window.close();"   />   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
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
         <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Height="410px"
            Width="100%" CssClass="gray">
            <asp:TabPanel HeaderText="Profile" Visible="true" runat="server" ID="dbstructure">
                <ContentTemplate>
                    <div  class="detailEdit" style="visibility: visible; margin: 4px; padding-top: 6px; width: 98%; ">
                        <table border="0" cellpadding="4" cellspacing="4" style="width: 100%; height: 100%;">
                            <tr>
                                <th align="left" >
                                    Curriculum Name:<span class="required"></span>
                                </th>
                                <td>
                                    <pel:SearchTextBox ID="SearchTextBox1" runat="server" 
                                        Width="78%" />
                                </td>
                            </tr>
                            <tr>
                                <th align="left" >
                                    Curriculum Code:<span class="required"></span>
                                </th>
                                <td>
                                    <pel:SearchTextBox ID="SearchTextBox2" runat="server"
                                        Width="78%" />
                                </td>
                            </tr>
                            <tr>
                                <th align="left">
                                    Version:
                                </th>
                                <td>
                                <asp:TextBox ID="TextBox13" runat="server" Width="60px"   BackColor="#efefef"></asp:TextBox>
<%--                                    <pel:SearchTextBox ID="SearchTextBox3" runat="server" Objective="userloginname" ValidationGroup="search"
                                        Width="200px" />--%>
                                </td>
                            </tr>
                            <tr>
                                <th valign="top" align="left" style="width: 150px; font-size: 11px; font-weight: normal;">
                                    Description:
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Width="98%" Height="60px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <th valign="top" align="left" >
                                    Objective:
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine" Width="98%" Height="60px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <th valign="top" align="left" >
                                    Set Display Color: <span class="required"></span>
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox3" runat="server" Width="198px"></asp:TextBox>
                                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/cp_button.png" />
                                    <asp:ColorPickerExtender ID="ColorPickerExtender2" runat="server" TargetControlID="TextBox3"
                                        PopupButtonID="ImageButton1">
                                    </asp:ColorPickerExtender>
                                </td>
                            </tr>
                            <tr>
                                <th valign="top" align="left" >
                                    Sum of All Course Cost:
                                </th>
                                <td  style="font-size: 11px; font-weight: normal;">
                                    <asp:TextBox ID="TextBox5" runat="server" Width="120px"   BackColor="#efefef"></asp:TextBox>
                                   
                                    <asp:Button ID="Button5" runat="server" Text="Recalculate" SkinID="bntMiddle" />
                                </td>
                            </tr>
                            <tr>
                                <th valign="top" align="left" >
                                    Sum of cost per student:
                                </th>
                                <td   style="font-size: 8px; font-weight: normal;">
                                    <asp:TextBox ID="TextBox6" runat="server" Width="120px"  BackColor="#efefef" ></asp:TextBox>
                                     <asp:Button ID="Button4" runat="server" Text="Recalculate"  SkinID="bntMiddle" />
                                </td>
                            </tr>
                            <tr>
                                <th valign="top" align="left" >
                                    Location & Organization:
                                </th>
                                <td  style="font-size: 8px; font-weight: normal;">
                                    <asp:TextBox ID="TextBox1" runat="server" Width="300px"></asp:TextBox>
                                    <asp:Button ID="Button3" runat="server" Text="..."  CssClass="ShortButton" />
                                </td>
                            </tr>
                            <tr>
                                <th valign="top" align="left" style="width: 150px; font-size: 11px; font-weight: normal;">
                                    Evaluation Methods:
                                </th>
                                <td>
        <%--                                    <asp:TextBox ID="TextBox7" runat="server" TextMode="MultiLine" Width="98%" Height="60px"></asp:TextBox>--%>
                                <pel:SearchTextBox ID="SearchTextBox3" runat="server" Objective="userloginname" ValidationGroup="search"
                                        Width="78%" />
                                </td>
                            </tr>
                              <tr>
                                <th align="left" style="width: 150px; font-size: 11px; font-weight: normal;">
                                    Certification Number:
                                </th>
                                <td>
                                    <pel:SearchTextBox ID="SearchTextBox5" runat="server" Objective="userloginname" ValidationGroup="search"
                                        Width="120px" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel HeaderText="Rules" Visible="true" runat="server" ID="TabPanel1">
                <ContentTemplate>
                    <div style="visibility: visible; margin: 4px;"  class="detailEdit">
                        <table border="0" cellpadding="4" cellspacing="4" style="width: 100%; height: 100%;">
                            <tr>
                                <th valign="top" align="left" >
                                    Is Recurrent:
                                </th>
                                <td align="left">
                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                </td>
                            </tr>
                             <tr>
                                <th valign="top" align="left" >
                                    Has Break:
                                </th>
                                <td align="left">
                                    <asp:CheckBox ID="CheckBox2" runat="server" />
                                </td>
                            </tr>
                             <tr>
                                <th  valign="top" align="left" >
                                     Time Span:
                                </th>
                                <td    >
                                     <asp:TextBox ID="TextBox9" runat="server" Width="200px"></asp:TextBox> Time Unit Type:
                                       <asp:DropDownList ID="DropDownList2" runat="server" Width="100px" >
                                       </asp:DropDownList>
                                </td>
                            </tr>
                             <tr>
                                    <th align="left">Schedule Business Hours:</th>
                                    <td   style="font-size: 11px; font-weight: normal;"> 
                                       Start Time:  <asp:TextBox ID="TextBox10" runat="server" MaxLength="20" Width="100px" />&nbsp;End Time:  <asp:TextBox ID="TextBox12" runat="server" MaxLength="20" Width="100px" />
                                      
                                    </td>
                                
                                </tr>
                             <tr>
                                <th  valign="top" align="left" >
                                     Schedule Days:
                                </th>
                                <td  style="font-size: 11px; font-weight: normal;"  >
                                    <asp:CheckBox ID="CheckBox3" runat="server" Text="Monday" Checked ="true" />&nbsp;&nbsp;
                                     <asp:CheckBox ID="CheckBox4" runat="server"  Text="Tuesday" Checked ="true" />&nbsp;&nbsp;
                                      <asp:CheckBox ID="CheckBox5" runat="server"  Text="Wednesday"  Checked ="true"/>&nbsp;&nbsp;
                                         <asp:CheckBox ID="CheckBox7" runat="server"   Text="Thursday" Checked ="true" />&nbsp;&nbsp;
                                          <asp:CheckBox ID="CheckBox8" runat="server"  Text="Friday" Checked ="true"/>&nbsp;&nbsp;
                                          <asp:CheckBox ID="CheckBox9" runat="server"  Text="Saturday" />
                                       <asp:CheckBox ID="CheckBox6" runat="server"  Text="Sunday" />
                                </td>
                            </tr>
                                 <tr>
                                    <th valign="top" align="left" >
                                        Max Students:
                                    </th>
                                    <td valign="top">
                                        <asp:TextBox ID="TextBox8" runat="server"  Width="300px"></asp:TextBox>
                                        

                                    </td>
                                </tr>
                                 <tr>
<%--                                    <td valign="top" align="left" style="width: 150px; font-size: 11px; font-weight: normal;">
                                       Prerequisite:
                                    </td>
                                    <td valign="top">
                                        <asp:TextBox ID="TextBox11" runat="server"  Width="500px"  Height="100px" TextMode="MultiLine"   ></asp:TextBox>
                                        <asp:Button ID="Button2" runat="server" Text="..." />

                                    </td>--%>
                                                                     <tr>
                                    <th valign="top" align="left" >
                                        Student Qualificaton:
                                    </th>
                                    <td valign="top">
                                        <asp:DropDownList ID="DropDownList4" runat="server" Width="500px" SkinID="eFormDropDownList">
                                        </asp:DropDownList><asp:Button ID="Button12" runat="server" Text="Detail"  SkinID="bntMiddle" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2"   >
                                            <asp:Button ID="Button2" runat="server" Text="Course List"  SkinID="bntMiddle"    Visible="false" 
                                            OnClientClick="parent.$.fancybox.open({href : '/files/CurriculumConfig.aspx?rec_id=0&action=load&nohead=1', type: 'iframe'}); return false;"/>
                                    </td>
                                
                                </tr>
                               
                        </table>
                    </div>
                </ContentTemplate>
            </asp:TabPanel>
         
          
        </asp:TabContainer>
    </div>
   </div>  
    <script type="text/javascript">

        $('.pageBody').css('padding', '0');
        $('body>div').css('background-color', '#efefef')
        //$('.tab-tc:last').removeClass("tab-tc");
       
    </script>
       
</asp:Content>
