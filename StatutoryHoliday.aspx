<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Main.Master" AutoEventWireup="true"
    CodeBehind="StatutoryHoliday.aspx.cs" Inherits="Pelesys.Scheduling.Web.Files.StatutoryHoliday" %>

<%@ MasterType VirtualPath="~/Master/Main.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        .style1
        {
            height: 37px;
        }
        .style2
        {
            width: 20px;
            height: 37px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div style="visibility: visible; margin: 4px; padding: 4px; border-top: 6px solid white;
        border-left: 4px solid white; border-right: 4px solid white;" class="detailEdit">
        <table border="0" cellpadding="6" cellspacing="6" width="100%">
            <tr>
                <td>
                    <div style=" padding: 8px; background-color:White; border: 1px solid lightgray;">
                    <table>
                        <tr>
                            <th align="left">
                                Location:
                            </th>
                            <td class="style2">
                            </td>
                            <th style="width: 800px">
                                <%--           &nbsp;Add or remove statutory holidays for year: --%>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Button ID="Button16" runat="server" Text="+" CssClass="ShortButton" OnClientClick="DefineFancyBox();return false;" />
                                            <asp:Button ID="Button17" runat="server" Text="-" CssClass="ShortButton" />
                                        </td>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Add or remove statutory holidays for the year of: "
                                                Font-Size="Small" />
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                            <dx:ASPxDropDownEdit ID="YearDL" runat="server" Width="80px" Theme="Office2010Blue"
                                                Font-Size="Small">
                                            </dx:ASPxDropDownEdit>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                            </th>
                        </tr>
                        <tr style="height: 340px">
                            <th valign="top" align="left">
                                <asp:ListBox ID="LocationList" runat="server" Width="240px" SkinID="eFormList" Style="height: 310px;
                                    width: 240px"></asp:ListBox>
                            </th>
                            <td style="width: 20px;">
                            </td>
                            <td>
                                <div style="height: 310px; width: 800px; border: 1px solid lightgray; overflow: auto;">
                                    <div class="resultGridView">
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
                                                <dx:GridViewDataColumn FieldName="Name" VisibleIndex="1" Caption="Name" SortOrder="Ascending" Width="200px" />
                                                <dx:GridViewDataHyperLinkColumn FieldName="Date" VisibleIndex="2"  Width="120px">
                                                    <DataItemTemplate>
                                                        <dx:ASPxDateEdit ID="ASPxDateEdit1" runat="server">
                                                        </dx:ASPxDateEdit>
                                                    </DataItemTemplate>
                                                </dx:GridViewDataHyperLinkColumn>
                                                <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="3" Width="60px">
                                                    <DataItemTemplate>
                                                        <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="280px">
                                                        </dx:ASPxTextBox>
                                                    </DataItemTemplate>
                                                    <CellStyle HorizontalAlign="Center">
                                                    </CellStyle>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <Settings ShowGroupPanel="False" />
                                            <SettingsBehavior AllowFocusedRow="False" />
                                            <Settings GridLines="Vertical" />
                                            <Styles>
                                                <AlternatingRow Enabled="True" />
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
                </td>
            </tr>
            <tr>
                <td colspan="3">
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
