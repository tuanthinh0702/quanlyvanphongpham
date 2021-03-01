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
    public partial class AddPro : System.Web.UI.UserControl
    {
        private int id = 0;

        protected string imageNameOne
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
        protected string imagePathAll
        {
            get
            {
                return ViewState["ImagePath"].ToString();
            }
            set
            {
                ViewState["ImagePath"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
           id = Request.QueryString["id"] != null ? Int32.Parse(Request.QueryString["id"].ToString()) : 0;
            if (IsPostBack)
                return;
            imageNameOne = "";
            imagePathAll = "";
            BindData2DDL();
            BindData2DDLUnit();
            BindData2DDLSize();
            BindData2DDLColor();
            BindData2DDLMade();
            BindProvider();
          if (id > 0)
                BindObject(id);

        }
        private void BindData2DDL()
        {
            DataView dv = CategoryManager.SelectAllCateByStatus(1).DefaultView;
            ddlCategory.DataSource = dv;
            this.ddlCategory.DataTextField = "FullPath";
            this.ddlCategory.DataValueField = "CategoryID";
            this.ddlCategory.DataBind();

            ListItem item = new ListItem("- Loại sản phẩm -", "0");
            this.ddlCategory.Items.Insert(0, item);
        }
        private void BindData2DDLUnit()
        {
            this.ddlunit.DataSource = UnitManager.SelectAll();
            this.ddlunit.DataTextField = "Unitname";
            this.ddlunit.DataValueField = "UnitID";
            this.ddlunit.DataBind();

            ListItem item = new ListItem("- Đơn vị sản phẩm -", "0");
            this.ddlunit.Items.Insert(0, item);
        }

        private void BindData2DDLSize()
        {
            this.ddlsize.DataSource = SizeManager.SelectAll();
            this.ddlsize.DataTextField = "Sizename";
            this.ddlsize.DataValueField = "SizeID";
            this.ddlsize.DataBind();

            ListItem item = new ListItem("- Kích thức(cỡ) -", "0");
            this.ddlsize.Items.Insert(0, item);
        }

        private void BindData2DDLColor()
        {

            this.ddlcolor.DataSource = ColorManager.SelectAll();
            this.ddlcolor.DataTextField = "Colorname";
            this.ddlcolor.DataValueField = "ColorID";
            this.ddlcolor.DataBind();

            ListItem item = new ListItem(" - Mầu sản phẩm -", "0");
            this.ddlcolor.Items.Insert(0, item);
        }
        protected void BindProvider()
        {
            this.ddlProvider.DataSource = NationalsManager.SelectAll();
            ddlProvider.DataTextField = "NationalName";
            ddlProvider.DataValueField = "NationalID";
            ddlProvider.DataBind();
            ListItem lst = new ListItem("- Nhà sản xuất -");
            ddlProvider.Items.Insert(0, lst);
        }
        private void BindData2DDLMade()
        {
   
            this.ddlMade.DataSource = MadeManager.SelectAll();
            this.ddlMade.DataTextField = "MadeName";
            this.ddlMade.DataValueField = "MadeID";
            this.ddlMade.DataBind();

            ListItem item = new ListItem("- Xuất sứ -", "0");
            this.ddlMade.Items.Insert(0, item);
        }
        private void BindObject(int objID)
        {
            ProductsInfo obj = ProductsManager.Select(objID);

            if (obj != null)
            {
                txtName.Text = obj.ProductName;
                txtCode.Text = obj.ProductCode;
                txtsubproductname.Text = obj.SubProductName;
                this.ddlCategory.SelectedIndex = -1;
                ListItem item1 = this.ddlCategory.Items.FindByValue(obj.CategoryID.ToString());
                if (item1 != null)
                    item1.Selected = true;
                this.ddlMade.SelectedIndex = -1;
                ListItem item2 = this.ddlMade.Items.FindByValue(obj.MadeID.ToString());
                if (item2 != null)
                    item2.Selected = true;
                this.ddlProvider.SelectedIndex = -1;
                ListItem item3 = this.ddlProvider.Items.FindByValue(obj.NationalID.ToString());
                if (item3 != null)
                    item3.Selected = true;
                this.ddlcolor.SelectedIndex = -1;
                ListItem item4 = this.ddlcolor.Items.FindByValue(obj.ColorID.ToString());
                if (item4 != null)
                    item4.Selected = true;
                this.ddlsize.SelectedIndex = -1;
                ListItem item5 = this.ddlsize.Items.FindByValue(obj.SizeID.ToString());
                if (item5 != null)
                    item5.Selected = true;
                this.ddlunit.SelectedIndex = -1;
                ListItem item6 = this.ddlunit.Items.FindByValue(obj.UnitID.ToString());
                if (item6 != null)
                    item6.Selected = true;
                txtcount.Text = obj.Count.ToString();
                txtMaterial.Text = obj.ProductMaterial;
              //  txtNational.Text = obj.NationalBy;
                txtPrice.Text = String.Format("{0:0,0}", obj.ProductPrice).Replace(",", ".");
                txtDiscount.Text = String.Format("{0:0,0}", obj.Discount).Replace(",", ".");
                txtStatus.Text = obj.ProductStatus;
                txtWarranty.Text = obj.Warranty;
                txtDetailText.Value = obj.Description;
                imageNameOne = obj.ProductImage;
                imagePathAll = obj.ProductImageList;
                if (obj.ShowOk == 1) rdoShow.Checked = true;
                if (obj.TopOk == 1) rdoTopOk.Checked = true;
               //bind lai datatable image
                dataImg.Columns.Add("ImagePath");

                string[] aStrings = obj.ProductImageList.Remove(obj.ProductImageList.Length - 1).Split('|');
                for (int i = 0; i < aStrings.Count(); i++)
                {
                    DataRow dr = dataImg.NewRow();
                    dr["ImagePath"] = aStrings[i];
                    dataImg.Rows.Add(dr);
                }
                grvImage.DataSource = dataImg;
                grvImage.DataBind();
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
            
            //dataImgg.Columns.Add("DateValue", typeof(string));
            string strRootPath = Server.MapPath("/Upload/");

            //Create directory
            string dir_name = DateTime.Now.ToString("yyyyMMdd");
            if (!System.IO.Directory.Exists(strRootPath + dir_name))
                Directory.CreateDirectory(strRootPath + dir_name);
            //Upload image
            HttpFileCollection fileCollection = Request.Files;
            for (int i = 0; i < fileCollection.Count; i++)
            {
                HttpPostedFile uploadfile = fileCollection[i];
                string fileName = dir_name + "/" + Path.GetFileName(uploadfile.FileName);
                if (uploadfile.ContentLength > 0)
                {
                    uploadfile.SaveAs(strRootPath+fileName);
                    imagePathAll += fileName +"|";
                }
                if (i == 0)
                {
                    imageNameOne = fileName;
                }
            }
           // imagePathAll = imagePathAll.Remove(imagePathAll.Length - 1);
            //datatable
            dataImg.Columns.Add("ImagePath", typeof(string));
            string[] aStrings = imagePathAll.Remove(imagePathAll.Length - 1).Split('|');
            for (int i = 0; i < aStrings.Count(); i++)
            {
                DataRow dr = dataImg.NewRow();
                dr["ImagePath"] = aStrings[i];
                dataImg.Rows.Add(dr);
            }
            grvImage.DataSource = dataImg;
            grvImage.DataBind();
        }
       DataTable dataImg=new DataTable();
        private string imagePath = ",";
        protected string pathOne = "";
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
            
            try
            {
               if(!CheckValid())
                    return;
               if (id > 0)
                {
                    ProductsInfo info=new ProductsInfo();
                    info.ProductName = txtName.Text.Trim();
                    info.ProductCode = txtCode.Text.Trim();
                    info.SubProductName = txtsubproductname.Text.Trim();
                    info.CategoryID = int.Parse(ddlCategory.SelectedValue);
                    info.MadeID = int.Parse(ddlMade.SelectedValue);
                    info.ColorID = int.Parse(ddlcolor.SelectedValue);
                    info.NationalID = int.Parse(ddlProvider.SelectedValue);
                    info.SizeID = int.Parse(ddlsize.SelectedValue);
                    info.UnitID = int.Parse(ddlunit.SelectedValue);
                    info.Count = int.Parse(txtcount.Text);
                    info.ProductMaterial = txtMaterial.Text.Trim();
                    info.ProductImage = imageNameOne;
                    info.ProductPrice = decimal.Parse(txtPrice.Text.Trim());
                    info.ProductPrice = Decimal.Parse(txtPrice.Text.Replace(".", ""));
                    if (this.txtDiscount.Text != "")
                    {
                        info.Discount = Decimal.Parse(txtDiscount.Text.Replace(".", ""));
                    }
                    else
                    {
                        info.Discount = 0;
                    }
                    info.ProductStatus = txtStatus.Text.Trim();
                    info.Description = txtDetailText.Value;
                    info.Warranty = txtWarranty.Text.Trim();
                    if (rdoShow.Checked) info.ShowOk = 1;
                    else if (rdoHide.Checked || !rdoShow.Checked && !rdoHide.Checked) info.ShowOk = 0;
                    if (rdoTopOk.Checked) info.TopOk = 1;
                    else if (rdoNormal.Checked|| !rdoTopOk.Checked && !rdoNormal.Checked) info.TopOk = 0;
                    info.ProductImageList = imagePathAll;
                    info.ProductID = id;
                    ProductsManager.Update(info);
                }
                else
                {
                    //this is a new object.  
                    ProductsInfo info = new ProductsInfo();
                    info.ProductName = txtName.Text.Trim();
                    info.ProductCode = txtCode.Text.Trim();
                    info.SubProductName = txtsubproductname.Text.Trim();                   
                    info.CategoryID = int.Parse(ddlCategory.SelectedValue);
                    info.MadeID = int.Parse(ddlMade.SelectedValue);
                    info.ColorID = int.Parse(ddlcolor.SelectedValue);
                    info.NationalID = int.Parse(ddlProvider.SelectedValue);
                    info.SizeID = int.Parse(ddlsize.SelectedValue);
                    info.UnitID = int.Parse(ddlunit.SelectedValue);
                    info.Count = int.Parse(txtcount.Text);
                    info.ProductMaterial = txtMaterial.Text.Trim();
                    info.ProductImage = imageNameOne;
                    info.ProductPrice = Decimal.Parse(txtPrice.Text.Replace(".", ""));
                    if (this.txtDiscount.Text != "")
                    {
                        info.Discount = Decimal.Parse(txtDiscount.Text.Replace(".", ""));
                    }
                    else
                    {
                        info.Discount = 0;
                    }
                    info.ProductStatus = txtStatus.Text.Trim();
                    info.Description = txtDetailText.Value;
                    info.Warranty = txtWarranty.Text.Trim();
                    if (rdoShow.Checked) info.ShowOk = 1;
                    else if (rdoHide.Checked) info.ShowOk = 0;
                    if (rdoTopOk.Checked) info.TopOk = 1;
                    else if (rdoNormal.Checked) info.TopOk = 0;
                    info.ProductImageList = imagePathAll;
                    ProductsManager.Insert(info);
                }

                this.lblError.Text = "Đã lưu dữ liệu thành công";
            }
            catch (Exception ex)
            {
                this.lblError.Text = ex.Message;
            }
        }

        private bool CheckValid()
        {
            if (this.ddlCategory.SelectedValue == "0")
            {
                this.lblError.Text = "Hãy chọn một chuyên mục";
                return false;
            }
            if (this.txtName.Text == "")
            {
                this.lblError.Text = "Hãy nhập tên sản phẩm";
                return false;
            }
            if (this.txtsubproductname.Text == "" && this.txtsubproductname.MaxLength<=149)
            {
                this.lblError.Text = "Hãy nhập mô tả(từ khóa SEO >=150 ký tự)";
                return false;
            }

            if (this.ddlMade.SelectedValue == "0")
            {
                this.lblError.Text = "Hãy chọn xuất xứ";
                return false;
            }
            if (this.ddlProvider.SelectedValue == "0")
            {
                this.lblError.Text = "Hãy chọn một nhà cung cấp";
                return false;
            }
            if (this.ddlcolor.SelectedValue == "0")
            {
                this.lblError.Text = "Hãy chọn mầu sắc";
                return false;
            }
            if (this.ddlsize.SelectedValue == "0")
            {
                this.lblError.Text = "Hãy chọn kích thứơc";
                return false;
            }
            if (this.ddlunit.SelectedValue == "0")
            {
                this.lblError.Text = "Hãy chọn một đơn vị";
                return false;
            }
            if (this.txtcount.Text == "")
            {
                this.lblError.Text = "Hãy nhập số lượng sản phẩm ";
                return false;
            }
            if (this.txtPrice.Text == "")
            {
                this.lblError.Text = "Hãy nhập giá của sản phẩm ";
                return false;
            }
            if (this.txtPrice.Text != "")
            {
                if(checkDigit(this.txtPrice.ToString().Trim())==true)
                {
                  this.lblError.Text = "Hãy nhập ký tự số (0 đến 9) ";
                  return false;
                }
            }

            if (this.txtDiscount.Text != "" && this.txtPrice.Text != "")
            {

                if (checkDigit(this.txtDiscount.ToString().Trim()) == true)
                {
                    this.lblError.Text = "Hãy nhập ký tự số (0 đến 9) ";
                    return false;
                }
                if (checkDigit(this.txtPrice.ToString().Trim()) == true)
                {
                    this.lblError.Text = "Hãy nhập ký tự số (0 đến 9) ";
                    return false;
                }
                if (Decimal.Parse(txtDiscount.Text.ToString().Trim().Replace(".", "")) > Decimal.Parse(txtPrice.Text.ToString().Trim().Replace(".", "")))
                {
                    this.lblError.Text = "Hãy nhập giảm giá nhỏ hơn giá bán";
                    return false;
                }
            }

            if ( imageNameOne == "")
            {
                this.lblError.Text = "Hãy chọn ảnh đại diện ";
                return false;
            }
            
            return true;
        }

        public bool checkDigit(string s)
        {
            for (int i = 0; i < s.Length; i++)
            {
                if (char.IsDigit(s[i]) == true)
                    return true;
            }
            return false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;
            SaveData();
        }
    
        protected void grvImage_RowCommand(object sender, DataGridCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "select":
                    // gan gia tri tai day
                    imageNameOne = e.CommandArgument.ToString();
                    break;
                case "delete":
                    string a = e.CommandArgument.ToString();
                    //xoa tai day
                    string[] aStrings = imagePathAll.Remove(imagePathAll.Length - 1).Split('|');
                    var list = new List<string>(aStrings);
                    list.Remove(a);
                    aStrings = list.ToArray();
                    imagePathAll = "";
                    for (int i = 0; i < aStrings.Count(); i++)
                    {
                        imagePathAll += aStrings[i] + "|";
                    }
                    dataImg.Columns.Add("ImagePath");
                    for (int i = 0; i < aStrings.Count(); i++)
                    {
                        DataRow dr = dataImg.NewRow();
                        dr["ImagePath"] = aStrings[i];
                        dataImg.Rows.Add(dr);
                    }
                    grvImage.DataSource = dataImg;
                    grvImage.DataBind();
                    break;
                default:
                    break;
            }
        }
        }
}