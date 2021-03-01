using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Manager;

namespace Musicviet.Administrators.Modules
{
    public partial class AddNewsOther : System.Web.UI.UserControl
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

            BindData2DDL();
            this.imageName = "";
            if (id > 0)
                BindObject(id);

        }


        private void BindObject(int objID)
        {
            NewsInfo obj = NewsManager.Select(objID);

            if (obj != null)
            {
                this.txtTitle.Text = obj.Title;
                this.txtSubTitle.Text = obj.SubTitle;
                this.txtSumary.Text = obj.Summary;
                this.txtDetailText.Value = obj.Detail;
                this.txtSource.Text = obj.Source;
                this.txtAuthor.Text = obj.Author;

                this.chkShowSubTitle.Checked = obj.ShowSubTitle;

                this.ddlCategory.SelectedIndex = -1;
                ListItem item1 = this.ddlCategory.Items.FindByValue(obj.CategoryID.ToString());
                if (item1 != null)
                    item1.Selected = true;

                this.img1.ImageUrl ="/Upload/"+ obj.ImagePath;
                this.imageName = obj.ImagePath;
                this.lblImg1.Text = this.imageName;
                this.Label1.Text = obj.IconPath;
                this.lblCreatedBy.Text = obj.CreatedBy;
                this.lblCreatedDate.Text = obj.CreatedOn.ToString("dd/MM/yyyy");
                this.lblModifiedBy.Text = obj.ModifiedBy;
                this.lblModifiedDate.Text = obj.ModifiedOn.ToString("dd/MM/yyyy");
                this.lblApprovedBy.Text = obj.ApprovedBy;
                this.lblApprovedDate.Text = obj.ApprovedOn.ToString("dd/MM/yyyy");
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
                        // Create thumbnail image
                        Bitmap bitmap = new Bitmap(updUploadFile.PostedFile.InputStream);
                        int with = bitmap.Width < 260 ? bitmap.Width : 260;
                        int height = Convert.ToInt32(((double)with / (double)bitmap.Width) * (double)bitmap.Height);

                        System.Drawing.Image thumbnailImage = bitmap.GetThumbnailImage(with, height, new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback), IntPtr.Zero);
                        thumbnailImage.Save(strFilePath, bitmap.RawFormat);
                        bitmap.Dispose();
                        thumbnailImage.Dispose();
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
        private void BindData2DDL()
        {
            DataView dv = CategoryManager.SelectAllCateByStatus(2).DefaultView;
           // dv.Sort = "CategoryName ASC";
            ddlCategory.DataSource = dv;
            this.ddlCategory.DataTextField = "FullPath";
            this.ddlCategory.DataValueField = "CategoryID";
            this.ddlCategory.DataBind();

            ListItem item = new ListItem("[Chọn chuyên dịch vụ]", "0");
            this.ddlCategory.Items.Insert(0, item);
        }

        private bool CheckValid()
        {
            if (this.ddlCategory.SelectedValue == "0")
            {
                this.lblError.Text = "Hãy chọn một chuyên mục";
                return false;
            }
            if (this.txtTitle.Text == "")
            {
                this.lblError.Text = "Hãy nhập tiêu đề";
                return false;
            }
            if (this.txtSumary.Text == "")
            {
                this.lblError.Text = "Hãy nhập tóm tắt";
                return false;
            }
            if (this.txtDetailText.Value == "")
            {
                this.lblError.Text = "Hãy nhập chi tiết dịch vụ";
                return false;
            }

            return true;
        }

        protected void SaveData()
        {
            try
            {
                if (!CheckValid())
                    return;

                if (id > 0)
                {
                    NewsInfo obj = NewsManager.Select(id);

                    obj.CategoryID = int.Parse(ddlCategory.SelectedValue.ToString());
                    obj.Title = txtTitle.Text;
                    obj.SubTitle = txtSubTitle.Text;
                    obj.ShowSubTitle = chkShowSubTitle.Checked;
                    obj.Summary = txtSumary.Text;
                    obj.Detail = txtDetailText.Value;
                    obj.Source = txtSource.Text;
                    obj.Author = txtAuthor.Text;
                    obj.IconPath = Soft;
                    obj.ImagePath = this.imageName;
                    obj.Status = 2;
                    obj.ModifiedBy = "admin";

                    NewsManager.Update(obj);
                }
                else
                {
                    //this is a new object.  
                    NewsInfo obj = new NewsInfo();

                    obj.CategoryID = int.Parse(ddlCategory.SelectedValue.ToString());
                    obj.Title = txtTitle.Text;
                    obj.SubTitle = txtSubTitle.Text;
                    obj.ShowSubTitle = chkShowSubTitle.Checked;
                    obj.Summary = txtSumary.Text;
                    obj.Detail = txtDetailText.Value;
                    obj.Source = txtSource.Text;
                    obj.Author = txtAuthor.Text;
                    obj.IconPath = Soft;
                    obj.ImagePath = this.imageName;
                    obj.Status = 2;
                    obj.CreatedBy = "admin";

                    NewsManager.Insert(obj);
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
       protected string Soft
        {
            get
            {
                return ViewState["Soft"]!=null? ViewState["Soft"].ToString(): "";
            }
            set
            {
                ViewState["Soft"] = value;
            }
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string soft = "";
            UploadSoft(FileUpload1,lblError,out soft);
            Label1.Text = soft;
            Soft = soft;
        }
    }
}