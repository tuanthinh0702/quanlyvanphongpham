using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Manager;
namespace Musicviet.Administrators.Modules
{
    public partial class Slider : System.Web.UI.UserControl
    {
        private int id = 0;

        protected string imageName
        {
            get
            {
                return ViewState["ImageName"].ToString();
            }
            set
            {
                ViewState["ImageName"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            id = Request.QueryString["id"] != null ? Int32.Parse(Request.QueryString["id"].ToString()) : 0;
            if (IsPostBack)
                return;
            this.imageName = "";
            if (id > 0)
                BindObject(id);

        }
        private void BindObject(int objID)
        {
            SliderInfo obj = SliderManager.Select(objID);

            if (obj != null)
            {
                txtName.Text = obj.SliderName;
                txtDetailText.Value = obj.SliderContent;
                txtLink.Text = obj.SliderLink;
                img1.DescriptionUrl = "/Upload/" + obj.SliderImage;
                img1.ImageUrl = "/Upload/" + obj.SliderImage;
                imageName = obj.SliderImage;
                lblImg1.Text = this.imageName;
                ddlCategory.SelectedValue = obj.SliderClass;

            }
        }

        #region Upload Image
        private void UploadImg(FileUpload updUploadFile, Label lblErr, out string savedFileName)
        {
            savedFileName = "";
            try
            {
                string strRootPath = Server.MapPath("/Upload/");

                //Create directory
                string dir_name = DateTime.Now.ToString("yyyyMMdd");
                if (!System.IO.Directory.Exists(strRootPath + dir_name))
                    Directory.CreateDirectory(strRootPath + dir_name);

                //Fix the relative path to physical path to upload
                string strExt = Path.GetExtension(updUploadFile.PostedFile.FileName).ToLower().Replace(".", "");
                savedFileName = dir_name + "/" + updUploadFile.FileName;
                string strFilePath = strRootPath + savedFileName;

                if ((strExt == "jpg") || (strExt == "png") || (strExt == "gif") || (strExt == "jpeg"))
                {
                    // If not exist a file then load this file
                    if (!File.Exists(strFilePath))
                    {
                        updUploadFile.SaveAs(strFilePath);
                        updUploadFile.Dispose();
                        lblErr.Text = "File <" + savedFileName + "> upload thành công. ";
                        //the nay la xong oke
                    }
                    // If existed or save process has error then alert message
                    else
                    {
                        lblErr.Text = "File <" + savedFileName + "> đã tồn tại, vui lòng đổi tên!.";
                        savedFileName = "";
                    }
                }
                else
                {
                    lblErr.Text = "Chỉ được upload file định dạng JPG, GIF, PNG";
                    savedFileName = "";
                }
            }
            catch (Exception ex)
            {
                lblErr.Text = ex.Message;
                savedFileName = "";
            }
        }


        private bool ThumbnailCallback()
        {
            return true;
        }

        protected void lbtnImg1_Click(object sender, System.EventArgs e)
        {
            //Upload image
            if (upImg1.FileName != "")
            {
                string image = "";
                UploadImg(upImg1, lblError, out image);
                this.imageName = image;
                this.img1.ImageUrl = "~/Upload/" + this.imageName;
            }
            else
                lblImg1.Text = "<i>browse a file</i>";
        }

        #endregion
        #region upload soft
        private void UploadSoft(FileUpload updUploadFile, Label lblErr, out string savedFileName)
        {
            savedFileName = "";
            try
            {
                string strRootPath = Server.MapPath("/Upload/");

                //Create directory
                string dir_name = DateTime.Now.ToString("yyyyMMdd");
                if (!System.IO.Directory.Exists(strRootPath + dir_name))
                    Directory.CreateDirectory(strRootPath + dir_name);

                //Fix the relative path to physical path to upload
                string strExt = Path.GetExtension(updUploadFile.PostedFile.FileName).ToLower().Replace(".", "");
                savedFileName = dir_name + "/" + updUploadFile.FileName;
                string strFilePath = strRootPath + savedFileName;

                if ((strExt == "rar") || (strExt == "zip"))
                {
                    // If not exist a file then load this file
                    if (!File.Exists(strFilePath))
                    {
                        // Create thumbnail image

                        updUploadFile.SaveAs(strFilePath);
                        updUploadFile.Dispose();
                        lblErr.Text = "File <" + savedFileName + "> upload thành công. ";
                    }
                    // If existed or save process has error then alert message
                    else
                    {
                        lblErr.Text = "File <" + savedFileName + "> đã tồn tại, vui lòng đổi tên!.";
                        savedFileName = "";
                    }
                }
                else
                {
                    lblErr.Text = "Chỉ được upload file định dạng rar,zip";
                    savedFileName = "";
                }
            }
            catch (Exception ex)
            {
                lblErr.Text = ex.Message;
                savedFileName = "";
            }
        }
        #endregion

        protected void SaveData()
        {
            if (this.ddlCategory.SelectedValue == "0")
            {
                this.lblError.Text = "Hãy chọn kiểu";
                return;
            }
            try
            {
                if (id > 0)
                {
                    SliderInfo info = new SliderInfo();
                    info.SliderName = txtName.Text.Trim();
                    info.SliderContent = txtDetailText.Value;
                    info.SliderImage = imageName;
                    info.SliderLink = txtLink.Text.Trim();
                    info.SliderClass = ddlCategory.SelectedValue.ToString();
                    info.SliderID = id;
                    SliderManager.Update(info);
                }
                else
                {
                    //this is a new object.  
                    SliderInfo info = new SliderInfo();
                    info.SliderName = txtName.Text.Trim();
                    info.SliderContent = txtDetailText.Value;
                    info.SliderImage = imageName;
                    info.SliderLink = txtLink.Text.Trim();
                    info.SliderClass = ddlCategory.SelectedValue.ToString();
                    SliderManager.Insert(info);
                }

                this.lblError.Text = "Đã lưu dữ liệu thành công";
            }
            catch (Exception ex)
            {
                this.lblError.Text = ex.Message;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;
            SaveData();
        }
    }
}