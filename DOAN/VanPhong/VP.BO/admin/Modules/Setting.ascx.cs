using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common;
using Manager;
namespace Musicviet.Administrators.Modules
{
    public partial class Setting : System.Web.UI.UserControl
    {
        private int id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Request.QueryString["id"] != null ? Int32.Parse(Request.QueryString["id"].ToString()) : 0;
            if(IsPostBack)return;
            UpdatePanel1.Visible = false;
            UpdatePanel2.Visible = false;
            if (id > 0)
                BindObject(id);
        }
        private void BindObject(int objID)
        {
            SettingInfo obj = SettingManager.Select(objID);

            if (obj != null)
            {
                

                if (obj.CodeSetting.ToString().Trim() == "EMO" || obj.CodeSetting.ToString().Trim() == "EMC" || obj.CodeSetting.ToString().Trim() == "HOTLINE" || obj.CodeSetting.ToString().Trim() == "TITLE" || obj.CodeSetting.ToString().Trim() == "URL" || obj.CodeSetting.ToString().Trim() == "FACEBOOK" || obj.CodeSetting.ToString().Trim() == "GOOGLEPLUS" || obj.CodeSetting.ToString().Trim() == "TIWTTER")
                {
                    UpdatePanel1.Visible = true;
                    txtDes.Text = obj.Description;
                    txtValue.Text = obj.ValueSetting;
                    txtCode.Text = obj.CodeSetting;
                }
                else
                {
                    UpdatePanel2.Visible = true;
                    txtDes.Text = obj.Description;
                    txtValue1.Text = obj.ValueSetting;
                    txtCode.Text = obj.CodeSetting;
                }

            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (id > 0)
            {
                SettingInfo info = new SettingInfo();
                info.ID = id;
                info.CodeSetting = txtCode.Text;
                info.Description = txtDes.Text;
                if (UpdatePanel1.Visible==true)
                {
                    info.ValueSetting = txtValue.Text;
                }
                else
                {
                    info.ValueSetting = txtValue1.Text;
                }
                info.Status = true;
                bool ok = SettingManager.Update(info);
                if (ok)
                {
                    lblError.Text = "Cập nhật cài đặt thành công";
                }
                else
                {
                    lblError.Text = "Có lỗi xảy ra khi cập nhật";
                }
            }
            else
            {
            SettingInfo info = new SettingInfo();
            info.CodeSetting = txtCode.Text;
            info.Description = txtDes.Text;
            info.ValueSetting = txtValue.Text;
                info.Status = true;
          bool ok=SettingManager.Insert(info);
                if (ok)
                {
                    lblError.Text = "Thêm mới cài đặt thành công";
                }
                else
                {
                    lblError.Text = "Có lỗi xảy ra khi thêm mới";
                }
            }
          
        }
    }
}