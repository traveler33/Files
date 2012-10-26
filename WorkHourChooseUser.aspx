<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Main.Master" AutoEventWireup="true"
 CodeBehind="WorkHourChooseUser.aspx.cs" Inherits="Pelesys.Scheduling.Web.Files.WorkHourUser" %>
 <%@ MasterType VirtualPath="~/Master/Main.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="searchField">
        <table cellpadding="6" cellspacing="6" border="0" width="1200px" style="height: 40px;"   class="detailEdit" >
            <tr>
                        <th valign="top" align="left" >
                            First Name:
                        </th>
                        <td>
                            <pel:SearchTextBox ID="txtCurriclumName" runat="server"
                                Width="180px" />
                        </td>
                   
                        <th valign="top" align="left" >
                            Last Name:
                        </th>
                        <td>
                            <pel:SearchTextBox ID="txtCurriculumCode" runat="server"
                                Width="160px" />
                        </td>
                   
                        <th valign="top" align="left" >
                            Login Name:
                        </th>
                        <td >
                            <asp:TextBox ID="txtLocation" runat="server" Width="180px"></asp:TextBox>
<%--                            <asp:Button ID="bntLoction" CssClass="ShortButton" runat="server" Text="..."  OnClientClick="LocDefineFancyBox(); return false;"  />--%>
                        </td>
                <td  align="right"     >
                  <asp:Button ID="bnSearch" runat="server" CssClass="refresh" ToolTip="Search" Text="Search"
                       SkinID="bntMiddle" />
                    &#160;
                </td>
            </tr>
        </table>
    </div>
    <div>
        <table style="width: 100%;">
            <tr>
                <td align="left" valign="top">
                   <%-- &nbsp;<dx:ASPxGridView ID="gv" runat="server" KeyFieldName="OrganizationLocationID">--%>
 &nbsp;<dx:ASPxGridView ID="gv" runat="server" KeyFieldName="UserID" Theme="Office2003Blue" AutoGenerateColumns="False" Width="90%">
                        <SettingsBehavior AllowFocusedRow="True" />
                        <Columns>
                        <dx:GridViewDataColumn FieldName="UserID" Caption="User ID" Width="90%"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="LoginName" Caption="LoginName" Width="90%"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="FirstName" Caption="First Name" Width="90%"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="LastName" Caption="Last Name" Width="90%"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="Email" Caption="Email" Width="90%"></dx:GridViewDataColumn>
                        </Columns>
        </dx:ASPxGridView>
                </td>
                <td align="left" valign="top">
                     &nbsp;<dx:ASPxGridView ID="gvd" runat="server" KeyFieldName="Weekday" Theme="Office2003Blue" Width="60%" AutoGenerateColumns="False">
                         <SettingsBehavior AllowFocusedRow="True" />
                         <Columns>
                        <dx:GridViewDataColumn FieldName="Weekday" VisibleIndex="1"></dx:GridViewDataColumn>
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
<%--                            <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="100%">
                            </dx:ASPxTextBox>--%>
                        </DataItemTemplate>
                        </dx:GridViewDataTextColumn>
                        </Columns>
                     </dx:ASPxGridView>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="height: 10px;">
                </td>
            </tr>
        </table>
    </div>
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
</asp:Content>
