<%@ Page Language="C#" AutoEventWireup="true" 
 MasterPageFile="~/Master/Main.Master"
CodeBehind="CurriculumConfig.aspx.cs" Inherits="Pelesys.Scheduling.Web.Files.CurriculumConfig" %>
  <%@ Register Src="../Control/ucAddStudents.ascx" TagName="ucLocation"
    TagPrefix="uc1" %>


<%@ MasterType VirtualPath="~/Master/Main.Master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">

   <script type="text/javascript">
       function LocDefineFancyBox() {

           $("#StudentList").fancybox({
               'autoScale': false,
               'autoDimensions': false,
               'width': 1300,
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

           $('#StudentList').trigger('click');
           // window.setTimeout('parent.$.fancybox.close();', 2500);


       }


    </script>

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
            <div style="visibility: visible; margin: 4px; padding-top: 8px; height: 300px; width: 100%; position: absolute; " class="detailEdit"  >
                <table border="0" cellpadding="6" cellspacing="6" width="98%"  >
                  
                    <tr>
                       
                        <td  colspan="2">
                           <div style=" width:98%; height:394px; border: 1px solid lightgray; background-color:#fff;  overflow: auto; "> 
                                 <div style="visibility: visible; margin: 4px;"  class="detailEdit">
                        <table border="0" cellpadding="4" cellspacing="4" style="width: 100%; height: 99%;">
                            <tr style="display: none">
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
                                <th   >
                                     <asp:TextBox ID="TextBox9" runat="server" Width="200px"></asp:TextBox> Time Unit Type:
                                       <asp:DropDownList ID="DropDownList2" runat="server" Width="100px" >
                                       </asp:DropDownList>
                                </th>
                            </tr>
                          

                                 <tr>
                                    <th valign="top" align="left" >
                                        Max Students:
                                    </th>
                                    <td valign="top">
                                        <asp:TextBox ID="TextBox8" runat="server"  Width="300px"></asp:TextBox>
                                        

                                    </td>
                                </tr>
                                 <tr  style=" height: 10px; ">
                                    <td  colspan="2" >
                                       
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
                                      <th valign="top" align="left" >
                                        Add Students:
                                    </th>
                                    <td valign="top">
                                        <hr style="background-color: Silver; width: 100%; height: 1px;" />
                                    </td>                               
                                 <tr>
                                    <th valign="top" align="left" >
                                        Student Qualificaton:
                                    </th>
                                    <td valign="middle">
                                        <asp:DropDownList ID="DropDownList4" runat="server" Width="500px" SkinID="eFormDropDownList">
                                        </asp:DropDownList><asp:Button ID="Button12" runat="server" Text="Detail"  SkinID="bntMiddle" />
                                    </td>
                                </tr>
                                <tr>
                                      <th valign="top" align="left" >
                                      
                                    </th>
                                    <td  valign="top" align="left"   >

                                        <table border ="0" cellpadding="2" cellspacing="2" width="100%">
                                            <tr>
                                                <th  align="left"     style="  width: 800px; "  >
                                                 <asp:Button ID="Button6" runat="server" Text="+" CssClass="ShortButton"  OnClientClick="LocDefineFancyBox(); return false;"   />
                                                <asp:Button ID="Button7" runat="server" Text="-" CssClass="ShortButton" />
                                                &nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text="Total Students: 22"></asp:Label>

                                                </th>
                                                  <td  align="left">
                                                     <asp:Button ID="Button4" runat="server" Text="Check Availability" CssClass="lButton"
                                                     OnClientClick="showModalNoFrame('../Files/CheckAvailability.aspx?nohead=1', 'CheckAvailability', 450, 350); return false;"
                                                      />
                                                  
                                                  </td>
                                            </tr>
                                        
                                        </table>
                                       
                                    </td>
                                    
                                </tr>
                                   <tr>
                                    <th valign="top" align="left" >
                                    </th>
                                    <td>
                                        <div style="height: 210px; width: 1050px; border: 1px lightgray solid; overflow: auto;">
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
                                                                <a href='EnrollmentProfile.aspx?rec_id=<%# Eval("userID") %>&IsArchived='>
                                                                    <%# Eval("LastName")   %>    <%# Eval("FirstName") %>
                                                                </a>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Location" SortExpression="ResourceTypeID" ItemStyle-HorizontalAlign="Left"
                                                            HeaderStyle-CssClass="grid_head_center">
                                                            <ItemTemplate>
                                                                Richmond
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Equipment" SortExpression="description" ItemStyle-HorizontalAlign="Left"
                                                            HeaderStyle-CssClass="grid_head_center">
                                                            <ItemTemplate>
                                                               Airbus 322
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Job Role" SortExpression="description" ItemStyle-HorizontalAlign="Left"
                                                            HeaderStyle-CssClass="grid_head_center"  >
                                                            <ItemTemplate>
                                                               Captain  
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                          <asp:TemplateField HeaderText="Group" SortExpression="description" ItemStyle-HorizontalAlign="Left"
                                                            HeaderStyle-CssClass="grid_head_center"  >
                                                            <ItemTemplate>
                                                               Traing Group A
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                         <asp:TemplateField HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                                                            <HeaderTemplate>
                                                                <asp:Label ID="Label1" runat="server" Text="Detail"></asp:Label>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="ImageButton1" runat="server"  ImageUrl="~/Images/sml_script.Png" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                          <asp:TemplateField HeaderStyle-Width="70px" ItemStyle-HorizontalAlign="Center">
                                                            <HeaderTemplate>    
                                                            <asp:CheckBox ID="chkAll1" runat="server" CssClass="chkAll" />
                                                                <asp:Label ID="Label11" runat="server" Text="Availability"></asp:Label>
                                                            
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkSingle1" runat="server" CssClass="chkSingle" ToolTip='' />
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
                           </div   
                        </td>
                    </tr>  
                   
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
  
    <div id="Div1" class="SaveCancelPanel" style="position: absolute; top: 120px; left: 4px; width:97%;">
        <table border="0" cellpadding="2" cellspacing="2" style="width: 100%; height: 100%;">
            <tr>
                <td >
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                   
                </td>
                <td align="left"  style=" font-size:11px; font-weight:  bold;">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate> 
                        <asp:Label ID="Label2" runat="server" Text="Schedule: Curriculum Configuration:"></asp:Label>
                         <asp:DropDownList ID="DropDownList1" runat="server" Width="200px" SkinID="eFormDropDownList">
                                        </asp:DropDownList>
                                        <asp:Button ID="Button3" runat="server" Text="Detail"  SkinID="bntMiddle" 
                                         OnClientClick="showModalNoFrame('../Files/CurriculumView.aspx?nohead=1', 'CurriculumDetail', 450, 350); return false;" />
                           
                            &nbsp;&nbsp;
                             <asp:Label ID="Label4" runat="server" Text="From:"></asp:Label>  &nbsp;
                             <pel:AdvancedCalendar ID="adcEffectiveDate" runat="server" IsRequired="false" />  &nbsp;
                              <asp:Label ID="Label5" runat="server" Text="To:"></asp:Label>  &nbsp;
                              <pel:AdvancedCalendar ID="AdvancedCalendar1" runat="server" IsRequired="false" />  &nbsp;&nbsp;
                            <asp:Button ID="bntCancel" runat="server" Text="Config"  SkinID="bntMiddle"    />  &nbsp;
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </div>
     <div id="Div2" class="SaveCancelPanel" style="position: absolute; top: 570px; left: 4px; width:97%;">
        <table border="0" cellpadding="2" cellspacing="2" style="width: 100%; height: 100%;">
            <tr>
                <td style="width: 40%; font-size: 10px; font-weight:  bold;">
             
                </td>
                <td align="left">
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                        
                            <asp:Button ID="Button1" runat="server" Text="Next&nbsp;&#x25ba;" SkinID="bntMiddle" OnClick="btnNext_Click" />
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Button2" runat="server" Text="Cancel"  SkinID="bntMiddle" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </div>

     <a id="StudentList" href="#AddStudents" title="Add Students" style="display:none;">Inline</a>
        <asp:HiddenField ID="HiddenField3" runat="server" />
        <asp:HiddenField ID="HiddenField4" runat="server" />
        <div style="display: none;  ">
            <div id="AddStudents"   style=" width:840px; height:520px; ">
              
                      <uc1:ucLocation ID="ucLocation1" runat="server"  />
                   
            </div>
        </div>
     <script type="text/javascript">

         $('.pageBody').css('padding', '0');
         $('body>div').css('background-color', '#efefef')
         //$('.tab-tc:last').removeClass("tab-tc");
       
    </script>
</asp:Content>