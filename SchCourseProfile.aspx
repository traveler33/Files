<%@ Page Language="C#" MasterPageFile="~/Master/Main.Master" AutoEventWireup="true"
    CodeBehind="SchCourseProfile.aspx.cs" Inherits="Pelesys.Scheduling.Web.Files.SchCourseProfile" %>

<%@ MasterType VirtualPath="~/Master/Main.Master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {

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


        });
        function callBoxFancy() {


            $('#statusBox').trigger('click');
            //  window.setTimeout('parent.$.fancybox.close();', 2500);


        }


    </script>
    <script type="text/javascript">
        $(document).ready(function () {



            parent.$("a.iframe").fancybox({
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div id="Div1" class="TitlePanel">
        <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="1" Height="410px"  
            Width="100%" CssClass="gray">
            <asp:TabPanel HeaderText="Traing Course Profile" Visible="true" runat="server" ID="dbstructure">
                <ContentTemplate>
                    <div style="visibility: visible; margin: 4px; padding-top: 8px;"  class="detailEdit"   >
                        <table border="0" cellpadding="4" cellspacing="4" style="width: 99%; height: 100%;"   >
                            <tr>
                                <th align="left" >
                                    Course Name:<span class="required"></span>
                                </th>
                                <td>
                                    <pel:SearchTextBox ID="txtLoginName" runat="server" 
                                        Width="78%" />
                                </td>
                            </tr>
                            <tr>
                                <th align="left" >
                                    Course Code:<span class="required"></span>
                                </th>
                                <td>
                                    <pel:SearchTextBox ID="SearchTextBox1" runat="server" 
                                        Width="78%" />
                                </td>
                            </tr>
                            <tr>
                                <th  align="left">
                                    <asp:Label ID="lblDescription" runat="server" Text="Description:" />
                                </th>
                                <td class="editFieldControl">
                                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="5" onkeydown="CheckLength(this,3000,72)"
                                        onkeyup="CheckLength(this,3000,72)" Width="90%" MaxLength="3000"></asp:TextBox>
                                    <%--<pel:ValidateTextBox ID="txtDescription" runat="server" Required="false" TextMode="MultiLine" />--%>
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
                            <%--                                        <tr>
                                            <th style="vertical-align: top;  font-size: 11px; font-weight: normal;"  align="left">
                                                <asp:Label ID="lblEffectiveDate" runat="server" Text="Sequence No:" />
                                              
                                               
                                            </th>
                                            <td  style="padding-top: 0px;">
                                                 <asp:TextBox ID="TextBox4" runat="server" Width="120px"></asp:TextBox>  <asp:Button ID="Button3" runat="server" Text="Get Sequence" SkinID="Eformbutton" />
                                            </td>
                                            
                                        </tr>
                                         <tr>
                                            <th style="vertical-align: top;  font-size: 11px; font-weight: normal;"  align="left">
                                                <asp:Label ID="Label1" runat="server" Text="Certificate Link:" />
                                               
                                            </th>
                                            <td class="editFieldControl" style="padding-top: 0px;">
                                                  <asp:DropDownList ID="DropDownList6" runat="server" Width="500px" SkinID="eFormDropDownList">
                                                  </asp:DropDownList>
                                            </td>
                                            
                                        </tr>--%>
                        </table>
                    </div>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel HeaderText="Rules" Visible="true" runat="server" ID="relatedfiles">
                <ContentTemplate>
                    <asp:Panel ID="Panel3" runat="server">
                        <div style="visibility: visible; margin: 4px; padding-top: 8px;"  class="detailEdit"   >  
                            <table border="0" cellpadding="6" cellspacing="8" style="width: 100%; height: 100%;">
                                <tr>
                                    <th align="left" valign="top" >
                                        Prerequisite:
                                    </th>
                                    <td>
                                        <asp:TextBox ID="TextBox1" runat="server" Width="500px" Height="50px" TextMode="MultiLine" />
                                        <asp:Button ID="Button1" runat="server" Text="..." CssClass="ShortButton" />
                                    </td>
                                </tr>
                                <tr>
                                    <th valign="top" align="left" >
                                        Time Span:
                                    </th>
                                    <th>
                                        <asp:TextBox ID="TextBox9" runat="server" Width="200px"> </asp:TextBox>
                                        &nbsp; &nbsp; &nbsp; &nbsp; Time Unit Type:
                                        <asp:DropDownList ID="DropDownList1" runat="server" Width="100px">
                                        </asp:DropDownList>
                                    </th>
                                </tr>
                                <%--                             <tr>
                                <th  valign="top" align="left" style="width: 150px; font-size: 11px; font-weight: normal;" >
                                     Pre Requisites:
                                </th>
                                <td   >
                                    <hr style="background-color: lightgary; width: 100%; height: 1px;" />
                                </td>
                            </tr>--%>
                                <tr>
                                    <th valign="top" align="left" >
                                        Instructor Qualification:
                                    </th>
                                    <td valign="top">
                                        <asp:DropDownList ID="DropDownList3" runat="server" Width="500px" SkinID="eFormDropDownList">
                                        </asp:DropDownList>
                                        <asp:Button ID="Button4" runat="server" Text="Detail" SkinID="bntMiddle" />
                                    </td>
                                </tr>
                                <%--                                 <tr>
                                    <td valign="top" align="left" style="width: 150px; font-size: 11px; font-weight: normal;">
                                        Student Qualificaton:
                                    </td>
                                    <td valign="top">
                                        <asp:DropDownList ID="DropDownList2" runat="server" Width="500px" SkinID="eFormDropDownList">
                                        </asp:DropDownList><asp:Button ID="Button5" runat="server" Text="Detail" SkinID="Eformbutton" />
                                    </td>
                                </tr>--%>
                                <tr>
                                    <th valign="top" align="left" >
                                        Resources:
                                    </th>
                                    <td>
                                        <hr style="background-color: Silver; width: 100%; height: 1px;" />
                                    </td>
                                </tr>
                                <tr>
                                    <th align="left" >
                                        Resource Pool:
                                    </th>
                                    <td>
                                        <asp:Button ID="Button6" runat="server" Text="+" CssClass="ShortButton" OnClientClick="parent.DefineFancyBox();return false;" />
                                        <asp:Button ID="Button7" runat="server" Text="-" CssClass="ShortButton" />
                                    </td>
                                </tr>
                                <tr>
                                    <th valign="top" align="left" >
                                    </th>
                                    <td>
                                        <div style="height: 130px; width: 600px; border: 1px lightgray solid; overflow: auto;">
                                            <div class="resultGridView">
                                                <asp:GridView ID="gv" runat="server" AutoGenerateColumns="false" CssClass="griview"
                                                    Height="0px" HeaderStyle-CssClass="HeaderStyle-CssClass" RowStyle-CssClass="RowStyle-CssClass"
                                                    AllowPaging="false" PagerSettingsVisible="false" 
                                                    GridLines="None" AlternatingRowStyle-CssClass="AlternatingRowStyle-CssClass"
                                                    EditRowStyle-CssClass="SelectedRowStyle-CssClass">
                                                    <Columns>
                                                        <asp:TemplateField HeaderStyle-Width="16px" ItemStyle-HorizontalAlign="Center">
                                                            <HeaderTemplate>
                                                                <asp:CheckBox ID="chkAll" runat="server" CssClass="chkAll" />
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkSingle" runat="server" CssClass="chkSingle" ToolTip='' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Name" SortExpression="Name" ItemStyle-HorizontalAlign="Left"
                                                            HeaderStyle-CssClass="grid_head_center">
                                                            <ItemTemplate>
                                                                <a href='EnrollmentProfile.aspx?rec_id=<%# Eval("ResourceTypeID") %>&IsArchived='>
                                                                    <%# Eval("Name") %>
                                                                </a>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Resource Type" SortExpression="ResourceTypeID" ItemStyle-HorizontalAlign="Left"
                                                            HeaderStyle-CssClass="grid_head_center">
                                                            <ItemTemplate>
                                                                Resource
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Quantity" SortExpression="description" ItemStyle-HorizontalAlign="Left"
                                                            HeaderStyle-CssClass="grid_head_center">
                                                            <ItemTemplate>
                                                                &nbsp;<asp:TextBox ID="TextBox2" runat="server" Text="1" Width="60px"></asp:TextBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <PagerTemplate>
                                                        <pel:PelesysDataPager ID="PelesysDataPager1" runat="server" TotalRowCount="0" PageRowCount="20"
                                                            StartRowIndex="0" Text="1" Notice="" Summary=""></pel:PelesysDataPager>
                                                    </PagerTemplate>
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                    <div style="visibility: visible; margin: 4px;">
                    </div>
                </ContentTemplate>
            </asp:TabPanel>
        </asp:TabContainer>
    </div>

      <div id="Div2" class="SaveCancelPanel" style="position: absolute; top: 448px; left: 1px; width:99%;">
    <table border="0" cellpadding="2" cellspacing="2" style="width: 100%; height: 100%;">
        <tr>
            <td align="right">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="RightAdminPanel">
                            <table border="0" width="100%">
                                <tr>
                                    <td align="right">
                                       
                                        <asp:Button ID="bntSave" runat="server" Text="Save"   SkinID="bntMiddle" />
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
    <script type="text/javascript">

        $('.pageBody').css('padding', '0');
        $('body>div').css('background-color', '#efefef')
        //$('.tab-tc:last').removeClass("tab-tc");
       
    </script>
    <a id="statusBox" href="#ResourceTypeProfile" title="User Control" style="display: none;">
        Inline</a>
    <asp:HiddenField ID="hidControlList" runat="server" />
    <asp:HiddenField ID="hidLabelList" runat="server" />
    <div style="display: none;">
        <div id="ResourceTypeProfile" style="width: 800px; height: 500px;">
        </div>
    </div>
</asp:Content>
