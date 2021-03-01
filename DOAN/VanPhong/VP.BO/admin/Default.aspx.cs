using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common;
using Manager;
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["session"] != null)
                this.lblError.Text = Request.QueryString["session"].ToString() == "timeout" ? "Vui lòng đăng nhập lại" : "";
            if (!IsPostBack)
            {
                //if (Authentication.IsAuthenticated())
                //{
                //    Response.Redirect(Config.HomePage() + "Home.aspx?module=dashboard");
                //}
                loadRemember();
            }
        }
        private void loadRemember()
        {
            try
            {
                string login = Request.Cookies["musicviet"].Value;
                this.txtUserName.Value = login.Substring(0, login.IndexOf("|"));
                this.txtPassword.Attributes.Add("value", login.Substring(login.IndexOf("|", 0) + 1));
                this.chkRemember.Checked = true;
            }
            catch { }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (!txtUserName.Value.Equals(null) && !txtPassword.Value.Equals(null))
            {
                Response.Cookies["musicviet"].Expires = DateTime.Now.AddDays(-1);
                if (Page.IsValid)
                {
                    string message = "";
                    UserInfo objUser = Authentication.Login(this.txtUserName.Value.Trim(), Util.MD5Encrypt(this.txtPassword.Value.Trim(),true), out message);


                    if (objUser != null)
                    {
                       if (chkRemember.Checked)
                        {
                            HttpCookie MyCookie = new HttpCookie("agent.ipay.com.vn");
                            MyCookie.Value = txtUserName.Value + "|" + txtPassword.Value;
                            MyCookie.Expires = DateTime.Now.AddDays(30);
                            Response.Cookies.Add(MyCookie);
                        }
                        else
                        {
                            Response.Cookies["admin.ipay.com.vn"].Expires = DateTime.Now.AddDays(-1);
                        }
                        Session["UserName"] = objUser.UserName;
                        Session["UserInfo"] = objUser;
                        Response.Redirect("Home.aspx?module=Home");
                    }
                    else
                        this.lblError.Text = message;
                }
                else
                {
                    this.lblError.Text = "Thông tin đăng nhập không đúng, hãy kiểm tra lại";
                }
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtUserName.Value = "";
            txtPassword.Value = "";
            chkRemember.Checked = false;
        }
    }
