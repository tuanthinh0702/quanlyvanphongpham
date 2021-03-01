using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Manager;

namespace Musicviet.Administrators.Modules
{
    public partial class CateCustomer : System.Web.UI.UserControl
    {
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
            this.lblError.Text = "";
            if (IsPostBack)
                return;

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
            this.btnUpdate.Enabled = false;
        }

        private void BindCategory()
        {
            DataTable dtb = CategoryManager.SelectAllCateByStatus(3);

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
            DataTable dtb = CategoryManager.SelectAllByTypeAndParent(0,3);

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
            DataTable dtb = CategoryManager.SelectAllByTypeAndParent(Int32.Parse(drw["CategoryID"].ToString()),0);

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
            obj.Status = 3;

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
                obj.OrderNo = Byte.Parse(this.txtOrderNo.Text.Trim());
                obj.Status = 3;

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
            
                    if (CategoryManager.Delete(CatID))
                    {
                        this.lblError.Text = "Đã xóa chuyên mục";
                        InitializeCategoryTreeView();
                        BindCategory();
                        ClearData();
                    }
                    else
                        this.lblError.Text = CategoryManager.ErrorMessage;
         
        }
    }
}