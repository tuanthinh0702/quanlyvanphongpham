using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common;
using Manager;

namespace Musicviet.Module
{
    public partial class Contact : WebControlBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack)return;
        }
        public void SendMail()
        {
        SettingInfo info = SettingManager.SelectCode("EMC");
            int counts = 1;
            // obj.Status = int.Parse(ddlStatus.SelectedValue);
            string content = "<div><fieldset style='border: 1px solid #5a5f65; padding: 20px 0px 0px 30px;'><legend style='margin-left:30px;'>Thông tin chung</legend>";
            content += "<p>Thông báo nội dung đơn hàng trên trang GAONUOC.COM</p>";

            content += "<p>Tên người gửi: <b>" +txtName.Text + "</b></p>";
            content += "<p>Số điện thoại: <b>" + txtPhone.Text + "</b></p>";
                 content += "<p>Email: <b>" + txtEmail.Text + "</b></p>";
            content += "<p>Địa chỉ: <b>" + txtAddress.Text + "</b></p>";
                 content += "<p>Nội dung: " + txtNote.Text + "</p>";
            content += "<p>Ngày gửi: <b>" + DateTime.Now.ToString("dd/MM/yyyy hh:ss") + "</b></p>" +
                       "</fieldset></div><br/>";
            content += "<p><b>VUI LÒNG KHÔNG TRẢ LỜI THƯ NÀY</b>.</p>";
            content += "<p>***************************************************************</p>";
            CO.FormHelper.FormHelper.SendMail(info.ValueSetting, "Thông tin liên hệ của khách hàng", content);
         
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (txtCode.Text.Trim() == ImageVerifier2.Text)
            {
                SendMail();
                Response.Write("<script>alert('Cảm ơn bạn đã gửi liên hệ cho chúng tôi')</script>");
                txtCode.Text = "";
                txtAddress.Text = "";
                txtEmail.Text = "";
                txtName.Text = "";
                txtNote.Text = "";
                txtPhone.Text = "";
            }
            else
            {
                Label1.Text = "Nhập lại mã bảo mật";
            }
        }
      }
    }
