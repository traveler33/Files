using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using eForm.Class;
using Pelesys.Scheduling;

using AjaxControlToolkit;

namespace eForm.files
{
    public partial class FileUpload : System.Web.UI.Page
    {
        public const string UploadImageTitle="Upload Image";
        public static string UploadImage = "UploadImageType";
        public static string UploadFile = "UploadFileType";
        public static string UploadImportFile = "UploadImportType";
        public static string UploadDesignImageFoldere = "AppUpload";
        public const string AdminFileUploadValidateFileTypeMsgValue = "The file type must be gif, pnd, and Jpg.";
        public const string AdminFileUploadValidateFileSizeMsgValue = "File size can not be larger than ";
       // public const string ImageList = "UploadImageList";

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title = UploadImageTitle;
            this.lblUploadImage.Text = UploadImageTitle;
            this.bntUploadFileOnDesign.Text = "OK" ;
            this.bntUploadFileCloseOnDesign.Text ="Cancel";
           
            this.bntUploadFileCloseOnDesign.Attributes.Add("onclick", "ShowPanel(false, 'DivUploadImgeOnDesign'); return false;");
            this.bntUploadFileCloseOnDesign.Attributes.Add("onclick", "window.close();");
            //ImageHiddenPath
            if (Request.QueryString["ImageClientID"] != null)
            {
                ViewState["ImageClientID"] = Request.QueryString["ImageClientID"].ToString();
            }
            if (Request.QueryString["ImageHiddenPath"] != null)
            {
                ViewState["ImageHiddenPathClientID"] = Request.QueryString["ImageHiddenPath"].ToString();
            }


        }

        protected void UploadImageOnDesign(object sender, EventArgs e)
        {
           
            if (!IsValidFile())
            {

                return;
            }

            //upload file
            string sFileName = FileUploadManager.UploadThisFile(this.ImageUpload, true, this.Page, false, UploadDesignImageFoldere);

            sFileName = FileUploadManager.GetFileNameFromFileFullPath(sFileName);

            string ImagePath = UploadDesignImageFoldere + @"/" + sFileName;
            //pass a new file to the opener window
            Session[ViewState["ImageHiddenPathClientID"].ToString()] = ImagePath;

            string ImageClientID = ViewState["ImageHiddenPathClientID"].ToString().Replace("_HidImagePath", string.Empty);

            Hashtable oImageList = new Hashtable();
            Boolean IsNotAddImage = false;
            if (Session[FormDesign.ImageList] != null)
            {
                oImageList = Session[FormDesign.ImageList] as Hashtable;
                foreach (var key in oImageList.Keys)
                {
                    if (key.ToString() == ImageClientID)
                    {
                        oImageList[key] ="/" + ImagePath;
                        IsNotAddImage = true;
                        break;
                    }

                }

                if (!IsNotAddImage)
                {
                    oImageList.Add(ImageClientID, "/" + ImagePath);
                }

            }
          
            else
            {

                oImageList.Add(ImageClientID, "/" + ImagePath);
                                  

            }
            Session[FormDesign.ImageList] = oImageList;
            Session[FormDesign.SessionImageList] = oImageList;

            Session["ReloadForm"] = oImageList;
           
           ScriptManager.RegisterStartupScript(this, typeof(string), "script",  "<script type=text/javascript> parent.location.href = parent.location.href;</script>", false); 

            //string JsFunction = @"window.opener.document.getElementById('" + ViewState["ImageClientID"].ToString() + "').src = encodeURI('" + ImagePath + "'); "
            //+ "window.opener.document.getElementById('" + ViewState["ImageHiddenPathClientID"].ToString() + "').value = encodeURI('" + ImagePath + "');"
            //+ " window.close();";
            //ClientJSManager.CallClientFunctionByName(JsFunction);

        }


        private Boolean IsValidFile()
        {
            //check empty


            if (!this.ImageUpload.HasFile)
            {
                // ValidateMsg( TranslationManager.GetTranslationByKey( TranslationManager.TranslationAdminFileUploadValidateFileMsgKey));
                ClientJSManager.ClientMessage(this.Page, "ValidateUploadFile", AdminFileUploadValidateFileTypeMsgValue);

                return false;
            }

            //check file type

            if (!FileUploadManager.IsRightFileExtensionToUpload(this.ImageUpload.FileName, UploadImage))
            {
                ClientJSManager.ClientMessage(this.Page, "ValidateUploadFileType", AdminFileUploadValidateFileTypeMsgValue);
                //  ClientJSManager.CallClientFunctionByName("SetHidSaveValue('" + this.HidSave.ClientID + "')");    
                //  ValidateMsg(TranslationManager.GetTranslationByKey(TranslationManager.TranslationAdminFileUploadValidateFileMsgKey));
                return false;
            }



            //check file size
            if (!FileUploadManager.CheckFileSize(this.ImageUpload.PostedFile.ContentLength))
            {
                string AllowMaxFileSize = Option.GetOptionByKey("SysUploadFileMaxFileSizeKey");
                ClientJSManager.ClientMessage(this.Page, "ValidateUploadFileType", AdminFileUploadValidateFileSizeMsgValue + " " + AllowMaxFileSize);
                //    ClientJSManager.CallClientFunctionByName("SetHidSaveValue('" + this.HidSave.ClientID + "')");
                return false;
            }





            return true;
        }
    }
}