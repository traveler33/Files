<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master/MainTab.Master"
    CodeBehind="ResourceTypeProfile.aspx.cs" Inherits="Pelesys.Scheduling.Web.Files.ResourceTypeProfile" %>

<%@ Register Src="../Control/ucResourceProfile.ascx" TagName="ucResourceProfile"
    TagPrefix="uc1" %>
<%@ Register Src="~/Control/ucEFormDesign.ascx" TagName="ctrEFormDesign" TagPrefix="uc4" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ MasterType VirtualPath="~/Master/MainTab.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" runat="server">
    <script type="text/javascript" src="../js/eform/eFormJS.js"></script>
    <script type="text/javascript" src="../js/eform/jquery.ui.core.js"></script>
    <script type="text/javascript" src="../js/eform/jquery.ui.draggable.js"></script>
    <script type="text/javascript" src="../js/eform/jquery.ui.droppable.js"></script>
    <script type="text/javascript">

        $(init);

        function init() {
            $('#EFormDesignWidnow').draggable(

          );
            $('.CssEformDragClass').draggable();



        }

  $(document).ready(function () {
	       
	        $("#MessageBox").fancybox({
	            'overlayShow': true,
	            'transitionIn': 'elastic',
	            'transitionOut': 'elastic',
                'padding': 6,
                'zoomOpacity': true,
                'zoomSpeedIn': 500,
                'zoomSpeedOut': 500,

	        });

	     
	    });
    function callMessageBox(cclass, msg) 
    {    $('#Message').text(msg);
         var currentClass =  $('#Message').attr("class");
         if ( currentClass != cclass); 
         {
             $('#Message').removeClass(currentClass);
         }
         $('#Message').addClass(cclass);
     
        $('#MessageBox').trigger('click');
        window.setTimeout('parent.$.fancybox.close();', 5500);
       
       
    }

    </script>
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
        function callBoxFancy(cclass, msg) {
            $('#status').text(msg);
            var currentClass = $('#status').attr("class");
            if (currentClass != cclass);
            {
                $('#status').removeClass(currentClass);
            }
            $('#status').addClass(cclass);

            $('#statusBox').trigger('click');
            window.setTimeout('parent.$.fancybox.close();', 4500);


        }


    </script>
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
    <style type="text/css">
        .fancybox-custom .fancybox-skin
        {
            box-shadow: 0 0 50px #222;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentNav" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">
    <div id="ResourceTypeTab" class="TabPanelControl" style="height: 470px;">
        <table cellpadding="6" cellspacing="6" border="0" width="100%">
            <tr>
                <td>
                    <asp:UpdatePanel ID="upEnableEFormDesign" runat="server">
                        <ContentTemplate>
                            <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" CssClass="gray"
                                Visible="true" Width="100%" Height="370px">
                                <asp:TabPanel ID="Tabs" HeaderText="Profile" runat="server" ToolTip="Resource Type Profile">
                                    <ContentTemplate>
                                        <div style="visibility: visible; margin: 4px; padding: 4px;" class="detailEdit">
                                            <table border="0" cellpadding="6" cellspacing="6" width="100%">
                                                <tr>
                                                    <td>
                                                        <table border="0" cellpadding="6" cellspacing="6" width="400px">
                                                            <tr>
                                                                <th align="left" style="width: 150px;">
                                                                    <asp:Label ID="lblName" runat="server" Text="Name:"></asp:Label>
                                                                    <span class="required"></span>
                                                                </th>
                                                                <td colspan="3">
                                                                    <asp:TextBox ID="txtName" runat="server" Width="200px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                <div style=" padding:6px; border: 1px solid lightgray;">
                                                                    <table border="0" cellpadding="1" cellspacing="1" width="460px">
                                                                        <tr>
                                                                            <th style="width: 150px" valign="middle">
                                                                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/legend-bullet.gif" />
                                                                                <asp:RadioButton ID="radManaged" runat="server" GroupName="number" AutoPostBack="true"
                                                                                    OnCheckedChanged="RadioManage_CheckedChanged" />
                                                                                <asp:Label ID="Label3" runat="server" Text="Specific Resource"></asp:Label>
                                                                            </th>
                                                                            <td style="width: 60px;">
                                                                            </td>
                                                                            <th style="width: 180px" valign="middle">
                                                                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/PageGroup.png" />
                                                                                <asp:RadioButton AutoPostBack="true" ID="radInventory" runat="server" GroupName="number"
                                                                                    OnCheckedChanged="RadioManage_CheckedChanged" />
                                                                                <asp:Label ID="Label2" runat="server" Text="Non-Specific Resource"></asp:Label>
                                                                            </th>
                                                                        </tr>
                                                                        <tr>
                                                                                <td  colspan="3" >
                                                                                    <table cellpadding="2" cellspacing="2" width="440px" border="0" >
                                                                                        <tr>
                                                                                              
                                                                                                
                                                                                                
                                                                                            
                                                                                        <th  style=" width: 150px;">
                                                                                                <asp:Label ID="lblEventLimit" runat="server" Text="Event Limit:" />
                                                                                            </th>
                                                                                            <td  style=" width: 110px;">
                                                                                                <asp:TextBox ID="txtEventLimit" runat="server" Width="100px"></asp:TextBox>
                                                                                            </td>
                                                                                            <th style="width: 150px;">
                                                                                                <asp:Label ID="lblIsFixed" runat="server" />
                                                                                                <asp:Label ID="lblIsDeplete" runat="server" />
                                                                                            </th>
                                                                                            <td style="width: 50px;">
                                                                                                <asp:CheckBox ID="chkIsFixed" runat="server" />
                                                                                                <asp:CheckBox ID="chkIsDeplete" runat="server" />
                                                                                            </td>
                                                                                
                                                                                        
                                                                                        </tr>
                                                                                    
                                                                                    </table>
                                                                                
                                                                                </td>
                                                                             
                                                                        </tr>
                                                                    </table>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    <table border="0" cellpadding="`2" cellspacing="2" width="350px">
                                                                        <tr>
                                                                            <th style="width: 460px;">
                                                                                <asp:Label ID="lblService" runat="server" />
                                                                            </th>
                                                                            <td style="width: 100px;">
                                                                                <asp:CheckBox ID="chkIsService" runat="server" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>
                                                                                <asp:Label ID="lblHasEventLimit" runat="server" />
                                                                            </th>
                                                                            <td>
                                                                                <asp:CheckBox ID="chkHasEventLimit" runat="server" />
                                                                            </td>
                                                                            <th>
                                                                                <asp:Label ID="lblHasEventRestriction" runat="server" />
                                                                            </th>
                                                                            <td>
                                                                                <asp:CheckBox ID="chkHasEventRestriction" runat="server" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td style="width: 60px;">
                                                    </td>
                                                    <td>
                                                        <table>
                                                            <tr>
                                                                <th valign="top" align="left"  style="width: 150px" >
                                                                    <asp:Label ID="lblDesc" runat="server" Text="Description:"></asp:Label>
                                                                </th>
                                                                <td colspan="4">
                                                                    <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" Width="300px" Height="86px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th valign="top" align="left" style="width: 150px; font-size: 11px; font-weight: normal;">
                                                    </th>
                                                    <td>
                                                        <a class="iframe" id="A1" style="display: none;" title="Add Form Design" href="/files/ResourceDesign.aspx?action=load&nohead=1">
                                                            <asp:Button ID="bntAdd" runat="server" Text="Add" SkinID="bntMiddle" /></a>
                                                        <a class="iframe" id="A2" style="display: none;" title="Edit Form Design" href="/files/ResourceDesign.aspx?action=load&nohead=1">
                                                            <asp:Button ID="bntEdit" runat="server" Text="Edit" SkinID="bntMiddle" /></a>
                                                        <a class="iframe" id="A3" style="display: none;" title="Preview Form Design" href="/files/ResourceDesign.aspx?action=load&nohead=1">
                                                            <asp:Button ID="bntPreview" runat="server" Text="Preview" SkinID="bntMiddle" /></a>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel ID="TabPanel2" HeaderText="New 
                                Tab 1" runat="server" ToolTip="Form Design: Design your own resource type">
                                    <ContentTemplate>
                                    </ContentTemplate>
                                </asp:TabPanel>
                            </asp:TabContainer>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="Div2" class="SaveCancelPanel" style="width: 99.5%;">
                        <table border="0" cellpadding="2" cellspacing="2" style="width: 100%; height: 100%;">
                            <tr>
                                <td style="width: 70%; font-size: 10px; font-weight: normal; min-width: 500px;">
                                    <asp:Panel ID="Panel1" runat="server">
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                            <ContentTemplate>
                                                <table cellpadding="3" cellspacing="3">
                                                    <tr>
                                                        <th style="width: 150px;">
                                                            <asp:Label ID="lblExisting" runat="server" Text="Existing Design:"></asp:Label>
                                                        </th>
                                                        <td align="left">
                                                            <asp:DropDownList ID="ddlDesignForm" runat="server" Width="280px">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td align="right" style="width: 100px;">
                                                            <asp:Button ID="bntDesign" runat="server" Text="Design" SkinID="bntMiddle" OnClick=" OnDesignButtonClick" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </asp:Panel>
                                </td>
                                <td align="left">
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                           
                                            <asp:Button ID="bntSave" runat="server" Text="Save" SkinID="bntMiddle" />
                                            <asp:Button ID="bntCancel" runat="server" Text="Cancel" SkinID="bntMiddle" />
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
    <a id="statusBox" href="#status" title="Rsource Type Design" style="display: none;">
        Inline</a>
    <asp:HiddenField ID="hidControlList" runat="server" />
    <asp:HiddenField ID="hidLabelList" runat="server" />
    <div style="display: none;">
        <div id="status" style="height: 100px; width: 600px;">
        </div>
    </div>
    <div id="EFormDesignWidnow" class="EFormPanel" style="z-index: 99999;">
        <uc4:ctrEFormDesign ID="ctrFormDesign1" runat="server" IsFieldOnly="false" CultureID="290"
            eFormID="1" />
    </div>
    <a id="MessageBox" href="#Message" title="" style="display: none;">Inline</a>
    <div style="display: none;">
        <div id="Message">
        </div>
    </div>
    <asp:HiddenField ID="hidActiveTab" runat="server" />
</asp:Content>
