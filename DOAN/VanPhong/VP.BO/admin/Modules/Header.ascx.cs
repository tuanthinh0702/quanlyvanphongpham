using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Manager;
using Common;
namespace Musicviet.Administrators.Modules
{
    public partial class Header : System.Web.UI.UserControl
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
            HeadFooterInfo obj = HeadFooterManager.Select(objID);

            if (obj != null)
            {
                img1.DescriptionUrl = "~/Upload/"+ obj.Contents;
                img1.ImageUrl = "~/Upload/" + obj.Contents;
                lblImg1.Text = this.imageName;
                imageName = obj.Contents;
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
       
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (id > 0)
            {
                HeadFooterInfo obj = new HeadFooterInfo();
                obj.Contents = imageName;
                obj.Type = 1;//header 
                obj.ID = id;
                HeadFooterManager.Update(obj);
                lblError.Text = "Cập nhật thành công";
            }
            else
            {
                HeadFooterInfo obj = new HeadFooterInfo();
                obj.Contents = imageName;
                obj.Type = 1;//header
                HeadFooterManager.Insert(obj);
                lblError.Text = "Thêm mới thành công";
            }
        }
    }
}