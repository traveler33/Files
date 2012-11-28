<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EventSchedule.aspx.cs" 
 MasterPageFile="~/Master/Main.Master"
Inherits="Pelesys.Scheduling.Web.Files.EventSchedule" %>

<%@ MasterType VirtualPath="~/Master/Main.Master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
  <div id="Div1" class="TitlePanel"   style=" margin: 4px; padding: 4px; border-top: solid 2px white; height:470px;" >
   

   
    <table  border="0" cellpadding="2" cellspacing="2"  width="100%"  >
    <tr>
        <td>
    <div id="Div3"  class="SaveCancelPanel"    style=" width:100%;  ">
    <table border="0" cellpadding="2" cellspacing="2" style="width: 100%; height: 100%;">
        <tr>
            <td align="right">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div class="RightAdminPanel">
                            <table border="0" width="100%"   class="detailEdit" >
                                <tr>
                                    <td align="left">
                                          <table border="0" cellpadding="2" cellspacing="2" width="900px">
                                            <tr>
                                            
                                                <th   style="  width:100px; "  >From:</th>
                                                 <td   align="left"   style="  width:200px; " > <pel:AdvancedCalendar ID="AdvancedCalendar8" runat="server" IsRequired="false"   Width="120px" /> </td>
                                                  <th   style="  width:100px; "  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;To:</th>
                                                   <td   align="left"   style="  width:200px; "> <pel:AdvancedCalendar ID="AdvancedCalendar9" runat="server" IsRequired="false"   Width="120px" /> </td>
                                                    <th>
                                                    
                                                            Included Weekend 
                                                        <asp:CheckBox ID="CheckBox1" runat="server" />
                                                            
                                                    </th>
                                                    <th>
                                                    
                                                         
                                                            
                                                    </th>
                                            </tr>
                                           
                                        
                                        </table>
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
     <tr>
        <td  style=" height:10px;" ></td>
        
    </tr> 
    <tr>
        <td>
          <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Height="320px"
            Width="100%" CssClass="gray">
              <asp:TabPanel HeaderText="Reasons" Visible="true" runat="server" ID="TabPanel1">
                <ContentTemplate>
                    <div style="visibility: visible; margin: 4px;"  class="detailEdit">
                        <table border="0" cellpadding="2" cellspacing="2" width="1100px">
                           <tr>
                                <td   colspan="2"   style=" height:10px  "  ></td>
                            
                            </tr>
                            <tr>
                                    <th   style=" width:150px; "   >
                                      Type:
                                    
                                    </th>
                            
                            
                                    <td  align="left">
                                      
                                         <asp:DropDownList ID="DropDownList2" runat="server" Width="200px" >
                                       </asp:DropDownList>
  
                                    
                                    </td>
                            
                            </tr>
                          
                                      
                                 <tr>
                                      <th valign="top" align="left" >
                                      
                                    </th>
                                    <td  valign="top" align="left"   >

                                        <table border ="0" cellpadding="2" cellspacing="2" width="100%">
                                            <tr>
                                                <th  align="left"     style="  width: 800px; "  >
                                                 <asp:Button ID="Button6" runat="server" Text="+" CssClass="ShortButton"  OnClientClick="LocDefineFancyBox(); return false;"   />
                                                <asp:Button ID="Button7" runat="server" Text="-" CssClass="ShortButton" />
                                               

                                                </th>
                                                  <td  align="left">
                                                     <asp:Button ID="Button4" runat="server" Text="Check Availability" CssClass="lButton"
                                                     OnClientClick="showModalNoFrame('../Files/CheckAvailability.aspx?nohead=1', 'CheckAvailability', 450, 350); return false;"
                                                      />
                                                  
                                                  </td>
                                            </tr>
                                        
                                        </table>
                                       
                                    </td>
                                    
                                </tr>
                                   <tr>
                                    <th valign="top" align="left" >
                                    </th>
                                    <td>
                                        <div style="height: 120px; width: 1000px; border: 1px lightgray solid; overflow: auto;">
                                            <div class="resultGridView">
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

                                                                     <dx:GridViewDataHyperLinkColumn  Caption="Equipment" VisibleIndex="2">
                                                                        <DataItemTemplate>
                                                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text=" Airbus 322">
                                                                            </dx:ASPxLabel>
                                                                        </DataItemTemplate>
                                                                     </dx:GridViewDataHyperLinkColumn>
                                                                     
                                                                      <dx:GridViewDataHyperLinkColumn  Caption="Job Role" VisibleIndex="3">
                                                                        <DataItemTemplate>
                                                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Job Role">
                                                                            </dx:ASPxLabel>
                                                                        </DataItemTemplate>
                                                                     </dx:GridViewDataHyperLinkColumn>


                                                                       <dx:GridViewDataHyperLinkColumn  Caption="Group" VisibleIndex="4">
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
                                        </div>
                                    </td>
                                </tr>
  
                             
                            </tr>
                        <tr  style="   height:10px;  "  >
                        
                        <td></td>
                        </tr>
                            <tr>
                                    <th   style=" width:150px; "   >
                                      Reason:
                                    
                                    </th>
                            
                            
                                    <td  align="left">
                                      
                                        <asp:TextBox ID="TextBox1" runat="server"    TextMode="MultiLine"  Width="700px"  Height="100px" ></asp:TextBox>
  
                                    
                                    </td>
                            
                            </tr>
                        </table>
                   </div>
                </ContentTemplate>
              </asp:TabPanel>
          
                 <asp:TabPanel HeaderText="Notes" Visible="true" runat="server" ID="TabPanel5">
                <ContentTemplate>
                    <div style="visibility: visible; margin: 4px;"  class="detailEdit">
                        <table border="0" cellpadding="2" cellspacing="2" width="850px">
                            <tr>
                                <td   colspan="2"   style=" height:10px  "  ></td>
                            
                            </tr>
                            <tr>
                                    <th   style=" width:150px; "   >
                                      Notes:
                                    
                                    </th>
                            
                            
                                    <td  align="center">
                                      
                                        <asp:TextBox ID="TextBox2" runat="server"    TextMode="MultiLine"  Width="700px"  Height="240px" ></asp:TextBox>
  
                                    
                                    </td>
                            
                            </tr>
                        </table>
                   </div>
                </ContentTemplate>
              </asp:TabPanel>
        </asp:TabContainer>
  
        
        
        </td>
    </tr>
    <tr   style="   height:10px;  ">
        <td>
        
        
        </td>
    
    </tr>
  
   
     
  


    <tr>
        <td>
             <div id="Div3"  class="SaveCancelPanel"    style=" width:100%;  ">
    <table border="0" cellpadding="2" cellspacing="2" style="width: 100%; height: 100%;"
       >
        <tr>
            <td align="right">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="RightAdminPanel">
                            <table border="0" width="100%">
                                <tr>
                                    <td align="right">
                                      
                                        <asp:Button ID="bntSave" runat="server" Text="Save"  SkinID="bntMiddle" />
                                        <asp:Button ID="bntCancel" runat="server" Text="Cancel" SkinID="bntMiddle" />
                                     <asp:HyperLink runat="server"  id="rulelist" >HyperLink</asp:HyperLink>
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
   </table>
   </div>
   <script type="text/javascript">

       $('.pageBody').css('padding', '0');
       $('body>div').css('background-color', '#efefef')
       //$('.tab-tc:last').removeClass("tab-tc");
       
    </script>
  </asp:Content>