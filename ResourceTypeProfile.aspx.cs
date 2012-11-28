using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pelesys.Web;
using Pelesys.Scheduling;
using AjaxControlToolkit;
using System.Collections;

using eForm;
using eForm.Class;

using Pelesys.Common;

namespace Pelesys.Scheduling.Web.Files
{
    public partial class ResourceTypeProfile : PageBase
    {

        public const string SessionTabList = "DesignFormTabList";

        private const string SaveMessage = "Save is done. Thank you!";

        public bool IsDesignMode
        {
            get
            {
                if (ViewState["IsDesignMode"] == null)
                {
                    return false;
                }
                return Convert.ToBoolean(ViewState["IsDesignMode"].ToString());
            }

            set
            {

                ViewState["IsDesignMode"] = value;
            }


        }



        public Int64 ResourceID
        {
            get
            {
                if (ViewState["ResourceID"] == null)
                {
                    return 0;
                }
                else if (ViewState["ResourceID"].ToString() == string.Empty)
                {
                    return 0;
                }


                return Convert.ToInt64(ViewState["ResourceID"].ToString());
            }

            set
            {

                ViewState["ResourceID"] = value;
            }


        }

        private string _IDColumName = "ResourceID";
        public string IDColumnName
        {
            get
            {


                return _IDColumName;
            }


        }


        public string ResourceTypeID
        {
            get
            {
                if (Request.QueryString["ResourceTypeID"] != null)
                {
                    ViewState["ResourceTypeID"] = Request.QueryString["ResourceTypeID"].ToString();
                    return ViewState["ResourceTypeID"].ToString();
                }
                else if (ViewState["ResourceTypeID"] != null)
                {
                    return ViewState["ResourceTypeID"].ToString();
                }

                return "0";

            }

        }


        public Int32? FormID
        {
            get
            {
                //Pelesys.Scheduling.ResourceType oRT = Pelesys.Scheduling.ResourceType.GetDataBy(Convert.ToInt32(ResourceTypeID));
                if (ctrFormDesign1.eFormID != 0  && IsDesignMode == true )
                {
                    return ctrFormDesign1.eFormID;
                }
                if (ddlDesignForm.SelectedValue != string.Empty)
                {
                    return Convert.ToInt32( ddlDesignForm.SelectedValue);
                }
                else  if (ddlDesignForm.SelectedValue == string.Empty)
                {
                    return 0;
                }
                else
                {
                    if (ctrFormDesign1.eFormID != 0)
                    {
                        return ctrFormDesign1.eFormID;
                    }

                    return 0;
                }
            }
          


        }

        public string DBTableName = string.Empty;

        protected override void OnInit(EventArgs e)
        {

            DBTableName = "SCH.Resource";
            ctrFormDesign1.DBTableName = DBTableName;
            if (ddlDesignForm.SelectedValue == string.Empty)
            {

                ctrFormDesign1.eFormID = Convert.ToInt32(FormID);
            }
            else
            {
                ctrFormDesign1.eFormID = Convert.ToInt16(   ddlDesignForm.SelectedValue) ;
            }
            ctrFormDesign1.CultureID = Convert.ToInt32(SessionManager.User.CultureLanguageID.ToString());
            base.OnInit(e);
        }

        void Page_Init(object sender, EventArgs e)
        {
            // this.gv.LoadListHandler = DataSource;
            Master.Master.PageTitle = GetString("Page_ResourceTypeProfilePageTitle", "Resource Type Profile");
            lblName.Text = GetString("Page_ResourceTypeProfileName", "Name:");
            lblDesc.Text = GetString("Page_ResourceTypeProfileDescription", "Description:");
            bntDesign.Text = GetString("Page_ResourceTypeofDesignButtonMode", "Design Mode");
            lblExisting.Text = GetString("Page_ResourceTypeOfExistingDesingLabel", "Existing Design");
            this.lblIsFixed.Text = GetString("Page_ResourceTypeProfileIsPortable", "Is this type of resource portable?");
            this.lblService.Text = GetString("Page_ResourceTypeIsProfileIsService", "Is this a service?");
           
            this.lblHasEventLimit.Text = GetString("Page_ResourceTypeLimitSource", "Is there a limit of concurrent schedule of the source?");
            this.lblHasEventRestriction.Text = GetString("Page_ResourceTypeEventRest", "Is there a restriction of number of times being used in a certain period of time?");
            this.lblIsDeplete.Text = GetString("Page_ResourceTypeIsDepleteMaterial", "Is it a deplete material?");

        }

        protected void SetFormList()
        {
            ctrFormDesign1.CurrentTab = this.TabContainer1;
            ddlDesignForm.DataTextField = "Name";
            ddlDesignForm.DataValueField = "FormID";
            ddlDesignForm.DataSource = Pelesys.Scheduling.DesignForm.GetDataBy(1);
            ddlDesignForm.DataBind();
        
            ddlDesignForm.Items.Add(new ListItem("",""));
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            #region E-Form Code and config




            
            if (!IsPostBack)
            {
              //Every time when reload this page, this tab session should be clear up
              Session[SessionTabList] = null;
              IniForm();
              
           
            }


         //   LoadeFormTabList(FormID);
            TabPanel oPanel = TabContainer1.ActiveTab;
            if (oPanel != null)
            {
                ctrFormDesign1.CurrentTab = TabContainer1;

                CurrentTabClientID = oPanel.ClientID;
            }
            this.ctrFormDesign1.dragcssClass = cssDragClass;
            this.ctrFormDesign1.oPage = this.Page;
           this.ctrFormDesign1.AciveHidClient = hidActiveTab.ClientID;
            ctrFormDesign1.CreateFormDesignScript("Main", UpdatePanel1, TabContainer1);

        
           FormDesign.SetDataToControls(TabContainer1, ctrFormDesign1.DBTableName, ResourceID, IDColumnName, Convert.ToInt32(FormID));



            #endregion

            // pass current tab control 
            // and figour out current form id or not
           if (!IsPostBack)
           {
               this.radManaged.Checked = true;
            //  this.radInventory.Checked = true;


               SetFormList();
               ddlDesignForm.Items.Insert(0, new ListItem("","0"));

               if (!IsPostBack)
               {
                   if (Session["ReloadForm"] != null )
                   {
                       ddlDesignForm.SelectedValue = Session["EformID"].ToString();
                       ctrFormDesign1.eFormID = Convert.ToInt32(FormID);
                       
                       //Save new image 
                    
                     
                          Hashtable oImageList = (Hashtable)Session["ReloadForm"];
                          if (oImageList != null)
                          {
                              foreach (object sKey in oImageList.Keys)
                              {
                                  string FieldName = sKey.ToString();
                                  int pos = FieldName.IndexOf("Field");
                                  FieldName = FieldName.Substring(pos);
                                  List<DesignFormField> oList = DesignFormField.GetDataByFieldName( Convert.ToInt32(FormID), FieldName);
                                  DesignFormField oDesign = oList.FirstOrDefault();
                                  if (oDesign != null)
                                  {
                                      oDesign.ImagePath = oImageList[sKey].ToString();
                                      DesignFormField.Save<DesignFormField>(oDesign);
                                      break;
                                  }
                              }
                          }
                      

                       Session["ReloadForm"] = null;
                     //  IniField();
                   }
                        
               }
           
            //   this.radManaged.Checked =true;
             checkOutCheckBox();

             //  radManaged.Attributes.Add("onclick", " EnableRadio('" +  this.lblEventLimit.ClientID  + "','"  + this.txtEventLimit.ClientID  + "','" +  this.lblIsDeplete.ClientID +"','"  +  this.chkIsDeplete.ClientID
               //    +"', 'true')");
           }


       
        }


        #region E-Form Desing Code


        public string CurrentTabClientID = string.Empty;
        private string cssDragClass = "CssEformDragClass";

        public void InitTabs()
        {
            Session[FormDesign.SessionImageList] = null;
           // if (IsDesignMode)
            {
                IniField();
            }
        }

        protected void IniForm()
        {

            if (Request.QueryString["DataID"] != null && Request.QueryString["DataID"].ToString() != string.Empty)
            {
                ResourceID = Convert.ToInt64(Request.QueryString["DataID"].ToString());
            }
            if (Request.QueryString["NewProfile"] != null)
            {
                Session[FormDesign.ImageList] = null;
            }
            if (Session[FormDesign.SessionImageList] == null)
            {
                Session[FormDesign.ImageList] = null;
            }
            else
            {
                Session[FormDesign.SessionImageList] = null;
            }
           
           // this.TabContainer1.Attributes.Add("onmouseout", "hideToolTip()");

        }

        protected void LoadeFormTabList(Int32? FormID)
        {
            List<DesignFormTab> oTabList = DesignFormTab.GetDataBy(Convert.ToInt32(FormID));

            // First tab was default table should not remove
           //    TabContainer1.Tabs.Clear();
            if (TabContainer1.Tabs.Count > 1)
            { 
                // keep the first one, remove all 
                foreach (  TabPanel oTab   in TabContainer1.Tabs    )
                {
                    if (oTab.TabIndex > 1)
                    {
                       TabContainer1.Tabs.Remove(oTab);
                    }
                
                }
            }
            // tab list is empty, so add a new active tab as  a profile tab which should not be remove
            if ( oTabList.Count == 0  )
            {

                // add a new table if eform id =0
             

            //    string TabProfileName = GetString("Resource-DesignFormTab-Profile", "Profile");
            //    string SysIdentity = "ResourceTypeSystemIdentifier" + Pelesys.Scheduling.ResourceType.GetMaxTabID().ToString();

            //    AjexTabs.AddNewTabToTabContainer(TabContainer1, TabProfileName, SysIdentity,
            //             TabProfileName, hidActiveTab.ClientID, true);


            //    string TabDesingName = GetString("Resource-DesignFormTab-Design", "Design");
            //    string SysDesignIdentity = "ResourceTypeSystemIdentifier" + Pelesys.Scheduling.ResourceType.GetMaxTabID().ToString();

            //    AjexTabs.AddNewTabToTabContainer(TabContainer1, TabDesingName, SysDesignIdentity,
            //             TabProfileName, hidActiveTab.ClientID, true);
                if (FormID == 0)
                {
                    if (!IsPostBack)
                    {
                        //if (TabContainer1.Tabs.Count == 1)
                        //{
                        //    TabPanel oNewTab = new TabPanel();
                        //    oNewTab.HeaderText = "NewTab1";
                        //    Guid oNewGuid = Guid.NewGuid();
                        //    oNewTab.ID = oNewGuid.ToString();
                        //    oNewTab.TabIndex = 1;
                        //    TabContainer1.Tabs.Add(oNewTab);
                        //    if (Session["DesignFormTabList"] == null)
                        //    {
                        //        List<DesignFormTab> oTabLiist = new List<DesignFormTab>(); 
                        //        foreach (TabPanel otp in TabContainer1.Tabs)
                        //        {
                        //            DesignFormTab oTab = new DesignFormTab();
                        //            oTab.SysIdentity = otp.ID;
                        //            oTab.FormID = Convert.ToInt32( FormID);
                        //            oTab.Name = otp.HeaderText;
                        //            oTab.IsVisible = true;
                        //            oTab.IsEnabled = true;
                        //            oTabLiist.Add(oTab);


                        //        }
                        //    }
                        //}
                    }
                }


                if ( Session["DesignFormTabList"] != null )
                {
                    List<DesignFormTab> oList = Session["DesignFormTabList"]  as List<DesignFormTab>;

                   


                   foreach ( DesignFormTab oTab in oList   )
                   {
                       Boolean IsAlreadyLoad = false;
                       foreach (TabPanel oPanel in TabContainer1.Tabs)
                       {
                           if (oTab.Name.ToUpper() == oPanel.HeaderText.ToUpper())
                           {
                               IsAlreadyLoad = true;
                               break;
                           
                           }


                       }
                       if (!IsAlreadyLoad)
                       {
                           AjexTabs.AddNewTabToTabContainer(TabContainer1, oTab.Name, oTab.SysIdentity,
                           oTab.Description, hidActiveTab.ClientID, Convert.ToBoolean(oTab.IsEnabled));
                       }
                    }
                }

            }
            else
            {
                foreach (DesignFormTab otab in oTabList)
                {
                    if (otab.IsVisible == true)
                    {
                        AjexTabs.AddNewTabToTabContainer(TabContainer1, otab.Name, otab.SysIdentity,
                            otab.Description, hidActiveTab.ClientID, Convert.ToBoolean(otab.IsEnabled));


                    }

                }

                if (Session["DesignFormTabList"] != null)
                {
                    List<DesignFormTab> oList = Session["DesignFormTabList"] as List<DesignFormTab>;

                    foreach (DesignFormTab oTab in oList)
                    {
                        Boolean IsAlreadyLoad = false;
                        foreach (TabPanel oPanel in TabContainer1.Tabs)
                        {
                            if (oTab.SysIdentity.ToUpper() == oPanel.ID.ToUpper())
                            {
                                IsAlreadyLoad = true;
                                break;

                            }


                        }
                        if (!IsAlreadyLoad)
                        {
                            AjexTabs.AddNewTabToTabContainer(TabContainer1, oTab.Name, oTab.SysIdentity,
                            oTab.Description, hidActiveTab.ClientID, Convert.ToBoolean(oTab.IsEnabled));
                        }
                    }
                }

            }

            TabContainer1.ActiveTabIndex = 0;
            InitTabs();
        }



        // ini properties of eform design to config
        // this design interface based on different cases


        //design enable or not enable
        protected void EFormDesignOnCheckChanged(object sender, EventArgs e)
        {
            Guid jsfuncID = Guid.NewGuid();
            string sJSFunction = @"EFormShowPanel(true, 'EFormDesignWidnow');";
            //  if (this.chkDesign.Checked)
            {
                SetEFormDesingWindowProperties();
                IsDesignMode = true;
                ScriptManager.RegisterStartupScript(upEnableEFormDesign, upEnableEFormDesign.GetType(), jsfuncID.ToString(), sJSFunction, true);
                Guid gMessage = Guid.NewGuid();

                string sJavascript = "eFormChangeClassForDrag('" + cssDragClass + "', true);editbox_init()";
                //  ScriptManager.RegisterStartupScript(this.UpdatePanel2, GetType(), gMessage.ToString(), sJavascript, true);

            }
            // else
            {
                sJSFunction = @"EFormShowPanel(false, 'EFormDesignWidnow');window.location.href=window.location.href;";
                ScriptManager.RegisterStartupScript(upEnableEFormDesign, upEnableEFormDesign.GetType(), jsfuncID.ToString(), sJSFunction, true);
                IsDesignMode = false;
            }
        }


        protected void SetEFormDesingWindowProperties()
        {
            this.ctrFormDesign1.IsFieldOnly = true;


        }


        protected void IniField()
        {
            List<DesignFormTab> oTabList = new List<DesignFormTab>();
            if (Session["DesignFormTabList"] != null)
            { 
                oTabList = Session["DesignFormTabList"] as List<DesignFormTab>;
            }
            else
            {

                oTabList = DesignFormTab.GetDataBy(Convert.ToInt32(FormID));
                Session["DesignFormTabList"] = oTabList;

            }
           

            // First tab was default table should not remove
            //    TabContainer1.Tabs.Clear();
          

         //   if (FormID > 0)
            {
                if (TabContainer1.Tabs.Count > 1)
                {
                    // keep the first one, remove all 
                    foreach (TabPanel oTab in TabContainer1.Tabs)
                    {
                        if (oTab.ID.ToLower() != "tabs")
                        {
                            TabContainer1.Tabs.Remove(oTab);
                        }

                    }
                }

                foreach (DesignFormTab oTab in oTabList)
                {
                    Boolean IsAlreadyLoad = false;
                    //foreach (TabPanel oPanel in TabContainer1.Tabs)
                    //{
                    //    if (oTab.Name.ToUpper() == oPanel.HeaderText.ToUpper())
                    //    {
                    //        IsAlreadyLoad = true;
                    //        break;

                    //    }
                    //    if (oPanel.HeaderText == string.Empty)
                    //    {
                    //        TabContainer1.Tabs.Remove(oPanel);
                    //        IsAlreadyLoad = false;
                    //    }

                    //}
                    TabPanel otab = TabContainer1.FindControl(oTab.SysIdentity) as TabPanel;
                    if (otab == null )
                    {
                        AjexTabs.AddNewTabToTabContainer(TabContainer1, oTab.Name, oTab.SysIdentity,
                        oTab.Description, hidActiveTab.ClientID, Convert.ToBoolean(oTab.IsEnabled));
                    }
                }
               
            
            }

            if (ctrFormDesign1.ActiveTabID != string.Empty)
            {
                TabPanel oTP = TabContainer1.FindControl(ctrFormDesign1.ActiveTabID) as TabPanel;
                TabContainer1.ActiveTab = oTP;
            }

            //LoadeFormTabList(FormID);
            if (TabContainer1.Tabs.Count > 0)
            {
                foreach (TabPanel panel in this.TabContainer1.Tabs)
                {
                    if ( panel.TabIndex >0 )
                    {
                    panel.Controls.Clear();

                    List<DesignFormField> oControlList = new List<DesignFormField>();
                    FormDesign oDesign = new FormDesign();
                    oDesign.oPage = this.Page;
                    
                    DesignFormTab oTab = DesignFormTab.GetDataBySysIdentity(Convert.ToInt32(FormID), panel.ID);
                    if (oTab != null)
                    {
                        oControlList = DesignFormField.GetDataBy(oTab.SysIdentity, Convert.ToInt32( FormID));
                        oDesign.SetPanelControl(panel, oControlList);
                    }
                    }
                }

                this.ctrFormDesign1.CreateImageControls(this.TabContainer1);
            }

            else
            {


            }

        }

        protected override void OnPreRender(EventArgs e)
        {

            if (IsDesignMode)
            {

                // 
                this.TabContainer1.CssClass = "eFormDesign";
               
                if (this.ctrFormDesign1.IsEnable)
                {
                    IniField();

                    this.ctrFormDesign1.CreateFormDesignScript("Main", UpdatePanel1, TabContainer1);
                    this.ctrFormDesign1.IsEnable = false;
                }
                Guid newscript = new Guid();
                string sJavascript = "eFormChangeClassForDrag('" + cssDragClass + "', true);editbox_init()";
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.UpdatePanel1.GetType(), newscript.ToString(), sJavascript, true);

                DesignFormTab otab = DesignFormTab.Load<DesignFormTab>(this.ctrFormDesign1.SelectedTabID);
                if (otab != null)
                {
                    FormDesign.SetActiveIndex(TabContainer1, otab.Name, otab.SysIdentity);
                }

               // this.ctrFormDesign1.IsEnable = false;
            }
            else
            {

                this.TabContainer1.CssClass = "gray";
                IniField();
                ddlDesignForm.Enabled = true;
            }
            // TabContainer1.ActiveTabIndex = 1;

           //

            if (ctrFormDesign1.ActiveTabID != string.Empty)
            {
                TabPanel oTP = TabContainer1.FindControl(ctrFormDesign1.ActiveTabID) as TabPanel;
                if (oTP != null)
                {
                    TabContainer1.ActiveTab = oTP;
                }
            }
            base.OnPreRender(e);
        }




        #endregion


        #region Save
        protected void Save(object sender, EventArgs e)
        {
            //Validation Fields
            FormDesign oForm = new FormDesign();
            Hashtable oHT = oForm.ValidateMandatoryFields(ctrFormDesign1.eFormID, TabContainer1);
            if (oHT != null)
            {
                Guid oguid = new Guid();
                string Msg = oHT["Message"].ToString();
                string oControlClientID = oHT["ClientID"].ToString();

                int TabID = Convert.ToInt16(oHT["TabID"].ToString());
                DesignFormTab otab = DesignFormTab.Load<DesignFormTab>(TabID);
                if (otab != null)
                {
                    FormDesign.SetActiveIndex(TabContainer1, otab.Name, otab.SysIdentity);
                }


                ScriptManager.RegisterStartupScript(UpdatePanel1, this.GetType(), oguid.ToString(), "showToolTip(event,'" + Msg + "', '" + oControlClientID + "',  true);", true);

                return;
            }
            Guid oFinalguid = new Guid();
            try
            {
                FormDesign oFD = new FormDesign();
                oFD.SaveTabsData(ResourceID, TabContainer1, ctrFormDesign1.DBTableName, ctrFormDesign1.eFormID, IDColumnName);

                DesignFormTab otab = DesignFormTab.GetDataBySysIdentity(this.ctrFormDesign1.eFormID, hidActiveTab.Value);
                if (otab != null)
                {
                    FormDesign.SetActiveIndex(TabContainer1, otab.Name, otab.SysIdentity);
                }
            }
            catch (Exception ex)
            {
                string Msg = ex.Message.Replace("/", " ");
                Msg = Msg.Replace(" \" ", string.Empty);
                Msg = "We have problems to save data.";

                ScriptManager.RegisterStartupScript(UpdatePanel1, this.GetType(), oFinalguid.ToString(), "callMessageBox('eFormWarnStatus','" + Msg + "');", true);
                return;
            }

            ScriptManager.RegisterStartupScript(UpdatePanel1, this.GetType(), oFinalguid.ToString(), "callMessageBox('eFormSucessStatus','" + SaveMessage + "');", true);

        }
        #endregion



        public string GetString(string key, string defaultValue)
        {
            string language = SessionManager.CurrentLanguage.Replace("-", string.Empty);
            int pageId = 0;
            return Translation.GetTranslationByKey(key, pageId, language, defaultValue);
        }


        private void checkOutCheckBox()
        {
            if (radInventory.Checked == true)
            {
                chkIsDeplete.Visible = true;
               // chkIsFixed.Enabled = false;
               // chkHasEventLimit.Enabled = false;
                chkIsService.Visible = false;
                lblIsDeplete.Visible = true;
                lblService.Visible =false ;
                txtEventLimit.Visible = false;
                lblEventLimit.Visible = false ; 
            }
            else if ( radManaged.Checked == true )
            {

                chkIsService.Visible = false;
                chkHasEventLimit.Visible = false;
                chkIsDeplete.Visible = false;
                chkIsFixed.Visible = false;
                chkHasEventRestriction.Visible = false;

                lblIsFixed.Visible = false;
                lblHasEventLimit.Visible = false;
                lblIsDeplete.Visible = false;
                lblHasEventRestriction.Visible = false;
                lblService.Visible = false;
                txtEventLimit.Visible = true;
                lblEventLimit.Visible = true; 

            }

        
        
        }



        protected void RadioInventory_CheckedChanged(Object sender,
                                       EventArgs e)
        {
          //  LoadeFormTabList(FormID);
           // ctrFormDesign1.eFormID = Convert.ToInt32( FormID);
        }

        protected void RadioManage_CheckedChanged(Object sender,
                                         EventArgs e)
        {


           checkOutCheckBox();
        }


        protected void FormLit_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Session["DesignFormTabList"] = null;
            ctrFormDesign1.eFormID = Convert.ToInt32(FormID);
            if (FormID == 0)
            {
                if (TabContainer1.Tabs.Count > 1)
                {
                    // keep the first one, remove all 
                    foreach (TabPanel oTab in TabContainer1.Tabs)
                    {
                        if (oTab.ID.ToLower() != "tabs")
                        {
                            TabContainer1.Tabs.Remove(oTab);
                        }

                    }
                }
            }
        }

        private void DesignMode()
        {
            Guid jsfuncID = Guid.NewGuid();
            string sJSFunction = @"EFormShowPanel(true, 'EFormDesignWidnow');";
            this.ctrFormDesign1.IsEnable = true;
            ctrFormDesign1.IsStatDesign = true;
            ctrFormDesign1.IsDesignMode = true;
            SetEFormDesingWindowProperties();
            IsDesignMode = true;
            ScriptManager.RegisterStartupScript(upEnableEFormDesign, upEnableEFormDesign.GetType(), jsfuncID.ToString(), sJSFunction, true);
            Guid gMessage = Guid.NewGuid();

            string sJavascript = "eFormChangeClassForDrag('" + cssDragClass + "', true);editbox_init()";
            IsDesignMode = true;
            TabContainer1.ActiveTabIndex = 1;
            bntDesign.Text = GetString("Page_ResourceTypeofDesignButtonStatusNormalMode", "Normal Mode");
            if (ddlDesignForm.SelectedValue == string.Empty)
            {
                Session["DesignFormTabList"] = null;
                ctrFormDesign1.eFormID = 0;
            }
            else
            {
                ctrFormDesign1.eFormID = Convert.ToInt32(ddlDesignForm.SelectedValue);
            }
            ddlDesignForm.Enabled = true;
            ctrFormDesign1.LoadTabs(true);
            ctrFormDesign1.eFormName = ddlDesignForm.SelectedItem.Text;
            foreach (TabPanel oTab in TabContainer1.Tabs)
            {
                if (oTab.TabIndex == 0)
                {
                    oTab.Enabled = false;
                    break;
                }

            }
            ddlDesignForm.Enabled = false;
        
        
        }


        protected void OnDesignButtonClick(object sender, EventArgs e)
        {

            Guid jsfuncID = Guid.NewGuid();
            string sJSFunction = @"EFormShowPanel(true, 'EFormDesignWidnow');";
            if (IsDesignMode == false)
            {

                DesignMode();
            
               
                
            }
            else
            {
                ctrFormDesign1.IsDesignMode = true;
                sJSFunction = @"EFormShowPanel(false, 'EFormDesignWidnow');";// @"EFormShowPanel(false, 'EFormDesignWidnow');window.location.href=window.location.href;";
                ScriptManager.RegisterStartupScript(upEnableEFormDesign, upEnableEFormDesign.GetType(), jsfuncID.ToString(), sJSFunction, true);
                IsDesignMode = false;
                TabContainer1.ActiveTabIndex = 0;
                bntDesign.Text = GetString("Page_ResourceTypeofDesignButton", "Design");
                ddlDesignForm.Enabled = false;
                TabContainer1.Tabs[0].Visible = true;
                
               
                if (ctrFormDesign1.eFormID != 0)
                {
                    SetFormList();

                    ddlDesignForm.SelectedValue = ctrFormDesign1.eFormID.ToString();
                }


                foreach (TabPanel oTab in TabContainer1.Tabs)
                {
                    if (oTab.TabIndex == 0)
                    {
                        oTab.Enabled = true ;
                        break;
                    }

                }
            }
        
        }


    }
}