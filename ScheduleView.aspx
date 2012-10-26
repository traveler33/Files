<%@ Page Language="C#"  MasterPageFile="~/Master/Main.Master" AutoEventWireup="true" CodeBehind="ScheduleView.aspx.cs" Inherits="Pelesys.Scheduling.Web.Files.ScheduleView" %>

<%@ MasterType VirtualPath="~/Master/Main.Master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
 
 
    <script src="../codebase/dhtmlxscheduler.js" type="text/javascript" charset="utf-8"></script>
   
    <link rel="stylesheet" href="../codebase/dhtmlxscheduler.css" type="text/css" media="screen" title="no title" charset="utf-8">

	<script src="../codebase/ext/dhtmlxscheduler_minical.js" type="text/javascript" charset="utf-8"></script>
   <script src="../codebase/ext/dhtmlxscheduler_units.js" type="text/javascript" charset="utf-8"></script>
   <style type="text/css" media="screen">
   html, body{
      margin:0px;
      padding:0px;
      height:100%;
      overflow:hidden;
   }   
</style>
<script type="text/javascript" charset="utf-8">

    function init() {
    
   
        scheduler.config.multi_day = true;

        scheduler.config.full_day = true;
        scheduler.config.event_duration = 35;

        scheduler.config.xml_date = "%Y-%m-%d %H:%i";
        scheduler.init('scheduler_here', new Date(2010, 0, 10), "week");
        scheduler.load("../common/events.xml");

        scheduler.config.lightbox.sections = [
			{ name: "description", height: 200, map_to: "text", type: "textarea", focus: true },
			{ name: "time", height: 72, type: "calendar_time", map_to: "auto" }
		];


        var sections = [
		{ key: 1, label: "Section A" },
		{ key: 2, label: "Section B" },
		{ key: 3, label: "Section C" },
		{ key: 4, label: "Section D" },
        { key: 5, label: "Section E" }
	    ];
        scheduler.locale.labels.units_tab = 'Rooms';
        //scheduler.locale.labels.unit_tab = "Unit";
        scheduler.createUnitsView({
            name: "unit",
            property: "section_id",
            list: sections
        });


        //      scheduler.createUnitsView({
        //            name: "unit",
        //            property: "section_id",
        //            list: sections,
        //            size: 10,
        //            step: 5
        //        });


    }

  
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server"  >
                                                 <div style="height:100%; width: 100%; border: 1px lightgray solid; overflow: auto;">
                                                                <div class="resultGridView">
                                                                   <dx:ASPxGridView ID="gv" ClientInstanceName="grid" runat="server" 
                                                               KeyFieldName="UserID"     Border-BorderColor="LightGray" Border-BorderStyle="Solid"
                                                                Border-BorderWidth=1   Font-Names="Verdana" Font-Size="10px"  ForeColor="#342F2F"  
                                                             AutoGenerateColumns="False"   Theme="Office2003Blue"
                                                                    EnableRowsCache="True" Width="100%" DataSourceForceStandardPaging="False" SettingsPager-AlwaysShowPager="True" SettingsPager-Position="Bottom">
                                                                    <Columns>
                                                                  
                                                             

                                                                     <dx:GridViewDataHyperLinkColumn  Caption="Start Time" VisibleIndex="2">
                                                                        <DataItemTemplate>
                                                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="2012-12-33 14:00">
                                                                            </dx:ASPxLabel>
                                                                        </DataItemTemplate>
                                                                     </dx:GridViewDataHyperLinkColumn>
                                                                     
                                                                         <dx:GridViewDataHyperLinkColumn  Caption="End Time" VisibleIndex="2">
                                                                        <DataItemTemplate>
                                                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="2012-12-33 18:00">
                                                                            </dx:ASPxLabel>
                                                                        </DataItemTemplate>
                                                                     </dx:GridViewDataHyperLinkColumn>

                                                                      <dx:GridViewDataHyperLinkColumn  Caption="Curriculum" VisibleIndex="3">
                                                                        <DataItemTemplate>
                                                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Curriculum 101">
                                                                            </dx:ASPxLabel>
                                                                        </DataItemTemplate>
                                                                     </dx:GridViewDataHyperLinkColumn>


                                                                       <dx:GridViewDataHyperLinkColumn  Caption="Courses" VisibleIndex="4">
                                                                        <DataItemTemplate>
                                                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Security 2004">
                                                                            </dx:ASPxLabel>
                                                                        </DataItemTemplate>
                                                                     </dx:GridViewDataHyperLinkColumn>

                                                                 
                                                                    <dx:GridViewDataColumn FieldName="FirstName" VisibleIndex="5"  Caption="Instructors" SortOrder="Ascending"   />
                                                                        <dx:GridViewDataImageColumn Caption="Detail" VisibleIndex="6">
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
                                                                      <SettingsPager PageSize="20">
                                                                        <PageSizeItemSettings Visible="true"  ShowAllItem="true" />
                                                                    </SettingsPager>
                                                                    </dx:ASPxGridView>



                                                                </div>
                                                                </div>
  
</asp:Content>