using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using System.Collections;
using Pelesys.Scheduling;
using eForm;
using eForm.Class;
using Pelesys.Web;
using Pelesys.Common;


namespace Pelesys.Scheduling.Web.Files
{
    public partial class ResourceDesign : System.Web.UI.Page
    {

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


        public Int32?  FormID
        {
            get
            {
                Pelesys.Scheduling.ResourceType oRT = Pelesys.Scheduling.ResourceType.GetDataBy(Convert.ToInt32(ResourceTypeID));
                if (oRT != null)
                {
                    return oRT.FormID;
                }
                else
                {
                    return 0;
                }
            }

        }

        public string DBTableName = string.Empty ;

        protected override void OnInit(EventArgs e)
        {
            
            DBTableName = "SCH.Resource";
            ctrFormDesign1.DBTableName = DBTableName;
            ctrFormDesign1.eFormID = Convert.ToInt32(FormID) ;
            ctrFormDesign1.CultureID = Convert.ToInt32( SessionManager.User.CultureLanguageID.ToString());
            base.OnInit(e);
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            #region E-Form Code and config


           


            if (!IsPostBack)
            {
                IniForm();


            }


            LoadeFormTabList( FormID);

            TabPanel oPanel = TabContainer1.ActiveTab;
            ctrFormDesign1.CurrentTab = TabContainer1;
            CurrentTabClientID = oPanel.ClientID;
            this.ctrFormDesign1.dragcssClass = cssDragClass;
            this.ctrFormDesign1.oPage = this.Page;
            this.ctrFormDesign1.AciveHidClient = hidActiveTab.ClientID;
            ctrFormDesign1.CreateFormDesignScript("Main", UpdatePanel1, TabContainer1);

            FormDesign.SetDataToControls(TabContainer1, ctrFormDesign1.DBTableName, ResourceID, IDColumnName, Convert.ToInt32( FormID));



            #endregion

            // this.ctrFormDesign1.EnlargeImageClientID = this.ImageEnlarge.ClientID;
        }

        #region E-Form Desing Code


        public string CurrentTabClientID = string.Empty;
        private string cssDragClass = "CssEformDragClass";

        public void InitTabs()
        {
            Session[FormDesign.SessionImageList] = null;

            IniField();
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
            this.TabContainer1.Attributes.Add("onmouseout", "hideToolTip()");

        }

        protected void LoadeFormTabList(Int32? FormID)
        {
            List<DesignFormTab> oTabList = DesignFormTab.GetDataBy( Convert.ToInt32( FormID));
            TabContainer1.Tabs.Clear();
            // tab list is empty, so add a new active tab as  a profile tab which should not be remove
            if (oTabList.Count == 0)
            {
                string TabProfileName = GetString("Profile", "Resource-DesignFormTab-Profile");
                string SysIdentity ="SystemIdentifier" + Pelesys.Scheduling.ResourceType.GetMaxTabID().ToString();

                AjexTabs.AddNewTabToTabContainer(TabContainer1, TabProfileName, SysIdentity,
                         TabProfileName, hidActiveTab.ClientID, true);

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

            if (TabContainer1.Tabs.Count > 0)
            {
                foreach (TabPanel panel in this.TabContainer1.Tabs)
                {
                    panel.Controls.Clear();

                    List<DesignFormField> oControlList = new List<DesignFormField>();
                    FormDesign oDesign = new FormDesign();
                    oDesign.oPage = this.Page;
                    DesignFormTab oTab = DesignFormTab.GetDataBySysIdentity(1, panel.ID);
                    if (oTab != null)
                    {
                       // oControlList = DesignFormField.GetDataBy(oTab.FormTabID, 1);
                      //  oDesign.SetPanelControl(panel, oControlList);
                    }

                }

                this.ctrFormDesign1.CreateImageControls(this.TabContainer1);
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

            }


            // TabContainer1.ActiveTabIndex = 1;


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
    }
}