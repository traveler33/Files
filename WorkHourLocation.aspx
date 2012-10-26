<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Main.Master" AutoEventWireup="true"
 CodeBehind="WorkHourLocation.aspx.cs" Inherits="Pelesys.Scheduling.Web.Files.WorkHourLocation" %>
 <%@ MasterType VirtualPath="~/Master/Main.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div>
        <table style="width: 100%;">
<%--            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>--%>
            <tr>
                <td align="left" valign="top">
                   <%-- &nbsp;<dx:ASPxGridView ID="gv" runat="server" KeyFieldName="OrganizationLocationID">--%>
 &nbsp;<dx:ASPxGridView ID="gv" runat="server" KeyFieldName="LocationID" Theme="Office2003Blue" AutoGenerateColumns="False" Width="90%">
                        <SettingsBehavior AllowFocusedRow="True" />
                        <Columns>
                        <dx:GridViewDataColumn FieldName="Name" Caption="Location" Width="90%"></dx:GridViewDataColumn>
                        </Columns>
                        <Templates>
            <DetailRow>
                <dx:ASPxGridView ID="gvEffdt" runat="server" KeyFieldName="EffectiveDate" Theme="Office2003Blue" Width="80%" AutoGenerateColumns="False">
                    <Columns>
                        <dx:GridViewDataColumn FieldName="EffectiveDate" Caption="Effective Date" VisibleIndex="1" />
                        <dx:GridViewDataColumn FieldName="ExpiryDate" Caption="Expiry Date" VisibleIndex="2" />
                    </Columns>
                    <Settings ShowFooter="True" />
                </dx:ASPxGridView>
            </DetailRow>
        </Templates>
        <SettingsDetail ShowDetailRow="true" />
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
<%--                <td>
                    &nbsp;
                </td>--%>
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
                           <td style="width: 350px;">
                           </td>
                       </tr>
                   </table>
               </div>
           </ContentTemplate>
       </asp:UpdatePanel>
    </div>
</asp:Content>
