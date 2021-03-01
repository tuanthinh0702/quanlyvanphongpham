using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common;
using Manager;

namespace Musicviet.Administrators.Modules
{
    public partial class CatePro : System.Web.UI.UserControl
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

        protected int CatID
        {
            get
            {
                return (int)ViewState["CategoryID"];
            }
            set
            {
                ViewState["CategoryID"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            System.Web.UI.ScriptManager.GetCurrent(Page).RegisterPostBackControl(btnUpload);
            this.lblError.Text = "";
            if (IsPostBack)
                return;
            this.imageName = "";
            InitializeCategoryTreeView();
            BindCategory();
            this.btnUpdate.Enabled = false;
        }

        private void ClearData()
        {
            this.CatID = 0;
            this.txtCategoryName.Text = "";
            this.ddlCategoryParent.SelectedIndex = -1;
            this.txtDescription.Text = "";
            this.txtOrderNo.Text = "";
            this.imageName = "";
            this.btnUpdate.Enabled = false;
        }

        private void BindCategory()
        {
            DataTable dtb = CategoryManager.SelectAllCateByStatus(1);

            if (dtb != null)
            {
                this.ddlCategoryParent.DataSource = dtb;
                this.ddlCategoryParent.DataTextField = "FullPath";
                this.ddlCategoryParent.DataValueField = "CategoryID";
                this.ddlCategoryParent.DataBind();
            }

            ListItem item = new ListItem("[Danh mục gốc]", "0");
            this.ddlCategoryParent.Items.Insert(0, item);
        }

        private void BindObject(int id)
        {
            if (id > 0)
            {
                CategoryInfo obj = CategoryManager.Select(id);
                if (obj != null)
                {
                    this.txtCategoryName.Text = obj.CategoryName;
                    this.txtDescription.Text = obj.ShortDescription;
                    this.img1.ImageUrl = Config.GetAppSetting("NewsImagePath") + obj.LongDescription;
                    this.imageName = obj.LongDescription;
                    this.txtOrderNo.Text = obj.OrderNo.ToString();

                    this.ddlCategoryParent.SelectedIndex = -1;
                    ListItem item1 = this.ddlCategoryParent.Items.FindByValue(obj.ParentID.ToString());
                    if (item1 != null)
                        item1.Selected = true;

                    // Remove seft category
                    ListItem item2 = this.ddlCategoryParent.Items.FindByValue(id.ToString());
                    if (item2 != null)
                        this.ddlCategoryParent.Items.Remove(item2);

                    this.btnUpdate.Enabled = true;
                }
            }
        }

        private bool CheckValid()
        {
            if (this.txtCategoryName.Text.Trim() == "")
            {
                this.lblError.Text = "Hãy nhập tên chuyên mục";
                return false;
            }
            byte outValues = 0;
            if (!Byte.TryParse(this.txtOrderNo.Text, out outValues))
            {
                this.lblError.Text = "Hãy nhập thứ tự sắp xếp (0-255)";
                return false;
            }

            return true;
        }

        #region Tree view

        private void InitializeCategoryTreeView()
        {
            tvwCategory.Nodes.Clear();
            DataTable dtb = CategoryManager.SelectAllByTypeAndParent(0,1);

            if (dtb == null)
                return;

            foreach (DataRow dr in dtb.Rows)
            {
                AddCategoryToTreeNode(tvwCategory.Nodes, dr);
            }
            pnlEmptyManufacturer.Visible = false;
            tvwCategory.ExpandAll();
        }

        private void AddCategoryToTreeNode(TreeNodeCollection nodes, DataRow drw)
        {
            TreeNode node = new TreeNode(drw["CategoryName"].ToString(), drw["CategoryID"].ToString());
            nodes.Add(node);
            DataTable dtb = CategoryManager.SelectAllByTypeAndParent(Int32.Parse(drw["CategoryID"].ToString()),1);

            if (dtb == null)
                return;

            foreach (DataRow dr in dtb.Rows)
            {
                AddCategoryToTreeNode(node.ChildNodes, dr);
            }
        }

        protected void tvwCategory_SelectedNodeChanged(object sender, EventArgs e)
        {
            // Set value for curentt category
            CatID = Int32.Parse(this.tvwCategory.SelectedValue);
            BindObject(CatID);
        }

        private void tvwCategory_Refresh()
        {
            tvwCategory_Refresh(null);
        }

        private void tvwCategory_Refresh(string valuePath)
        {
            InitializeCategoryTreeView();
            if (!string.IsNullOrEmpty(valuePath))
            {
                TreeNode node = tvwCategory.FindNode(valuePath);
                if (null != node)
                {
                    node.Selected = true;
                }
            }
        }

        /// <summary>
        /// Loop through all the tree nodes and find out the node matching the value assuming all values in nodes are unique.
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        private TreeNode FindNodeByValue(TreeNodeCollection nodes, string value)
        {
            foreach (TreeNode node in nodes)
            {
                if (node.Value == value)
                {
                    return node;
                }
                if ((null != node.ChildNodes) && (node.ChildNodes.Count > 0))
                {
                    TreeNode foundNode = FindNodeByValue(node.ChildNodes, value);
                    if (null != foundNode)
                    {
                        return foundNode;
                    }
                }
            }
            return null;
        }
        #endregion

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (!CheckValid())
                return;

            CategoryInfo obj = new CategoryInfo();

            obj.CategoryName = this.txtCategoryName.Text.Trim();
            obj.ParentID = Int32.Parse(this.ddlCategoryParent.SelectedValue);
            obj.ShortDescription = this.txtDescription.Text.Trim();
            obj.OrderNo = Byte.Parse(this.txtOrderNo.Text.Trim());
            obj.Status = 0;// 
            if (CategoryManager.Insert(obj))
            {
                this.lblError.Text = "Tạo mới thành công!";
                InitializeCategoryTreeView();
                BindCategory();
                ClearData();
            }
            else
                this.lblError.Text = CategoryManager.ErrorMessage;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (!CheckValid())
                return;

            CategoryInfo obj = CategoryManager.Select(CatID);

            if (obj != null)
            {
                obj.CategoryName = this.txtCategoryName.Text.Trim();
                obj.ParentID = Int32.Parse(this.ddlCategoryParent.SelectedValue);
                obj.ShortDescription = this.txtDescription.Text.Trim();
                obj.LongDescription = this.imageName;
                obj.OrderNo = Byte.Parse(this.txtOrderNo.Text.Trim());

                if (CategoryManager.Update(obj))
                {
                    this.lblError.Text = "Đã cập nhật chuyên mục";
                    InitializeCategoryTreeView();
                    BindCategory();
                    ClearData();
                }
                else
                    this.lblError.Text = CategoryManager.ErrorMessage;
            }
            else
                this.lblError.Text = "Có lỗi xảy ra, hãy liên hệ với quản trị hệ thống";
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            //if (!CategoryManager.IsContainChild(CatID))
            //{
            //DataTable dtb = NewsManager.SelectAllByCat(CatID);
            //if (dtb == null || dtb.Rows.Count <= 0)
            //{
            if (CategoryManager.Delete(CatID))
            {
                this.lblError.Text = "Đã xóa chuyên mục";
                InitializeCategoryTreeView();
                BindCategory();
                ClearData();
            }
            else
                this.lblError.Text = CategoryManager.ErrorMessage;
            //    }
            //    else
            //    {
            //        this.lblError.Text = "Không thể xóa chuyên mục có tin tức";
            //    }
            ////}
            //else
            //{
            //    this.lblError.Text = "Không thể xóa chuyên mục có chứa chuyên mục con";
            //}
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
                        lblError.Text = "Co loi: Dinh dang file \"" + contentType +
                                      "\", vui long chon file dinh dang jpg,gif,bmp hoac png.";
                        lblError.ForeColor = Color.Red;
                        return;
                    }
                    string str = dir_name + "/" + Path.GetFileName(ff.FileName);
                    string filename = strRootPath + str;
                    ff.SaveAs(filename);
                    refference = str;
                    lblError.Text = "File <" + str + "> upload thành công. ";
                    lblError.ForeColor = Color.Red;
                }
                catch (Exception exception)
                {
                    this.lblError.Text = "Không thể upload file. Lỗi xuất hiện : " + exception.Message;
                    lblError.ForeColor = Color.Red;
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