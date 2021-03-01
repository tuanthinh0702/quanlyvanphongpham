using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Manager;
using System.Data;
using Common;
using Musicviet.Class;

namespace Musicviet.Module
{
    public partial class PayConfirm : WebControlBase
    {
        protected string userId
        {
            get
            {
                return ViewState["userId"].ToString();
            }
            set
            {
                ViewState["userId"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //phan dang nhap
            if (Request.QueryString["session"] != null)
                this.lblError.Text = Request.QueryString["session"].ToString() == "timeout" ? "Vui lòng đăng nhập lại" : "";
            //end phan dang nhap

            BindTitles();
            if (IsPostBack) return;
            userId = "";
            loadRemember();
            Common.PageTitle.PageTitles = "Thanh toán";
            if (Session["Cart"] == null || string.IsNullOrWhiteSpace(Session["Cart"].ToString()))
                Response.Redirect("/");
            BindBank();
            BindTitles();
            Getsever();
        }

        //phan dang nhap
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
                    UserInfo objUser = Authentication.Login(this.txtUserName.Value.Trim(), Util.MD5Encrypt(this.txtPassword.Value.Trim(), true), out message);


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
                        userId = objUser.UserName;
                        Session["UserInfo"] = objUser;
                        plLogin.Visible = false;
                        pldangnhapthanhcong.Visible = true;

                        lblfullname.Text = objUser.FullName;
                        lblphone.Text = objUser.Mobile;
                        lbladress.Text = objUser.Adresss;
                    }
                    else
                        this.lblError1.Text = message;
                }
                else
                {
                    this.lblError1.Text = "Thông tin đăng nhập không đúng, hãy kiểm tra lại";
                }
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtUserName.Value = "";
            txtPassword.Value = "";
            chkRemember.Checked = false;
            Response.Redirect("/Thanh-toan.htm");

        }
        //end 
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (CheckValid())
            {
                if (rdoHome.Checked)
                {
                    SaveOrder();
                    buy.Visible = false;
                    Session.Abandon();
                    Response.Redirect("/Thanh-toan-thanh-cong.htm");
                }
                if (rdoOnline.Checked)
                {
                    SaveOrder();
                    buy.Visible = false;
                    Session.Abandon();
                    Response.Redirect("/Thanh-toan-thanh-cong.htm");
                }
            }
            else
            {
                Label1.Text = "*";
            }
        }
        protected string SaveOrder()
        {
            string OrderNo = OrderManager.GenOrderCode();
            //chi tiet order
            DataTable dtOrderItem = (DataTable)Session["Cart"];
            if (dtOrderItem != null)
            {
                foreach (DataRow dr in dtOrderItem.Rows)
                {
                    OrderItemInfo info = new OrderItemInfo();
                    info.OrderNo = OrderNo;
                    info.ProductID = int.Parse(dr["ProductID"].ToString());
                    info.Price = decimal.Parse(dr["Price"].ToString());
                    info.Quanity = int.Parse(dr["Quantity"].ToString());
                    OrderItemManager.Insert(info);
                }

                OrderInfo orderInfo = new OrderInfo();
                orderInfo.OrderNo = OrderNo;
                //tao tai khoan moi 
                if (userId == "")
                {

                    UserInfo usse = new UserInfo();
                    usse.UserName = txtuser.Text;
                    usse.Password = Util.MD5Encrypt(this.txtpass.Text.Trim(), true);
                    usse.FullName = txtName.Text.Trim();
                    usse.Adresss = txtAddress.Text.Trim();
                    usse.Mobile = txtPhone.Text.Trim();
                    usse.Email = txtEmail.Text.Trim();
                    usse.CreatedDate = DateTime.Now;
                    usse.Status = 1;
                    UserManager.Insert(usse);
                    orderInfo.Name = txtuser.Text;
                }
                if (userId != "")
                {
                    orderInfo.Name = userId;
                }

                //insert usser khach hang vao bang order

                orderInfo.Notes = txtNote.Text.Trim();
                orderInfo.Total = countTotal();
                orderInfo.OrderDate = DateTime.Now;
                orderInfo.BankID = CO.FormHelper.FormHelper.GetBankCode(ddlBank.SelectedItem.Text);
                orderInfo.Status = 0;
                OrderManager.Insert(orderInfo);
                SendMail(OrderNo);
            }
            return OrderNo;
        }
        private decimal countTotal()
        {
            decimal count = 0;
            DataTable dt = (DataTable)Session["Cart"];
            if (dt != null)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    count += decimal.Parse(dr["Price"].ToString()) * int.Parse(dr["Quantity"].ToString());
                }
            }
            return count;
        }
        public void SendMail(string orderId)
        {
            DataTable dt = (DataTable)Session["Cart"];
            OrderInfo obj = OrderManager.Select(orderId);
            SettingInfo info = SettingManager.SelectCode("EMO");
            int counts = 1;
            // obj.Status = int.Parse(ddlStatus.SelectedValue);
            string content = "<div><fieldset style='border: 1px solid #5a5f65; padding: 20px 0px 0px 30px;'><legend style='margin-left:30px;'>Thông tin chung</legend>";
            content += "<p>Thông báo nội dung đơn hàng trên trang Thamthanhphat.com</p>";
            content += "<p>Mã đơn hàng: <b>" + obj.OrderNo + "</b></p>";
            content += "<p>Tên khách hàng: <b>" + txtName.Text + "</b></p>";
            content += "<p>Số điện thoại: <b>" + txtPhone.Text + "</b></p>";
            content += "<p>Email: <b>" + txtEmail.Text + "</b></p>";
            content += "<p>Ghi chú: <b>" + txtNote.Text + "</b></p>";
            content += "<p>Ngày đặt hàng: <b>" + obj.OrderDate + "</b></p>" +
                       "</fieldset></div><br/>";

            content += "<div><fieldset style='border: 1px solid #5a5f65;'><legend style='margin-left:30px;'>Chi tiết đơn hàng</legend>";
            content += "<table border='1' style='min-width: 500px; margin:10px 0px 20px 30px;'><tr style='font-weight: bold;text-align: center; height: 30px;'>" +
                             "<td>STT</td>" +
                             "<td>Tên sản phẩm</td>" +
                             "<td>Giá</td>" +
                             "<td>Số lượng</td>" +
                        "</tr>";
            foreach (DataRow rw in dt.Rows)
            {

                content += "<tr style = 'height:20px;'>";
                content += "<td><p align='center'>" + counts + "</p></td>";
                content += "<td><p align='center'>" + rw["Name"] + "</p></td>";
                content += "<td><p align='center'>" + Util.DecimalObjectToString(rw["Price"]) + "</p></td>";
                content += "<td><p align='center'>" + rw["Quantity"] + "</p></td>";
                content += "</tr>";
                counts++;
            }
            content += "</table>";
            content += "</fieldset></div><br/>";
            content += "<p>Tổng giá trị trên hóa đơn: <b>" + Util.DecimalObjectToString(countTotal()) + "</b></p><br>";
            content += "<p><b>VUI LÒNG KHÔNG TRẢ LỜI THƯ NÀY</b>.</p>";
            content += "<p>***************************************************************</p>";
            CO.FormHelper.FormHelper.SendMail(info.ValueSetting, "Thông tin đơn hàng trên THAMTHANHPHAT.COM", content);
        }
        protected bool CheckValid()
        {
            if (userId == "")
            {
                UserInfo objUser = UserManager.Select(txtuser.Text.ToString().Trim());
                if (objUser != null)
                {
                    lblError.Text = "Tài khoản đã tồn tại ";
                    return false;
                }
            }

            if (txtCodeValid.Text.Trim() != ImageVerifier1.Text)
            {
                lblError.Text = "Hãy nhập chính xác mã bảo mật";
                return false;
            }
            return true;
        }

        protected void rdoOnline_CheckedChanged(object sender, EventArgs e)
        {
            bank_select.Visible = true;
        }

        protected void rdoHome_CheckedChanged(object sender, EventArgs e)
        {
            bank_select.Visible = false;
        }
        /*Bank List*/
        public void BindBank()
        {
            DataTable dt = BankListManager.SelectAvail();
            ddlBank.DataSource = dt;
            ddlBank.DataBind();
            for (int i = 0; i < this.ddlBank.Items.Count; i++)
            {
                ddlBank.Items[i].Enabled = (dt.Rows[i]["Status"].ToString() == "1");
            }

            ddlBank.Items.Insert(0, new ListItem("- Ngân hàng thanh toán -", ""));
        }
        protected void BindTitles()
        {
            if (ddlBank != null)
            {
                foreach (ListItem li in ddlBank.Items)
                {
                    li.Attributes["title"] = li.Value; // setting text value of item as tooltip
                }
            }
        }
        protected void ddlBank_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindTitles();
        }

        protected void btnloginoke_Click(object sender, EventArgs e)
        {
            plLogin.Visible = true;
            pldangnhapky.Visible = false;
            plcreateUsser.Visible = false;
            plthanhtoan.Visible = true;

        }

        protected void btncreate_Click(object sender, EventArgs e)
        {
            plLogin.Visible = false;
            pldangnhapky.Visible = false;
            plcreateUsser.Visible = true;
            plthanhtoan.Visible = true;
        }

        public string CatChuoi(Object chuoiKyTu, Object soChuCanLay)
        {
            String[] str = chuoiKyTu.ToString().Split(' ');

            if (str.Length > Convert.ToInt32(soChuCanLay.ToString()))
            {
                String strReturn = String.Empty;
                for (int i = 0; i < Convert.ToInt32(soChuCanLay.ToString()); i++)
                {
                    strReturn = strReturn + " " + str[i].ToString();
                }
                return strReturn + "...";
            }
            else
            {
                return chuoiKyTu.ToString();
            }
        }
        public static string GenerateURL(object Title, object strId)
        {
            string strTitle = Title.ToString();

            #region Generate SEO Friendly URL based on Title
            //Trim Start and End Spaces.
            strTitle = strTitle.Trim();

            //Trim "-" Hyphen
            strTitle = strTitle.Trim('-');

            strTitle = strTitle.ToLower();
            char[] chars = @"$%#@!*?;:~`+=()[]{}|\'<>,/^&"".".ToCharArray();
            strTitle = strTitle.Replace("c#", "C-Sharp");
            strTitle = strTitle.Replace("vb.net", "VB-Net");
            strTitle = strTitle.Replace("asp.net", "Asp-Net");

            //Replace . with - hyphen
            strTitle = strTitle.Replace(".", "-");

            //Replace Special-Characters
            for (int i = 0; i < chars.Length; i++)
            {
                string strChar = chars.GetValue(i).ToString();
                if (strTitle.Contains(strChar))
                {
                    strTitle = strTitle.Replace(strChar, string.Empty);
                }
            }

            //Replace all spaces with one "-" hyphen
            strTitle = strTitle.Replace(" ", "-");

            //Replace multiple "-" hyphen with single "-" hyphen.
            strTitle = strTitle.Replace("--", "-");
            strTitle = strTitle.Replace("---", "-");
            strTitle = strTitle.Replace("----", "-");
            strTitle = strTitle.Replace("-----", "-");
            strTitle = strTitle.Replace("----", "-");
            strTitle = strTitle.Replace("---", "-");
            strTitle = strTitle.Replace("--", "-");

            //Run the code again...
            //Trim Start and End Spaces.
            strTitle = strTitle.Trim();

            //Trim "-" Hyphen
            strTitle = strTitle.Trim('-');
            #endregion

            //Append ID at the end of SEO Friendly URL
            strTitle = "/Chi-tiet/" + strTitle + "/" + strId + ".htm";

            return strTitle;
        }

        public void Getsever()
        {
            DataTable dt = NewsManager.SelectNewsbyStatut(2);
            rptnewscategory.DataSource = dt;
            rptnewscategory.DataBind();
        }
        /*title*/
    }
}