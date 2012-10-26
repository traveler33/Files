<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master/Main.Master"
    CodeBehind="CourseConfig.aspx.cs" Inherits="Pelesys.Scheduling.Web.Files.CourseConfig" %>
       <%@ Register Src="../Control/ucLocation.ascx" TagName="ucLocation"
    TagPrefix="uc3" %>
<%@ Register Src="../Control/ucResourceSelection.ascx" TagName="ucResourceSelection"
    TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ MasterType VirtualPath="~/Master/Main.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
        <script type="text/javascript">
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


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="searchField">
        <table cellpadding="6" cellspacing="6" border="0" width="1200px" style="height: 40px;"   class="detailEdit" >
            <tr>
                        <th valign="top" align="left" >
                            Curriculum Name:
                        </th>
                        <td>
                            <pel:SearchTextBox ID="txtCurriclumName" runat="server"
                                Width="180px" />
                        </td>
                   
                        <th valign="top" align="left" >
                            Curriculum Code:
                        </th>
                        <td>
                            <pel:SearchTextBox ID="txtCurriculumCode" runat="server"
                                Width="160px" />
                        </td>
                   
                        <th valign="top" align="left" >
                            Location & Organization:
                        </th>
                        <td >
                            <asp:TextBox ID="txtLocation" runat="server" Width="180px"></asp:TextBox>
                            <asp:Button ID="bntLoction" CssClass="ShortButton" runat="server" Text="..."  OnClientClick="LocDefineFancyBox(); return false;"  />
                        </td>
                <td  align="right"     >
                  <asp:Button ID="bnSearch" runat="server" CssClass="refresh" ToolTip="Search" Text="Search"
                       SkinID="bntMiddle" />
                    &#160;
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                 
                </td>
                <td>
                  
                </td>
            </tr>
        </table>
    </div>
    <%--tool bar--%>
    <div class="statusBar">
        <asp:LinkButton ID="lbAddNewEnrollment" runat="server" CausesValidation="false" CssClass="add"
            PostBackUrl="~/Files/Curriculum.aspx?rec_id=0"></asp:LinkButton>
        <asp:LinkButton ID="lbDeleteEnrollment" runat="server" CausesValidation="false" CssClass="delete"
            Style="display: none;"></asp:LinkButton>
        <%--withdraw--%>
        <asp:LinkButton ID="lbRecoverEnrollmentDeleted" runat="server" CausesValidation="false"
            CssClass="undelete" Style="display: none;">
        </asp:LinkButton>
        <%--unwithdraw--%>
    </div>
    <%--list view--%>
    <div class="resultGridView" style=" width:99.5%; height:90%; border: 1px solid lightgray ">
                     <dx:ASPxGridView ID="gv" ClientInstanceName="grid" runat="server" 
                                                               KeyFieldName="UserID"     Border-BorderColor="LightGray" Border-BorderStyle="Solid"
                                                                Border-BorderWidth=1   Font-Names="Verdana" Font-Size="10px"  ForeColor="#342F2F"  
                                                             AutoGenerateColumns="False"   Theme="Office2003Blue"
                                                                    EnableRowsCache="True" Width="100%" DataSourceForceStandardPaging="False" SettingsPager-AlwaysShowPager="True" SettingsPager-Position="Bottom">
                                                                    <Columns>
                                                                   <dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0"  Width="30px" >
                                                                        <HeaderTemplate>
                                                                           <asp:CheckBox ID="CheckBox2" runat="server" />
                                                                        </HeaderTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                    </dx:GridViewCommandColumn>
                                                                    <dx:GridViewDataColumn FieldName="FirstName" VisibleIndex="1"  Caption="Name" SortOrder="Ascending"   />

                                                                     <dx:GridViewDataHyperLinkColumn  Caption="Curriculum Code" VisibleIndex="2">
                                                                        <DataItemTemplate>
                                                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text=" Airbus 322">
                                                                            </dx:ASPxLabel>
                                                                        </DataItemTemplate>
                                                                     </dx:GridViewDataHyperLinkColumn>
                                                                     
                                                                      <dx:GridViewDataHyperLinkColumn  Caption="Max Students" VisibleIndex="3">
                                                                        <DataItemTemplate>
                                                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Job Role">
                                                                            </dx:ASPxLabel>
                                                                        </DataItemTemplate>
                                                                     </dx:GridViewDataHyperLinkColumn>


                                                                       <dx:GridViewDataHyperLinkColumn  Caption="Color" VisibleIndex="4">
                                                                        <DataItemTemplate>
                                                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text=" Traing Group A">
                                                                            </dx:ASPxLabel>
                                                                        </DataItemTemplate>
                                                                     </dx:GridViewDataHyperLinkColumn>

                                                                     <dx:GridViewDataImageColumn Caption="Detail" VisibleIndex="5">
                                                                       <DataItemTemplate>
                                                                           <dx:ASPxImage ID="ASPxImage1" runat="server"   ImageUrl="~/Images/sml_script.Png">
                                                                           </dx:ASPxImage>
                                                                       </DataItemTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                     </dx:GridViewDataImageColumn>
                                                                      
                                                                    <dx:GridViewDataColumn FieldName="FirstName" VisibleIndex="1"  Caption="Location" SortOrder="Ascending"   />

                                                                    </Columns>
                                                                    <Settings ShowGroupPanel="False" />
                                                                    <SettingsBehavior AllowFocusedRow="False" />
                                                                     <Settings GridLines="Vertical" />
                                                                     <Styles>
                                                                        <AlternatingRow Enabled="true" />
                                                                    </Styles>
                                                                      <SettingsPager PageSize="10">
                                                                        <PageSizeItemSettings Visible="true"  ShowAllItem="true" />
                                                                    </SettingsPager>
                                                                    </dx:ASPxGridView>
    </div>
    <a id="statusBox" href="#ResourceTypeProfile" title="Add Resource Pool" style="display: none;">
        Inline</a>
    <asp:HiddenField ID="hidControlList" runat="server" />
    <asp:HiddenField ID="hidLabelList" runat="server" />
    <div style="display: none;">
        <div id="ResourceTypeProfile" style="width: 810px; height: 570px;">
            <uc1:ucResourceSelection ID="ucResourceSelectione1" runat="server" />
        </div>
    </div>


      <a id="locationList" href="#Location" title="Location" style="display:none;">Inline</a>
        <asp:HiddenField ID="HiddenField3" runat="server" />
        <asp:HiddenField ID="HiddenField4" runat="server" />
        <div style="display: none;  ">
            <div id="Location"   style=" width:840px; height:520px; ">
              
                      <uc3:ucLocation ID="ucLocation1" runat="server"  />
                   
            </div>
        </div>
</asp:Content>
