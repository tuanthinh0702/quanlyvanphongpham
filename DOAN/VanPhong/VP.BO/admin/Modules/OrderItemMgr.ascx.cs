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
    public partial class OrderItemMgr : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack)return;
            BindData();
        }
     
        IFormatProvider iFormat = new CultureInfo("vi-VN", true);
        private void BindData()
        {
            try
            {
                DataTable dtb = OrderManager.SelectAll();
                if (dtb != null)
                {
                    DataView dv = dtb.DefaultView;
                    string strFilter = " 1=1 ";
                    if (this.txtTransCode.Text.Trim() != "") strFilter += " and OrderNo like '%" + this.txtTransCode.Text.Trim() + "%'";
                    if (this.txtName.Text.Trim() != "") strFilter += " and FullName like '%" + this.txtName.Text.Trim() + "%'";
                    if (this.DropDownList1.SelectedValue.Trim() != "-1") strFilter += " and [Status] = '" + this.DropDownList1.SelectedValue.Trim() + "'";
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

        protected string Getstatus(int stratus)
        {
            if (stratus == 0) return "Chờ xử lý";
            if (stratus == 1) return "Đang giao hàng";
            if (stratus == 2) return "Thành công";
            if (stratus == 3) return "Hủy";
            else return "N/A";

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