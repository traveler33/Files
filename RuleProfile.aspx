<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RuleProfile.aspx.cs" 
 MasterPageFile="~/Master/Main.Master"
Inherits="Pelesys.Scheduling.Web.Files.RuleProfile" %>

<%@ MasterType VirtualPath="~/Master/Main.Master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script type="text/javascript" src="../js/eform/eFormJS.js"></script>
    <script type="text/javascript" src="../js/eform/jquery.ui.core.js"></script>
    <script type="text/javascript" src="../js/eform/jquery.ui.draggable.js"></script>
    <script type="text/javascript" src="../js/eform/jquery.ui.droppable.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {



            $("a.iframe").fancybox({
                'width': '100%',
                'height': '160%',
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
    <div id="ResourceTypeTab" class="TabPanelControl" style="margin: 4px; padding: 1px; width:99%; overflow: hidden;">
        <table cellpadding="6" cellspacing="6" border="0"  width="100%">
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                          
                                            <div style="visibility: visible;margin: 4px;   padding-left:20px;  padding-top:12px; width:100%; height:370px; background-color: White; border: 1px solid lightgray;  " class="detailEdit"  >
                                                <table border="0" cellpadding="6" cellspacing="6" style="width: 100%; height: 100%;">
                                                    <tr>
                                                        <th align="left"  style=" width="150px;">
                                                            Name:<span class="required"></span>
                                                        </th>
                                                        <td  width="280px;">
                                                            <pel:SearchTextBox ID="SearchTextBox1" runat="server" Objective="userloginname" ValidationGroup="search"
                                                                Width="220px" />
                                                        </td>
                                                        <td   style=" width:40px;">
                                                        </td>
                                                        <th valign="top" align="left" width="150px;" >
                                                            <asp:Label ID="lblFormList" runat="server" Text="Event:"></asp:Label><span
                                                                class="required"></span>
                                                        </th>

                                                        <td>
                                                            <asp:DropDownList ID="ddlEventList" runat="server" Width="200px">
                                                            </asp:DropDownList>
                                                          
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Is System: </th>
                                                        <td> <asp:CheckBox runat="server"></asp:CheckBox></td>
                                                        <td style=" width:40px;"></td>
                                                        <th> IsActive:</th>
                                                        <td> <asp:CheckBox runat="server"></asp:CheckBox></td>
                                                    </tr>
                                                      <tr>
                                                        <th align="left"  style=" width="150px;">
                                                              <asp:Label ID="lblFormList1" runat="server" Text="Script Type:"></asp:Label>
                                                        </th>
                                                        <td  width="220px;">
                                                                <asp:DropDownList ID="ddlType1" runat="server" Width="200px">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td   style=" width:40px;">
                                                        </td>
                                                        <th valign="top" align="left" width="150px;" >
                                                            <asp:Label ID="lblType" runat="server" Text="Type:"></asp:Label><span
                                                                class="required"></span>
                                                        </th>

                                                        <td>
                                                            <asp:DropDownList ID="ddlType" runat="server" Width="200px">
                                                            </asp:DropDownList>
                                                          
                                                        </td>
                                                    </tr>
                                                     <tr>
                                                        <th valign="top" align="left"   colspan="3" >
                                                            Description:
                                                        </th>
                                                        <th>
                                                               
                                                        </th>
                                                        <td>
                                                         
                                                        </td>
                                                     </tr>

                                                    <tr>
                                                    
                                                 
                                                        <td  colspan="5">
                                                            <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Width="840px" Height="60px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                      <tr>
                                                        <th valign="top" align="left"   colspan="1"  >
                                                            Script:
                                                        </th>
                                                        <td>
                                                             <asp:Button ID="Button33" runat="server" Text="Parse" SkinID="bntMiddle" />
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <th>
                                                            Process Order:
                                                        </th>
                                                        <td>
                                                            <asp:TextBox runat="server" width="50px"></asp:TextBox>   <asp:Button ID="Button333" runat="server" Text="View Order" SkinID="bntMiddle" />
                                                        </td>
                                                     </tr>

                                                    <tr>
                                                    
                                                 
                                                        <td  colspan="5">
                                                            <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine" Width="840px" Height="60px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                      <tr>
                                                        <th valign="top" align="left"   colspan="3" >
                                                          Message:
                                                        </th>
                                                        <th></th>
                                                        <td></td>
                                                     </tr>

                                                    <tr>
                                                    
                                                 
                                                        <td  colspan="5">
                                                            <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine" Width="840px" Height="60px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                       
                                 
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="Div2" class="SaveCancelPanel" style="width: 100%;">
                        <table border="0" cellpadding="2" cellspacing="2" style="width: 100%; height: 100%;">
                            <tr>
                                <td style="width: 70%; font-size: 10px; font-weight: normal;">
                                    <asp:Panel ID="Panel1" runat="server">
                                    </asp:Panel>
                                </td>
                                <td align="left">
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                        <ContentTemplate>
                                           
                                            <asp:Button ID="Button3" runat="server" Text="Save" SkinID="bntMiddle" />
                                            <asp:Button ID="Button4" runat="server" Text="Cancel" SkinID="bntMiddle" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                        </table>
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
