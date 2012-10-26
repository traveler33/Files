<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CurriculumCourseList.aspx.cs" 
 MasterPageFile="~/Master/Main.Master"
Inherits="Pelesys.Scheduling.Web.Files.CurriculumCourseList" %>

<%@ MasterType VirtualPath="~/Master/Main.Master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">

<script type="text/javascript">
    // format current row
    function SelectRow(row) {
        
        var _selectColor = "#303030";
        var _normalColor = "#909090";
        var _selectFontSize = "3em";
        var _normalFontSize = "2em";
        // get all data rows - siblings to current
        var _rows = row.parentNode.childNodes;
        // deselect all data rows
        try {
            for (i = 0; i < _rows.length; i++) {
                var _firstCell = _rows[i].getElementsByTagName("td")[0];
                _firstCell.style.color = _normalColor;
                _firstCell.style.fontSize = _normalFontSize;
                _firstCell.style.fontWeight = "normal";
            }
        }
        catch (e) { }
        // select current row (formatting applied to first cell)
        var _selectedRowFirstCell = row.getElementsByTagName("td")[0];
        _selectedRowFirstCell.style.backgroundcolor = _selectColor;
        _selectedRowFirstCell.style.fontSize = _selectFontSize;
        _selectedRowFirstCell.style.fontWeight = "bold";
       // alert('test');
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div style="visibility: visible; margin: 4px; padding-top: 4px; height: 90%; width: 99%; position: absolute; " class="detailEdit"  >
                <table border="0" cellpadding="6" cellspacing="6" width="99%"  >
                   
                    <tr>
                       
                        <td  colspan="2">
                           <div style=" width:100%; height:410px; border: 1px solid lightgray; background-color:#fff;  padding-top: 10px; overflow: auto; "> 
                              <asp:Accordion ID="accordion1" runat="server" HeaderCssClass="cssCourseLIstAccordionHead"  CssClass="cssAccordion"
                                                            HeaderSelectedCssClass="cssCourseLIstSelectedHead" ContentCssClass=""
                                                            Width="97%" BorderColor="#F0F0F0" BorderStyle="Solid" BorderWidth="1px" Height="450px"
                                                            FadeTransitions="false" TransitionDuration="250" FramesPerSecond="40" RequireOpenedPane="false"
                                                            SuppressHeaderPostbacks="true">
                                                            <Panes>
                                                                <asp:AccordionPane ID="AccordionPane1" HeaderCssClass="cssFormDesignAccordionHead" HeaderSelectedCssClass="cssCourseLIstSelectedHead"
                                                                    ContentCssClass="cssCourseListAccordionContent" runat="server" ToolTip="Search Filter">
                                                                    <Header>
                                                                        <asp:Label ID="Label4" runat="server" SkinID="label" Text="Week 1 ( From Oct 1 to Oct 5, 2012)"></asp:Label>
                                                                    </Header>
                                                                    <Content>
                                                                     <table cellpadding="1" cellspacing="1" border ="0"  width="930px" style=" height: 240px" >
                                                                                    <tr>
                                                                                        <td  valign="top">
                                                                                        <div style="   border:1px solid lightgray;  width:925px; height:210px;  overflow: auto; "> 
                                                                                         <asp:GridView ID="gvweek1" runat="server"
                                                                                                       AutoGenerateColumns ="false"
                                                                                                          CssClass="griview"
                                                                                                           Height ="0px"
                                                                                                            HeaderStyle-CssClass ="HeaderStyle-CssClass"
                                                                                                             RowStyle-CssClass="RowStyle-CssClass"
                                                                                                           AllowPaging="false"
                                                                                                          PagerSettingsVisible = "false" 
                                                                                                         OnRowDataBound="grid_RowDataBound"
                                                                                                          GridLines="None"
                                                                                                           AlternatingRowStyle-CssClass="AlternatingRowStyle-CssClass"
                                                                                                             EditRowStyle-CssClass="SelectedRowStyle-CssClass"
                                                                                                            OnRowCreated="GridView1_RowCreated"  
                                                                                                       >
                                                                                                           <Columns>
                                                                                                            <asp:TemplateField  HeaderText="Day" HeaderStyle-Width="60px" ItemStyle-HorizontalAlign="Center">
                                                                                                              
                                                                                                            <ItemTemplate>
                                                                                                                <asp:TextBox ID="txtdays1" runat="server"  Text="1"  Width="40px">
                                                                                                                </asp:TextBox>
                                                                                                            </ItemTemplate>
                                                                                                        </asp:TemplateField>
                                           
                                                                                                        <asp:TemplateField HeaderStyle-Width="400px"   HeaderText="Course"
                                                                                                            ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="grid_head_center">
                                                                                                            <ItemTemplate>
                                                                                                                <asp:DropDownList ID="DropDownList1" runat="server" Width="360px" >
                                                                                                                </asp:DropDownList>
                                                                                                            </ItemTemplate>
                                                                                                        </asp:TemplateField>
                                                                                                          <asp:TemplateField HeaderText="Duration" HeaderStyle-Width="80px"
                                                                                                            ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="grid_head_center">
                                                                                                            <ItemTemplate>
                                                                                                                  <asp:TextBox ID="txtDuration1" runat="server"    Width="50px">
                                                                                                                </asp:TextBox>
                                                                                                            </ItemTemplate>
                                                                                                        </asp:TemplateField>
                                                                                                          <asp:TemplateField HeaderText="Instructor" HeaderStyle-Width="360px" 
                                                                                                            ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="grid_head_center">
                                                                                                            <ItemTemplate>
                                                                                                                <asp:DropDownList ID="DropDownList3" runat="server" Width="320px" >
                                                                                                                </asp:DropDownList>
                                                                                                            </ItemTemplate>
                                                                                                        </asp:TemplateField>
                                                                                                          <asp:TemplateField HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                                                                                            <HeaderTemplate>
                                                                                                                <asp:CheckBox ID="chkAll" runat="server" CssClass="chkAll" />
                                                                                                            </HeaderTemplate>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:CheckBox ID="chkSingle" runat="server" CssClass="chkSingle" ToolTip='' />
                                                                                                            </ItemTemplate>
                                                                                                        </asp:TemplateField>
                                                                                                        </Columns>
                                                                                          </asp:GridView>


                                                                                          </div>
                                                                                          
                                                                                        
                                                                                        </td>
                                                                                    </tr><td align="right">
                                                                                                <asp:Button ID="Button4" runat="server" Text="+"  CssClass="ShortButton" />
                                                                                                <asp:Button ID="Button5" runat="server" Text="-" CssClass="ShortButton"  />
                                                                                    </td>
                                                                                    </tr>

                                                                            </table>
                                                                            
                                                                    </Content>
                                                                </asp:AccordionPane>
                                                                <asp:AccordionPane ID="AccordionPane2" HeaderCssClass="cssFormDesignAccordionHead"
                                                                    HeaderSelectedCssClass="cssCourseListAccordionContent" ContentCssClass="cssCourseListAccordionContent"
                                                                    runat="server" ToolTip="Curriculum Search">
                                                                    <Header>
                                                                        <asp:Label ID="Label5" runat="server" SkinID="label" Text="Week 2 ( From Oct 8 to Oct 12, 2012)"></asp:Label>
                                                                    </Header>
                                                                    <Content>
                                                                             <table cellpadding="1" cellspacing="1" border ="0"  width="720px" style=" height: 240px" >
                                                                                    <tr>
                                                                                        <td  valign="top">
                                                                                         <div style="   border:1px solid lightgray;  width:925px; height:210px;  overflow: auto; "> 
                                                                                         <asp:GridView ID="GridView1" runat="server"
                                                                                                       AutoGenerateColumns ="false"
                                                                                                          CssClass="griview"
                                                                                                           Height ="0px"
                                                                                                            HeaderStyle-CssClass ="HeaderStyle-CssClass"
                                                                                                             RowStyle-CssClass="RowStyle-CssClass"
                                                                                                           AllowPaging="false"
                                                                                                          PagerSettingsVisible = "false" 
                                                                                                         OnRowDataBound="grid_RowDataBound"
                                                                                                          GridLines="None"
                                                                                                           AlternatingRowStyle-CssClass="AlternatingRowStyle-CssClass"
                                                                                                             EditRowStyle-CssClass="SelectedRowStyle-CssClass"
                                                                                                            OnRowCreated="GridView1_RowCreated"  
                                                                                                       >
                                                                                                           <Columns>
                                                                                                            <asp:TemplateField  HeaderText="Day" HeaderStyle-Width="60px" ItemStyle-HorizontalAlign="Center">
                                                                                                              
                                                                                                            <ItemTemplate>
                                                                                                                <asp:TextBox ID="txtdays1" runat="server"  Text="1"  Width="40px">
                                                                                                                </asp:TextBox>
                                                                                                            </ItemTemplate>
                                                                                                        </asp:TemplateField>
                                           
                                                                                                        <asp:TemplateField HeaderStyle-Width="400px"   HeaderText="Course"
                                                                                                            ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="grid_head_center">
                                                                                                            <ItemTemplate>
                                                                                                                <asp:DropDownList ID="DropDownList1" runat="server" Width="360px" >
                                                                                                                </asp:DropDownList>
                                                                                                            </ItemTemplate>
                                                                                                        </asp:TemplateField>
                                                                                                          <asp:TemplateField HeaderText="Duration" HeaderStyle-Width="80px"
                                                                                                            ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="grid_head_center">
                                                                                                            <ItemTemplate>
                                                                                                                  <asp:TextBox ID="txtDuration1" runat="server"    Width="50px">
                                                                                                                </asp:TextBox>
                                                                                                            </ItemTemplate>
                                                                                                        </asp:TemplateField>
                                                                                                          <asp:TemplateField HeaderText="Instructor" HeaderStyle-Width="360px" 
                                                                                                            ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="grid_head_center">
                                                                                                            <ItemTemplate>
                                                                                                                <asp:DropDownList ID="DropDownList3" runat="server" Width="320px" >
                                                                                                                </asp:DropDownList>
                                                                                                            </ItemTemplate>
                                                                                                        </asp:TemplateField>
                                                                                                          <asp:TemplateField HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                                                                                            <HeaderTemplate>
                                                                                                                <asp:CheckBox ID="chkAll" runat="server" CssClass="chkAll" />
                                                                                                            </HeaderTemplate>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:CheckBox ID="chkSingle" runat="server" CssClass="chkSingle" ToolTip='' />
                                                                                                            </ItemTemplate>
                                                                                                        </asp:TemplateField>
                                                                                                        </Columns>
                                                                                          </asp:GridView>


                                                                                          </div>
                                                                                        
                                                                                        </td>
                                                                                    </tr><td align="right">
                                                                                                <asp:Button ID="Button6" runat="server" Text="+"  CssClass="ShortButton" />
                                                                                                <asp:Button ID="Button7" runat="server" Text="-" CssClass="ShortButton"  />
                                                                                    </td>
                                                                                    </tr>

                                                                            </table>
                                                                    </Content>
                                                                </asp:AccordionPane>
                                                                <asp:AccordionPane ID="AccordionPane3" HeaderCssClass="cssFormDesignAccordionHead" HeaderSelectedCssClass="cssFormDesignSelectedHead"
                                                                    ContentCssClass="cssCourseListAccordionContent" runat="server" ToolTip="Location Search">
                                                                    <Header>
                                                                        <asp:Label ID="Label6" runat="server" SkinID="label" Text="Week 3  ( From Oct 15 to Oct 18, 2012)"></asp:Label>
                                                                    </Header>
                                                                    <Content>
                                                                            <table cellpadding="1" cellspacing="1" border ="0"  width="720px" style="height: 240px" >
                                                                                    <tr>
                                                                                        <td  valign="top">
                                                                                         <div style="   border:1px solid lightgray;  width:925px; height:210px;  overflow: auto; "> 
                                                                                         <asp:GridView ID="GridView2" runat="server"
                                                                                                       AutoGenerateColumns ="false"
                                                                                                          CssClass="griview"
                                                                                                           Height ="0px"
                                                                                                            HeaderStyle-CssClass ="HeaderStyle-CssClass"
                                                                                                             RowStyle-CssClass="RowStyle-CssClass"
                                                                                                           AllowPaging="false"
                                                                                                          PagerSettingsVisible = "false" 
                                                                                                         OnRowDataBound="grid_RowDataBound"
                                                                                                          GridLines="None"
                                                                                                           AlternatingRowStyle-CssClass="AlternatingRowStyle-CssClass"
                                                                                                             EditRowStyle-CssClass="SelectedRowStyle-CssClass"
                                                                                                            OnRowCreated="GridView1_RowCreated"  
                                                                                                       >
                                                                                                           <Columns>
                                                                                                            <asp:TemplateField  HeaderText="Day" HeaderStyle-Width="60px" ItemStyle-HorizontalAlign="Center">
                                                                                                              
                                                                                                            <ItemTemplate>
                                                                                                                <asp:TextBox ID="txtdays1" runat="server"  Text="1"  Width="40px">
                                                                                                                </asp:TextBox>
                                                                                                            </ItemTemplate>
                                                                                                        </asp:TemplateField>
                                           
                                                                                                        <asp:TemplateField HeaderStyle-Width="400px"   HeaderText="Course"
                                                                                                            ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="grid_head_center">
                                                                                                            <ItemTemplate>
                                                                                                                <asp:DropDownList ID="DropDownList1" runat="server" Width="360px" >
                                                                                                                </asp:DropDownList>
                                                                                                            </ItemTemplate>
                                                                                                        </asp:TemplateField>
                                                                                                          <asp:TemplateField HeaderText="Duration" HeaderStyle-Width="80px"
                                                                                                            ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="grid_head_center">
                                                                                                            <ItemTemplate>
                                                                                                                  <asp:TextBox ID="txtDuration1" runat="server"    Width="50px">
                                                                                                                </asp:TextBox>
                                                                                                            </ItemTemplate>
                                                                                                        </asp:TemplateField>
                                                                                                          <asp:TemplateField HeaderText="Instructor" HeaderStyle-Width="360px" 
                                                                                                            ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="grid_head_center">
                                                                                                            <ItemTemplate>
                                                                                                                <asp:DropDownList ID="DropDownList3" runat="server" Width="320px" >
                                                                                                                </asp:DropDownList>
                                                                                                            </ItemTemplate>
                                                                                                        </asp:TemplateField>
                                                                                                          <asp:TemplateField HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                                                                                            <HeaderTemplate>
                                                                                                                <asp:CheckBox ID="chkAll" runat="server" CssClass="chkAll" />
                                                                                                            </HeaderTemplate>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:CheckBox ID="chkSingle" runat="server" CssClass="chkSingle" ToolTip='' />
                                                                                                            </ItemTemplate>
                                                                                                        </asp:TemplateField>
                                                                                                        </Columns>
                                                                                          </asp:GridView>


                                                                                          </div>
                                                                                        
                                                                                        </td>
                                                                                    </tr><td align="right">
                                                                                                <asp:Button ID="Button8" runat="server" Text="+"  CssClass="ShortButton" />
                                                                                                <asp:Button ID="Button9" runat="server" Text="-" CssClass="ShortButton"  />
                                                                                    </td>
                                                                                    </tr>

                                                                            </table>
                                                                    </Content>
                                                                </asp:AccordionPane>
                                                                <asp:AccordionPane ID="AccordionPane4" HeaderCssClass="cssFormDesignAccordionHead"
                                                                    HeaderSelectedCssClass="cssFormDesignSelectedHead" ContentCssClass="cssCourseListAccordionContent"
                                                                    runat="server" ToolTip="Resource Search">
                                                                    <Header>
                                                                        <asp:Label ID="Label7" runat="server" SkinID="label" Text="Week 4 ( From Oct 21 to Oct 26, 2012)"></asp:Label>
                                                                    </Header>
                                                                    <Content>
                                                                            <table cellpadding="1" cellspacing="1" border ="0"  width="720px" style=" height: 240px" >
                                                                                    <tr>
                                                                                        <td  valign="top">
                                                                                         <div style="   border:1px solid lightgray;  width:925px; height:210px;  overflow: auto; "> 
                                                                                         <asp:GridView ID="GridView3" runat="server"
                                                                                                       AutoGenerateColumns ="false"
                                                                                                          CssClass="griview"
                                                                                                           Height ="0px"
                                                                                                            HeaderStyle-CssClass ="HeaderStyle-CssClass"
                                                                                                             RowStyle-CssClass="RowStyle-CssClass"
                                                                                                           AllowPaging="false"
                                                                                                          PagerSettingsVisible = "false" 
                                                                                                         OnRowDataBound="grid_RowDataBound"
                                                                                                          GridLines="None"
                                                                                                           AlternatingRowStyle-CssClass="AlternatingRowStyle-CssClass"
                                                                                                             EditRowStyle-CssClass="SelectedRowStyle-CssClass"
                                                                                                            OnRowCreated="GridView1_RowCreated"  
                                                                                                       >
                                                                                                           <Columns>
                                                                                                            <asp:TemplateField  HeaderText="Day" HeaderStyle-Width="60px" ItemStyle-HorizontalAlign="Center">
                                                                                                              
                                                                                                            <ItemTemplate>
                                                                                                                <asp:TextBox ID="txtdays1" runat="server"  Text="1"  Width="40px">
                                                                                                                </asp:TextBox>
                                                                                                            </ItemTemplate>
                                                                                                        </asp:TemplateField>
                                           
                                                                                                        <asp:TemplateField HeaderStyle-Width="400px"   HeaderText="Course"
                                                                                                            ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="grid_head_center">
                                                                                                            <ItemTemplate>
                                                                                                                <asp:DropDownList ID="DropDownList1" runat="server" Width="360px" >
                                                                                                                </asp:DropDownList>
                                                                                                            </ItemTemplate>
                                                                                                        </asp:TemplateField>
                                                                                                          <asp:TemplateField HeaderText="Duration" HeaderStyle-Width="80px"
                                                                                                            ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="grid_head_center">
                                                                                                            <ItemTemplate>
                                                                                                                  <asp:TextBox ID="txtDuration1" runat="server"    Width="50px">
                                                                                                                </asp:TextBox>
                                                                                                            </ItemTemplate>
                                                                                                        </asp:TemplateField>
                                                                                                          <asp:TemplateField HeaderText="Instructor" HeaderStyle-Width="360px" 
                                                                                                            ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="grid_head_center">
                                                                                                            <ItemTemplate>
                                                                                                                <asp:DropDownList ID="DropDownList3" runat="server" Width="320px" >
                                                                                                                </asp:DropDownList>
                                                                                                            </ItemTemplate>
                                                                                                        </asp:TemplateField>
                                                                                                          <asp:TemplateField HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                                                                                            <HeaderTemplate>
                                                                                                                <asp:CheckBox ID="chkAll" runat="server" CssClass="chkAll" />
                                                                                                            </HeaderTemplate>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:CheckBox ID="chkSingle" runat="server" CssClass="chkSingle" ToolTip='' />
                                                                                                            </ItemTemplate>
                                                                                                        </asp:TemplateField>
                                                                                                        </Columns>
                                                                                          </asp:GridView>


                                                                                          </div>
                                                                                        
                                                                                        </td>
                                                                                    </tr><td align="right">
                                                                                                <asp:Button ID="Button10" runat="server" Text="+"  CssClass="ShortButton" />
                                                                                                <asp:Button ID="Button11" runat="server" Text="-" CssClass="ShortButton"  />
                                                                                    </td>
                                                                                    </tr>

                                                                            </table>
                                                                    </Content>
                                                                </asp:AccordionPane>
                                                              
                                                               </Panes>
                                                        </asp:Accordion> 
                           </div   
                        </td>
                    </tr>  
                   
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
       <div id="Div2" class="SaveCancelPanel" style="position: absolute; top: 120px; left: 10px; width:98%;">
        <table border="0" cellpadding="2" cellspacing="2" style="width: 100%; height: 100%;">
            <tr>
                <td >
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                   
                </td>
                <td align="left"  style=" font-size:11px; font-weight:  bold;">
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate> 
                        <asp:Label ID="Label8" runat="server" Text="Schedule: Curriculum Course:"></asp:Label>
                         <asp:DropDownList ID="DropDownList1" runat="server" Width="200px" SkinID="eFormDropDownList">
                                        </asp:DropDownList>
                                        <asp:Button ID="Button2" runat="server" Text="Detail"  SkinID="bntMiddle" 
                                         OnClientClick="showModalNoFrame('../Files/CurriculumView.aspx?nohead=1', 'CurriculumDetail', 450, 350); return false;" />
                           
                            &nbsp;&nbsp;
                             <asp:Label ID="Label9" runat="server" Text="From:"></asp:Label>  &nbsp;
                             <pel:AdvancedCalendar ID="AdvancedCalendar2" runat="server" IsRequired="false" />  &nbsp;
                              <asp:Label ID="Label10" runat="server" Text="To:"></asp:Label>  &nbsp;
                              <pel:AdvancedCalendar ID="AdvancedCalendar3" runat="server" IsRequired="false" />  &nbsp;&nbsp;
                                <asp:CheckBox ID="CheckBox2" runat="server" Text="Include Weekend:" TextAlign="Left" />&nbsp;&nbsp;
                              <asp:Button ID="Button12" runat="server" Text="Generate"  SkinID="bntMiddle" />
                                          <asp:Button ID="Button13" runat="server" Text="Reporting"  SkinID="bntMiddle" />  &nbsp;
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </div>
    <div id="Div1" class="SaveCancelPanel" style="position: absolute; top: 590px; left: 10px; width:98%;">
        <table border="0" cellpadding="2" cellspacing="2" style="width: 100%; height: 100%;">
            <tr>
                <td style="width: 40%; font-size: 10px; font-weight: normal;">
                    <asp:Panel ID="Panel1" runat="server">
                    </asp:Panel>
                </td>
                <td align="left">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                           <asp:Button ID="bntPrevous" runat="server" Text="&#x25c4;&nbsp;Previous"  SkinID="bntMiddle" 
                           OnClick="btnPrevous_Click"/>
                           
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="bntSave" runat="server" Text="Save" SkinID="bntMiddle" />  
                            <asp:Button ID="bntCancel" runat="server" Text="Cancel"  SkinID="bntMiddle" />
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