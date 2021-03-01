using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Manager;

namespace Musicviet.Administrators.Modules
{
    public partial class ProductMgr : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack)return;
            BindCategory();
            BindData();
        }
        private void BindCategory()
        {
            DataView dv = CategoryManager.SelectAllCateByStatus(1).DefaultView; //0 la tin tuc
            dv.Sort = "FullPath ASC";
            ddlCategory.DataSource = dv;
            this.ddlCategory.DataTextField = "FullPath";
            this.ddlCategory.DataValueField = "CategoryID";
            this.ddlCategory.DataBind();

            ListItem item = new ListItem("Tất cả", "0");
            this.ddlCategory.Items.Insert(0, item);
        }
        IFormatProvider iFormat = new CultureInfo("vi-VN", true);
        private void BindData()
        {
            try
            {
                DataTable dtb = ProductsManager.SelectAll();
                if (dtb != null)
                {
                    DataView dv = dtb.DefaultView;
                    string strFilter = " 1=1 ";
                    if (this.txtName.Text.Trim() != "") strFilter += " and ProductName like '%" + this.txtName.Text.Trim() + "%'";
                    if (this.txtTransCode.Text.Trim() != "") strFilter += " and ProductCode like '%" + this.txtTransCode.Text.Trim() + "%'";
                    if (this.ddlCategory.SelectedValue.Trim() != "0") strFilter += " and CategoryID = '" + this.ddlCategory.SelectedValue.Trim() + "'";
                   dv.RowFilter = strFilter;
                    this.grData.DataSource = dv;
                    this.grData.DataBind();
                }
            }
            catch (Exception ex)
            {
                this.lblError.Text = ex.Message;
                throw ex;
            }
        }

        protected void grData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.grData.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindData();
        }

        protected void drpShow_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (drpShow.SelectedValue != "1")
            {
                grData.AllowPaging = true;
                grData.PageSize = int.Parse(drpShow.SelectedValue);
            }
            else
                grData.AllowPaging = false;
            BindData();
        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            bool Del = false;
            for (int i = 0; i < grData.Rows.Count; i++)
            {
                try
                {
                    HtmlInputCheckBox htmlCheckBox = (HtmlInputCheckBox)grData.Rows[i].FindControl("cbxDel");
                    if (htmlCheckBox.Checked)
                    {
                        ProductsManager.Delete(int.Parse(htmlCheckBox.Value));
                        Del = true;
                    }
                }
                catch { }
            }
            BindData();
            if (Del) this.lblError.Text = "Đã xóa bài viết.";
            else this.lblError.Text = "Không có bài viết nào bị xóa.";
        }
    }
}