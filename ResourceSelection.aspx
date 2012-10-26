<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master/MainTab.Master"
    CodeBehind="ResourceSelection.aspx.cs" Inherits="Pelesys.Scheduling.Web.Files.ResourceSelection" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ MasterType VirtualPath="~/Master/MainTab.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" runat="server">
  <script src="../js/exp_parser.js" type="text/javascript"></script>
    <script src="../js/jquery.splitter/splitter-16.js" type="text/javascript"></script>
    <script src="../js/jquery.jsTree/jquery.jstree.js" type="text/javascript"></script>
    <script src="../js/zeroclipboard/ZeroClipboard.js" type="text/javascript"></script>
    <script src="../js/jquery.cookie.js" type="text/javascript"></script>
    <script src="../lib/jquery.cookie.js" type="text/javascript"></script>
    <script src="../js/jquery.treeview.js" type="text/javascript"></script>

    <script type="text/javascript">

      $(document).ready(function () {

            // first example
            $("#browser").treeview();


        });

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentNav" runat="server">

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">

  <div  style=" position: absolute; top: 40; left: 380px;   height : 510px; padding: 6px; overflow: auto; background-color:
            White; width: 390px; border: 1px solid lightgray;  z-index:10000">
                <asp:Button ID="Button1" runat="server" Text="Remove" SkinID="Eformbutton" />
                           
                   <div class="resultGridView" style="position: absolute; height: 480px; overflow: auto;">
                                          <asp:GridView ID="gv" runat="server"
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
                                                                                                            
                                                                                                       >
                                            <Columns>
                                                <asp:TemplateField HeaderStyle-Width="16px" ItemStyle-HorizontalAlign="Center">
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="chkAll" runat="server" CssClass="chkAll" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkSingle" runat="server" CssClass="chkSingle" ToolTip='' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                           
                                            <asp:TemplateField HeaderText="Name" SortExpression="Name"
                                                ItemStyle-HorizontalAlign="Left" HeaderStyle-CssClass="grid_head_center">
                                                <ItemTemplate>
                                                    <a href='EnrollmentProfile.aspx?rec_id=<%# Eval("ResourceTypeID") %>&IsArchived='>
                                                        <%# Eval("Name") %>
                                                    </a>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Quantity" SortExpression="CheckInventory" ItemStyle-HorizontalAlign="Left"
                                                    HeaderStyle-CssClass="grid_head_center" HeaderStyle-Width="180px">
                                                    <ItemTemplate>
                                                      &nbsp;&nbsp;  <asp:TextBox ID="TextBox1" runat="server"   Text="1" Width="50px" ></asp:TextBox>
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
    <div style="width: 99%; height: 100%; padding: 2px; overflow: auto;">
        <table cellpadding="4" cellspacing="4" border="0" width="100%" style="height: 100px">
            <tr>
                <td colspan="2" style="height: 30px; font-weight: bold;">
                    Add Resource Pool
                </td>
            </tr>
            <tr>
                <td style="width: 50%" valign="top">
                    <table cellpadding="1" cellspacing="1" border="0">
                        <tr style="height: 24px;">
                            <th style="vertical-align: top; font-size: 11px; font-weight: normal;" align="left"
                                valign="top">
                                <asp:Label ID="Label1" runat="server" Text="Resource Type:" />
                            </th>
                            <td class="editFieldControl" style="padding-top: 0px;">
                                <asp:DropDownList ID="DropDownList6" runat="server" Width="240px" SkinID="eFormDropDownList">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr style="height: 24px;">
                            <th style="vertical-align: top; font-size: 11px; font-weight: normal;" align="left"
                                valign="top">
                                <asp:Label ID="Label2" runat="server" Text="Location:" />
                            </th>
                            <td class="editFieldControl" style="padding-top: 0px;">
                                <asp:DropDownList ID="DropDownList1" runat="server" Width="240px" SkinID="eFormDropDownList">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                          
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                </td>
            </tr>
        </table>
    </div>
     
      <div  style=" position: absolute; top: 100; left: 10px;   height : 410px; padding: 6px; overflow: auto; background-color: White; width: 340px; border: 1px solid lightgray;">
                                <div id="structureTree" class="structureTree,jstree-drop,jstree-draggable"  >
                                    <ul id="browser" class="filetree">
                                        <li><span class="RType" style="font-size: 11px;" onclick="iframeGotoPage('Resources', 1);">
                                            Resources</span>
                                            <ul>
                                                <li class="RLoc"><span class="RLoc" style="font-size: 11px; font-weight: normal;"
                                                    onclick="iframeGotoPage('Room', 1);">Room</span>
                                                    <ul>
                                                        <li><span class="RLoc" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoPage('Class Room', 2)">
                                                            Class Room</span> </li>
                                                        <li><span class="RLoc" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoPage('Meeting Room', 2)">
                                                            Meeting Room</span> </li>
                                                        <li><span class="RLoc" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoPage('Office Room', 2)">
                                                            Office Room</span> </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                            <ul>
                                                <li class="RLoc"><span class="RLoc" style="font-size: 11px; font-weight: normal;"
                                                    onclick="iframeGotoPage('Simulator', 1);">Simulator</span>
                                                    <ul>
                                                        <li><span class="RLoc" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoPage('A320', 1)">
                                                            A320</span>
                                                            <ul>
                                                                <li><span class="RLoc" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoPage('Level 1', 1)">
                                                                    Level 1</span>
                                                                    <ul>
                                                                        <li><span class="RLoc" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoPage('Visual/Dispaly 4', 2)">
                                                                            Visual/Dispaly 4</span> </li>
                                                                        <li><span class="RLoc" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoPage('Visual/Dispaly 5', 2)">
                                                                            Visual/Display 5</span></li>
                                                                        <li><span class="RLoc" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoPage('Visual/Dispaly 6', 2)">
                                                                            Visual/Display 6</span></li>
                                                                    </ul>
                                                                </li>
                                                                <li><span class="RLoc" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoPage('Level 2', 2)">
                                                                    Level 2</span></li>
                                                                <li><span class="RLoc" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoPage('Level 3', 2)">
                                                                    Level 3</span></li>
                                                            </ul>
                                                        </li>
                                                        <li><span class="RLoc" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoPage('B767', 1)">
                                                            B767</span></li>
                                                        <li><span class="RLoc" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoPage('B737', 1)">
                                                            B737</span></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                            <ul>
                                                <li class="RPool"><span class="RPool" style="font-size: 11px; font-weight: normal;"
                                                    onclick="iframeGotoInventoryPage('155 Manual Book', 1);">155 Manual Book</span>
                                                    <ul>
                                                        <li><span class="RPool" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoInventoryPage('244 Manual Book', 2)">
                                                            244 Manual Book</span></li>
                                                        <li><span class="RPool" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoInventoryPage('266 Manual Book', 2)">
                                                            266 Manual Book</span></li>
                                                        <li><span class="RPool" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoInventoryPage(' 288 244 Manual Book', 2)">
                                                            288 244 Manual Book</span></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                            <ul>
                                                <li class="RPool"><span class="RPool" style="font-size: 11px; font-weight: normal;"
                                                    onclick="iframeGotoPage('Office Furniture', 1);">Office Furniture</span>
                                                    <ul>
                                                        <li><span class="RPool" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoInventoryPage('Desk', 2)">
                                                            Desk</span></li>
                                                        <li><span class="RPool" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoInventoryPage('Chair', 2)">
                                                            Chair</span></li>
                                                        <li><span class="RPool" style="font-size: 11px; font-weight: normal;" onclick="iframeGotoInventoryPage('Divisions', 2)">
                                                            Divisions</span></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                </div>
                                </div>
    <div id="Div1" class="AdminLeftPanel2" style="position: absolute; top: 550px; left: 8px">
        <table border="0" cellpadding="2" cellspacing="2" style="width: 100%; height: 100%;">
            <tr>
                <td style="width: 70%; font-size: 10px; font-weight: normal;">
                    <asp:Panel ID="Panel1" runat="server">
                    </asp:Panel>
                </td>
                <td align="left">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Button ID="bntSave" runat="server" Text="OK" SkinID="Eformbutton" />
                            <asp:Button ID="bntCancel" runat="server" Text="Cancel" SkinID="Eformbutton" />
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
