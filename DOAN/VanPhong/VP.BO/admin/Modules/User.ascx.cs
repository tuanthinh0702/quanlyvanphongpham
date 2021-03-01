using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Manager;
using Common;
namespace Musicviet.Administrators.Modules
{
    public partial class User : System.Web.UI.UserControl
    {
        protected string vUserName
        {
            get
            {
                return ViewState["vUserName"].ToString();
            }
            set
            {
                ViewState["vUserName"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //// Check View Permission
            //if (!Authentication.HasRight(UserRight.User_View))
            //{
            //    this.lblError.Text = "Bạn không có quyền truy cập trang quản lý người dùng, hãy liên hệ với quản trị hệ thống";
            //    this.plhMain.Visible = false;
            //    return;
            //}
            //else
            //    this.lblError.Text = "";
            //// End check View Permission

            if (this.IsPostBack) return;

            vUserName = "";
            this.BindData();
            this.txtUserName.Enabled = true;
            this.txtPassword.Enabled = true;
            this.mvDetail.SetActiveView(vDetail);
        }

        private void ClearData()
        {
            vUserName = "";
            this.txtUserNameCP.Text = "";
            this.txtPasswordCP.Text = "";
            this.txtUserName.Text = "";
            this.txtPassword.Text = "";
            this.txtEmail.Text = "";
            this.txtMobile.Text = "";
            this.txtTitle.Text = "";
            this.lblCreatedBy.Text = "";
            this.lblCreatedDate.Text = "";
            this.lblLastLogin.Text = "";
            this.pnPass.Visible = true;
            this.txtUserName.Enabled = true;
            this.txtPassword.Enabled = true;
        }

        private void EditUser()
        {
           if (vUserName != "")
            {
                UserInfo objUser = UserManager.Select(vUserName);
                if (objUser != null)
                {
                    this.txtUserName.Text = objUser.UserName.Trim();
                    this.txtEmail.Text = objUser.Email.Trim();
                    this.txtMobile.Text = objUser.Mobile.Trim();
                    this.txtTitle.Text = objUser.Title.Trim();
                    //this.lblLastLogin.Text = FormHelper.FormatNormalDate(objUser.LastLogin);
                    this.lblCreatedBy.Text = objUser.CreatedBy.Trim();
                  //  this.lblCreatedDate.Text = FormHelper.FormatNormalDate(objUser.CreatedDate);
                }

                this.txtUserName.Enabled = false;
                this.txtPassword.Enabled = false;
            }
        }

        private void ResetPass()
        {
            

            if (vUserName != "")
            {
                this.txtUserNameCP.Text = vUserName;
            }
        }

        private void BindData()
        {
            try
            {
                // //Check List Permission
                //if (!Authentication.HasRight(UserRight.User_List))
                //{
                //    this.lblError.Text = "Bạn không có quyền xem danh sách người dùng, hãy liên hệ với quản trị hệ thống";
                //    return;
                //}
                //// End check List Permission

                DataTable dtb = UserManager.SelectAll();
                if (dtb != null)
                {
                    DataView dv = dtb.DefaultView;
                    string strFilter = "";
                    if (this.txtUser.Text.Trim() != "") strFilter += "UserName LIKE '%" + this.txtUser.Text.Trim() + "%'";

                    dv.RowFilter = strFilter;
                    dv.Sort = "CreatedDate DESC";

                    this.grvUser.DataSource = dv;
                    this.grvUser.DataBind();
                }
            }
            catch (Exception ex)
            {
                this.lblError.Text = ex.Message;
                throw ex;
            }
        }

        private bool CheckValid()
        {
            if (this.txtUserName.Text.Trim() == "")
            {
                this.lblError.Text = "Hãy nhập tên đăng nhập";
                return false;
            }

            return true;
        }

        private void DeleteUser()
        {
            if (vUserName != "")
            {
                if (UserManager.Delete(vUserName))
                {
                    this.lblError.Text = "Đã xóa người dùng";
                    BindData();
                    ClearData();
                }
                else
                    this.lblError.Text = UserManager.ErrorMessage;
            }
        }
        protected void grvUser_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }
        protected void grvUser_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }
        protected void grvUser_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                vUserName = e.CommandArgument.ToString();
                switch (e.CommandName)
                {
                    case "Edit":
                        this.mvDetail.SetActiveView(vDetail);
                        this.pnPass.Visible = false;
                        NewData();
                        EditUser();
                        break;
                    case "Delete":
                        DeleteUser();
                        break;
                    case "Reset":
                        this.mvDetail.SetActiveView(vResetPass);
                        ResetPass();
                        break;
                    default:
                        break;
                }
            }
            catch (Exception ex)
            {
                this.lblError.Text = ex.Message;
                throw ex;
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindData();
        }
        protected void ddlGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindData();
        }
        protected void grvUser_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.grvUser.PageIndex = e.NewPageIndex;
            this.BindData();
        }
        protected void btnNew_Click(object sender, EventArgs e)
        {
            NewData();
            this.mvDetail.SetActiveView(vDetail);
            ClearData();
        }
        private void NewData()
        {
            pnDetail.Enabled = true;
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!CheckValid())
                return;

            if (vUserName != "")
            {
                UserInfo objUser = UserManager.Select(vUserName);
                if (objUser != null)
                {
                    objUser.Email = this.txtEmail.Text.Trim();
                    objUser.Mobile = this.txtMobile.Text.Trim();
                    objUser.Title = this.txtTitle.Text.Trim();
                    if (UserManager.Update(objUser))
                    {
                        this.lblError.Text = "Đã cập nhật";
                        BindData();
                        ClearData();
                    }
                    else
                        this.lblError.Text = UserManager.ErrorMessage;
                }
            }
            else
            {
               if (UserManager.SelectByUserName(this.txtUserName.Text.Trim()) == null)
                {
                    UserInfo objUser = new UserInfo();
                    objUser.UserName = this.txtUserName.Text.Trim();
                    objUser.Email = this.txtEmail.Text.Trim();
                    objUser.Mobile = this.txtMobile.Text.Trim();
                    objUser.Title = this.txtTitle.Text.Trim();
                    objUser.Password = Util.MD5Encrypt(this.txtPassword.Text.Trim(),true);
                    objUser.CreatedDate = DateTime.Now;
                    objUser.CreatedBy = Authentication.CurrentUser.UserName;
                    if (UserManager.Insert(objUser))
                    {
                        this.lblError.Text = "Đã thêm mới";
                        BindData();
                        ClearData();
                    }
                    else
                        this.lblError.Text = UserManager.ErrorMessage;
                }
                else
                {
                    this.lblError.Text = "Tên đăng nhập đã tồn tại, hãy chọn tên khác";
                }
            }
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            if (UserManager.ResetPass(vUserName, Util.MD5Encrypt(this.txtPasswordCP.Text.Trim(),true)))
                this.lblError.Text = "Đã đặt lại mật khẩu";
            else
                this.lblError.Text = UserManager.ErrorMessage;
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            this.mvDetail.SetActiveView(vDetail);
        }
      }
}