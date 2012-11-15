<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileUpload.aspx.cs" Inherits="eForm.files.FileUpload"  Theme="generic" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="frmupload" runat="server">
    <div id="DivUploadImgeOnDesign"  style="   background-color:#efefef; height:120px; width: 100%;  "  >
        <div class="AlternatingRowStyle-CssClass">
            <table style="width: 100%;" border="0" cellpadding="4" cellspacing="4"   >
                <tr>
                    <td align="Center" valign="top">
                        <asp:Label ID="lblUploadImage" runat="server" Text="Label" SkinID="label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="Center" valign="top">
                      
                        <asp:FileUpload ID="ImageUpload" runat="server" CssClass="cssUploadFile" Width="500px" />
                    </td>
                </tr>
                <tr style="height: 20px" valign="bottom" align="center">
                    <td>
                        <asp:Button ID="bntUploadFileOnDesign" runat="server" Text="OK"  SkinID="bntMiddle"   OnClick="UploadImageOnDesign"  />
                        <asp:Button ID="bntUploadFileCloseOnDesign" runat="server" Text="Button" SkinID="Eformbutton"
                            Visible="false" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
