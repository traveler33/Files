<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResourceDesign.aspx.cs"
    MasterPageFile="~/Master/DesignForm.Master" Inherits="Pelesys.Scheduling.Web.Files.ResourceDesign"
    Theme="generic" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Control/ucEFormDesign.ascx" TagName="ctrEFormDesign" TagPrefix="uc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
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
        window.setTimeout('parent.$.fancybox.close();', 2500);
       
       
    }

    </script>
    <div id="DemoTab" class="TabPanel">
        <table border="0" cellpadding="2" cellspacing="2" style="width: 100%; height: 100%">
            <tr valign="top">
                <td style="width: 3px;">
                </td>
                <td>
                    <asp:UpdatePanel ID="upEnableEFormDesign" runat="server">
                        <ContentTemplate>
                            <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Height="379px"
                                Width="100%" CssClass="gray">
                            </asp:TabContainer>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                <td style="width: 3px;">
                </td>
            </tr>
        </table>
    </div>
    <br />
     <div id="Div2" class="SaveCancelPanel" style="position: absolute; top: 488px; left: 48px; width:1060px;">
    <table border="0" cellpadding="2" cellspacing="2" style="width: 100%; height: 100%;">
        <tr>
            <td align="right">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div class="RightAdminPanel">
                            <table border="0" width="100%">
                                <tr>
                                    <td align="right">
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <asp:Button ID="bntSave" runat="server" Text="Save" SkinID="bntMiddle" OnClick="Save" />
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
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

    <div id="EFormDesignWidnow" class="EFormPanel">
        <uc1:ctrEFormDesign ID="ctrFormDesign1" runat="server" IsFieldOnly="false" CultureID="290" />
    </div>
    <a id="MessageBox" href="#Message" title="" style="display: none;">Inline</a>
    <div style="display: none;">
        <div id="Message">
        </div>
    </div>
    <asp:HiddenField ID="hidActiveTab" runat="server" />
</asp:Content>
