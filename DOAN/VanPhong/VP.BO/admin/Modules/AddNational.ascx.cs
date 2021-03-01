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
using Common;
namespace Musicviet.Administrators.Modules
{
    public partial class AddNational : System.Web.UI.UserControl
    {
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
            System.Web.UI.ScriptManager.GetCurrent(Page).RegisterPostBackControl(btnUpload);
            if (IsPostBack)
                return;
                this.imageName = "";
                BindData();
        }

        protected void dg_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Edit":
                    vID = e.CommandArgument;
                    if (vID != null)
                        EditData(Convert.ToInt32(vID));
                    break;
                case "Del":
                    vID = e.CommandArgument;
                    DeleteData(Convert.ToInt32(vID));
                    break;
                default:
                    break;
            }
        }

        protected void dg_OnPageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            dg.CurrentPageIndex = e.NewPageIndex;

            // Re-bind the data to refresh the DataGrid control. 
            BindData();
        }
        private bool CheckValid()
        {
            if (!Page.IsValid)
                return false;
            if (this.txtName.Text.Trim() == "")
            {
                this.lblMessage.Text = "Hãy nhập tên nhà cung cấp";
                return false;
            }
            return true;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!CheckValid())
                return;

            SaveData();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            EditPanel.Enabled = false;
            vID = null;
        }

        protected void DeleteData(int ID)
        {
            try
            {
                if (NationalsManager.Delete(ID))
                {
                    lblMessage.Text = "Đã xóa nhà sản xuất";
                    EditPanel.Enabled = false;

                    BindData();
                    vID = null;
                }
                else
                    this.lblMessage.Text = ProviderManager.ErrorMessage;
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }

        protected void SaveData()
        {
            try
            {
                if (vID != null)
                {
                    //Edit on the object.  
                    int Id;
                    if (int.TryParse(vID.ToString(), out Id))
                    {
                        NationalsInfo obj = NationalsManager.Select(Id);
                        obj.NationalName = txtName.Text;
                        obj.NationalAdd = txtadd.Text;
                        obj.NationalPhone = txtphone.Text;
                        obj.NationalLogo = imageName.ToString();
                        obj.Status = int.Parse(txtOrder.Text);
                        NationalsManager.Update(obj);
                    }
                }
                else
                {
                    //this is a new object.  
                     NationalsInfo obj=new NationalsInfo();
                     obj.NationalName = txtName.Text;
                     obj.NationalAdd = txtadd.Text;
                     obj.NationalPhone = txtphone.Text;
                     obj.NationalLogo = imageName.ToString();
                     obj.Status = int.Parse(txtOrder.Text);
                     NationalsManager.Insert(obj);
                } 

                lblMessage.Text = "Đã lưu dữ liệu thành công!";
                EditPanel.Enabled = false;
                BindData();
                vID = null;
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }

        protected object vID
        {
            get
            {
                return ViewState["vID"];
            }
            set
            {
                ViewState["vID"] = value;
            }
        }
      

        private void BindData()
        {

            DataTable dt = NationalsManager.SelectAll();
            if (dt != null)
            {
                DataView dv = dt.DefaultView;
                dv.Sort = "Status ASC";
                dg.DataSource = dv;
                dg.DataBind();
            }
        }

        private void EditData(int Id)
        {
            NationalsInfo obj = NationalsManager.Select((int)Id);

            txtName.Text = obj.NationalName;
            vID = obj.NationalID;
            txtadd.Text = obj.NationalAdd;
            txtphone.Text = obj.NationalPhone;
            this.img1.ImageUrl = Config.GetAppSetting("NewsImagePath") + obj.NationalLogo;
            txtOrder.Text = obj.Status.ToString();
            EditPanel.Enabled = true;
        }

        private void NewData()
        {
            txtName.Text = "";
            txtOrder.Text = "0";
            vID = null;

            EditPanel.Enabled = true;
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            NewData();
        }

        #region Upload Image
        public static void GetExtResource(string contentType, out string ext, out string type)
        {
            ext = string.Empty;
            type = string.Empty;
            switch (contentType)
            {
                case "image/jpeg":
                case "image/pjpeg":
                    ext = ".jpg";
                    type = "img";
                    break;
                case "image/gif":
                    ext = ".gif";
                    type = "img";
                    break;
                case "image/bmp":
                    ext = ".bmp";
                    type = "img";
                    break;
                case "image/png":
                case "image/x-png":
                    ext = ".png";
                    type = "img";
                    break;
            }
        }
        protected void SaveFile(FileUpload ff, out string refference)
        {
            refference = "";
            if (ff.HasFile)
            {
                try
                {
                    string ext;
                    string type;
                    string strRootPath = Config.GetAppSetting("NewsImageFolder");
                    string dir_name = DateTime.Now.ToString("yyyyMMdd");
                    if (!System.IO.Directory.Exists(strRootPath + dir_name))
                        Directory.CreateDirectory(strRootPath + dir_name);
                    string contentType = ff.PostedFile.ContentType;
                    GetExtResource(contentType, out ext, out type);
                    if (type != "img")
                    {
                        lblMessage.Text = "Co loi: Dinh dang file \"" + contentType +
                                      "\", vui long chon file dinh dang jpg,gif,bmp hoac png.";
                        lblMessage.ForeColor = Color.Red;
                        return;
                    }
                    string str = dir_name + "/" + Path.GetFileName(ff.FileName);
                    string filename = strRootPath + str;
                    ff.SaveAs(filename);
                    refference = str;
                    lblMessage.Text = "File <" + str + "> upload thành công. ";
                    lblMessage.ForeColor = Color.Red;
                }
                catch (Exception exception)
                {
                    this.lblMessage.Text = "Không thể upload file. Lỗi xuất hiện : " + exception.Message;
                    lblMessage.ForeColor = Color.Red;
                }
            }
        }

        #endregion

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            //Upload image
            if (upImg1.FileName != "")
            {
                string image = "";
                SaveFile(upImg1, out image);
                this.imageName = image;
                this.img1.ImageUrl = Config.WebsiteAppPath + Config.GetAppSetting("NewsImagePath") + this.imageName;
            }
            else
                lblImg1.Text = "<i>browse a file</i>";
        }

      }
}