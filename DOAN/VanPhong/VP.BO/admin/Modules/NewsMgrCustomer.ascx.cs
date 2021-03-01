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
    public partial class NewsMgrCustomer : System.Web.UI.UserControl
    {
        IFormatProvider iFormat = new CultureInfo("vi-VN", true);

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check List Permission
            //if (!Authentication.HasRight(UserRight.News_List))
            //{
            //    this.lblError.Text = "Bạn không có quyền xem danh sách tin tức, hãy liên hệ với quản trị hệ thống";
            //    pnSearch.Visible = false;
            //    udpButton.Visible = false;
            //    return;
            //}
            //End check List Permission

            if (IsPostBack)
                return;

            BindCategory();
            BindData();
        }

        private void BindCategory()
        {
            DataView dv = CategoryManager.SelectAllCateByStatus(3).DefaultView; //0 la tin tuc
            dv.Sort = "FullPath ASC";
            ddlCategory.DataSource = dv;
            this.ddlCategory.DataTextField = "FullPath";
            this.ddlCategory.DataValueField = "CategoryID";
            this.ddlCategory.DataBind();

            ListItem item = new ListItem("Tất cả", "0");
            this.ddlCategory.Items.Insert(0, item);
        }

        private void BindData()
        {
            try
            {
                DataTable dtb = NewsManager.SelectAllCus();
                if (dtb != null)
                {
                    DataView dv = dtb.DefaultView;
                    string strFilter = " 1=1 ";
                    if (this.txtTilte.Text.Trim() != "") strFilter += " and Title like '%" + this.txtTilte.Text.Trim() + "%'";
                    if (this.txtSubTitle.Text.Trim() != "") strFilter += " and SubTitle like '%" + this.txtSubTitle.Text.Trim() + "%'";
                    if (this.ddlCategory.SelectedValue.Trim() != "0") strFilter += " and CategoryID = '" + this.ddlCategory.SelectedValue.Trim() + "'";
                    if (txtStartCreate.Value != "") strFilter += " and CreatedOn >= '" + DateTime.Parse(txtStartCreate.Value, iFormat, DateTimeStyles.NoCurrentDateDefault) + "'";
                    if (txtEndCreate.Value != "") strFilter += " and CreatedOn <= '" + DateTime.Parse(txtEndCreate.Value, iFormat, DateTimeStyles.NoCurrentDateDefault) + "'";
                    dv.RowFilter = strFilter;
                    dv.Sort = "CategoryID DESC, CreatedOn DESC";
                    this.dg.DataSource = dv;
                    this.dg.DataBind();
                }
            }
            catch (Exception ex)
            {
                this.lblError.Text = ex.Message;
                throw ex;
            }
        }

        private void Delete(int newsID)
        {
            //// Check Delete Permission
            //if (!Authentication.HasRight(UserRight.News_Delete))
            //{
            //    this.lblError.Text = "Bạn không có quyền xóa tin tức, hãy liên hệ với quản trị hệ thống";
            //    return;
            //}
            // End check Delete Permission

            if (newsID > 0)
            {
                if (NewsManager.Delete(newsID))
                {
                    this.lblError.Text = "Đã xóa CSKH";
                    BindData();
                }
                else
                    this.lblError.Text = NewsManager.ErrorMessage;
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindData();
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindData();
        }

        protected void dg_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.dg.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void btnApp_Click(object sender, EventArgs e)
        {
            //// Check List Permission
            //if (!Authentication.HasRight(UserRight.News_Approve))
            //{
            //    this.lblError.Text = "Bạn không có quyền duyệt tin tức, hãy liên hệ với quản trị hệ thống";
            //    return;
            //}
            // //End check List Permission
            bool Approved = false;
            for (int i = 0; i < dg.Rows.Count; i++)
            {
                try
                {
                    HtmlInputCheckBox htmlCheckBox = (HtmlInputCheckBox)dg.Rows[i].FindControl("cbxItem");
                    if (!htmlCheckBox.Disabled && htmlCheckBox.Checked)
                    {
                        NewsManager.SetApproved(int.Parse(htmlCheckBox.Value), Authentication.CurrentUser.UserName);
                        Approved = true;
                    }
                }
                catch { }
            }
            BindData();
            if (Approved) this.lblError.Text = "Đã duyệt CSKH.";
            else this.lblError.Text = "Không có CSKH nào được duyệt.";
        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            //// Check List Permission
            //if (!Authentication.HasRight(UserRight.News_Approve))
            //{
            //    this.lblError.Text = "Bạn không có quyền duyệt tin tức, hãy liên hệ với quản trị hệ thống";
            //    return;
            //}
            // //End check List Permission
            bool Del = false;
            for (int i = 0; i < dg.Rows.Count; i++)
            {
                try
                {
                    HtmlInputCheckBox htmlCheckBox = (HtmlInputCheckBox)dg.Rows[i].FindControl("cbxDel");
                    if (htmlCheckBox.Checked)
                    {
                        NewsManager.Delete(int.Parse(htmlCheckBox.Value));
                        Del = true;
                    }
                }
                catch { }
            }
            BindData();
            if (Del) this.lblError.Text = "Đã xóa CSKH.";
            else this.lblError.Text = "Không có CSKH nào bị xóa.";
        }

        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlPageSize.SelectedValue != "1")
            {
                dg.AllowPaging = true;
                dg.PageSize = int.Parse(ddlPageSize.SelectedValue);
            }
            else
                dg.AllowPaging = false;
            BindData();
        }
        //protected void lkbEdit_Click(object sender, EventArgs e)
        //{
        //    //////////// Check Edit Permission
        //    if (!Authentication.HasRight(UserRight.News_Modify))
        //    {
        //        this.lblError.Text = "Bạn không có quyền sửa tin tức, hãy liên hệ với quản trị hệ thống";
        //        return;
        //    }
        //    // End check Edit Permission
        //    String id = "";
        //    for (int i = 0; i < dg.Rows.Count; i++)
        //        {
        //            LinkButton lkbEdit = (LinkButton)dg.Rows[i].FindControl("lkbEdit");
        //            lkbEdit.CommandArgument.ToString();
        //        }
        //    Response.Redirect(Config.WebsiteAppPath + "default.aspx?module=News&id=" + id);
        //}
        protected void dg_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string id = Convert.ToInt32(e.CommandArgument).ToString();
            switch (e.CommandName)
            {
                case "Edit":
                    Response.Redirect("Home.aspx?module=News&id=" + id.ToString());
                    break;
                case "Delete":
                    //DeleteUser();
                    break;
                default:
                    break;
            }
        }
    }
}