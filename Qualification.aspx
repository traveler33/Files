<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Qualification.aspx.cs"
    Inherits="Pelesys.Scheduling.Web.Files.Qualification" MasterPageFile="~/Master/Main.Master" %>

<%@ MasterType VirtualPath="~/Master/Main.Master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
  <script type="text/javascript">
      var previouseBox = null;
      var currentBox = null;
      var CurrentText = "";
      var CurrentColor = null;


      function SetRadioButtonValue(ClientID, value, Color) {

          var Radio = document.getElementById(ClientID);
          if (Radio != null) {

              previouseBox.value = value;
              previouseBox.style.backgroundColor = Color;
              CurrentColor = Color;
              CurrentText = value;
          }

      }
      function SelectValue(ishide, clientID) {
          var control = document.getElementById(clientID);
          var ID = 'CourseSelected';
        
          var txtbox = document.getElementById(clientID);
          if (previouseBox != null) {
              if (previouseBox.value == "") {
                  previouseBox.style.backgroundColor = "#fff";
              }
          }
          if (ishide == true) {
             
              //alert(p.y);

          

              if (txtbox.value == "") {
                  if (CurrentText != "") {
                      txtbox.style.backgroundColor = "#000000";
                      txtbox.value = CurrentText;
                  }
                  else {
                      txtbox.style.backgroundColor = "#000000";
                      txtbox.style.color = "#ffffff";
                      txtbox.value = "5";

                  }
              }
              previouseBox = txtbox;

          }
          else {

              $("#" + ID).css({ visibility: "hidden" });
              $("#" + ID).css({ display: "none" });
              if (previouseBox != null) {

                  if (previouseBox.value == "") {
                      previouseBox.style.backgroundColor = "#fff";
                  }
              }

          }



      }


    </script>
  

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div id="ResourceTypeTab" class="TabPanelControl" style="margin: 4px; padding: 1px;
        width: 99%; overflow: hidden;  height:650px">
        <table cellpadding="6" cellspacing="6" border="0" width="100%"
            <tr>
                <th>
                    <table>
                            <tr>
                                <th>
                                   <h4> <asp:label runat="server" text="Search for quatified instructors "></asp:label></h4>
                                </th>
                            </tr>
                            <tr>
                                <th>
                                   <asp:Button ID="Button41" runat="server" Text="+" CssClass="ShortButton" />
                                   <asp:Button ID="Button51" runat="server" Text="-" CssClass="ShortButton" /> 
                                   <asp:label runat="server" text="Add or remove instructor"></asp:label>
                                </th>
                            </tr>
                            <tr>
                                <th>
                                    <table>
                                            <tr>
                                                <th>
                                                      <asp:TextBox ID="txtName" runat="server"  
                                                        Height="20px" Width="280px"></asp:TextBox>
                                                    <asp:TextBoxWatermarkExtender ID="NameWatermark" runat="server" WatermarkText=" Instructor or currlulum name..."
                                                        TargetControlID="txtName" WatermarkCssClass="SearchWaterMark">
                                                    </asp:TextBoxWatermarkExtender>
                                                        <asp:Button ID="bntSearch" runat="server" Text="Search" SkinID="bntMiddle" />
                                                            <asp:Button ID="bntDisplay" runat="server" Text="Display All" SkinID="bntMiddle" />
                                                            <asp:Button ID="bntImport" runat="server" Text="Import Data" SkinID="bntMiddle" />
                                                </th>
                                                 <th></th>
                                                  <th></th>
                                            </tr>
                                    
                                    </table>
                                
                                </th>
                            
                            </tr>
                    </table>
                
                </th>
            </tr>
            <tr>
                <td>
                    <div style="height: 444px; width: 1460px; border: 1px lightgray solid; overflow: auto;">
                        <div class="resultGridView">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="griview"
                                Height="0px" HeaderStyle-CssClass="HeaderStyle-CssClass" RowStyle-CssClass="RowStyle-CssClass"
                                 OnRowDataBound =" gv_RowDataBound"  OnRowCreated="grvMergeHeader_RowCreated"
                                AllowPaging="false" PagerSettingsVisible="false" GridLines="None" AlternatingRowStyle-CssClass="AlternatingRowStyle-CssClass"
                                EditRowStyle-CssClass="SelectedRowStyle-CssClass" Width="100%">
                                <Columns>
                                    <asp:BoundField HeaderText="Name" SortExpression="FirstName" DataField="FirstName"
                                        ItemStyle-HorizontalAlign="left" HeaderStyle-Width="188px" />
                                    <asp:TemplateField HeaderText="100" HeaderStyle-Width="20px" ItemStyle-HorizontalAlign="Center"
                                       >
                                        <ItemTemplate>
                                            <asp:TextBox ID="course01" runat="server"  Width="20px"  ></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   <asp:TemplateField HeaderText="101" HeaderStyle-Width="20px" ItemStyle-HorizontalAlign="Center"
                                       >
                                        <ItemTemplate>
                                            <asp:TextBox ID="course02" runat="server"  Width="20px"  ></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="102" HeaderStyle-Width="20px" ItemStyle-HorizontalAlign="Center"
                                       >
                                        <ItemTemplate>
                                            <asp:TextBox ID="course03" runat="server"  Width="20px"  ></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="103" HeaderStyle-Width="20px" ItemStyle-HorizontalAlign="Center"
                                       >
                                        <ItemTemplate>
                                            <asp:TextBox ID="course04" runat="server"  Width="20px"  ></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                       <asp:TemplateField HeaderText="104" HeaderStyle-Width="20px" ItemStyle-HorizontalAlign="Center"
                                       >
                                        <ItemTemplate>
                                            <asp:TextBox ID="course05" runat="server"  Width="20px"  ></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                       <asp:TemplateField HeaderText="105" HeaderStyle-Width="20px" ItemStyle-HorizontalAlign="Center"
                                       >
                                        <ItemTemplate>
                                            <asp:TextBox ID="course06" runat="server"  Width="20px"  ></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                       <asp:TemplateField HeaderText="106" HeaderStyle-Width="20px" ItemStyle-HorizontalAlign="Center"
                                       >
                                        <ItemTemplate>
                                            <asp:TextBox ID="course07" runat="server"  Width="20px"  ></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                       <asp:TemplateField HeaderText="107" HeaderStyle-Width="20px" ItemStyle-HorizontalAlign="Center"
                                       >
                                        <ItemTemplate>
                                            <asp:TextBox ID="course08" runat="server"  Width="20px"  ></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                       <asp:TemplateField HeaderText="108" HeaderStyle-Width="20px" ItemStyle-HorizontalAlign="Center"
                                       >
                                        <ItemTemplate>
                                            <asp:TextBox ID="course09" runat="server"  Width="20px"  ></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                       <asp:TemplateField HeaderText="109" HeaderStyle-Width="20px" ItemStyle-HorizontalAlign="Center"
                                       >
                                        <ItemTemplate>
                                            <asp:TextBox ID="course010" runat="server"  Width="20px"  ></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    
                                       <asp:TemplateField HeaderText="110" HeaderStyle-Width="20px" ItemStyle-HorizontalAlign="Center"
                                       >
                                        <ItemTemplate>
                                            <asp:TextBox ID="course011" runat="server"  Width="20px"  ></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                       <asp:TemplateField HeaderText="111" HeaderStyle-Width="20px" ItemStyle-HorizontalAlign="Center"
                                       >
                                        <ItemTemplate>
                                            <asp:TextBox ID="course012" runat="server"  Width="20px"  ></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                       <asp:TemplateField HeaderText="112" HeaderStyle-Width="20px" ItemStyle-HorizontalAlign="Center"
                                       >
                                        <ItemTemplate>
                                            <asp:TextBox ID="course013" runat="server"  Width="20px"  ></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                       <asp:TemplateField HeaderText="113" HeaderStyle-Width="20px" ItemStyle-HorizontalAlign="Center"
                                       >
                                        <ItemTemplate>
                                            <asp:TextBox ID="course014" runat="server"  Width="20px"  ></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                       <asp:TemplateField HeaderText="114" HeaderStyle-Width="20px" ItemStyle-HorizontalAlign="Center"
                                       >
                                        <ItemTemplate>
                                            <asp:TextBox ID="course015" runat="server"  Width="20px"  ></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    
                                       <asp:TemplateField HeaderText="115" HeaderStyle-Width="20px" ItemStyle-HorizontalAlign="Center"
                                       >
                                        <ItemTemplate>
                                            <asp:TextBox ID="course016" runat="server"  Width="20px"  ></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                       <asp:TemplateField HeaderText="116" HeaderStyle-Width="20px" ItemStyle-HorizontalAlign="Center"
                                       >
                                        <ItemTemplate>
                                            <asp:TextBox ID="course017" runat="server"  Width="20px"  ></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                       <asp:TemplateField HeaderText="117" HeaderStyle-Width="20px" ItemStyle-HorizontalAlign="Center"
                                       >
                                        <ItemTemplate>
                                            <asp:TextBox ID="course018" runat="server"  Width="20px"  ></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                       <asp:TemplateField HeaderText="118" HeaderStyle-Width="20px" ItemStyle-HorizontalAlign="Center"
                                       >
                                        <ItemTemplate>
                                            <asp:TextBox ID="course019" runat="server"  Width="20px"  ></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                       <asp:TemplateField HeaderText="119" HeaderStyle-Width="20px" ItemStyle-HorizontalAlign="Center"
                                       >
                                        <ItemTemplate>
                                            <asp:TextBox ID="course020" runat="server"  Width="20px"  ></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                      <div id="Div2" class="SaveCancelPanel" style="width: 99.5%;">
                        <table border="0" cellpadding="2" cellspacing="2" style="width: 100%; height: 100%;">
                            <tr>
                                <td align="right">
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
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
    </div>
    
    <script type="text/javascript">

        $('.pageBody').css('padding', '0');
        $('body>div').css('background-color', '#efefef')
       
    </script>
</asp:Content>
