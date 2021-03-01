using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Common;
using Manager;
namespace Musicviet.Administrators.Modules
{
    public partial class SliderMgr : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                return;
            }
            BindData();
        }
        private void BindData()
        {
            grData.DataSource = SliderManager.SelectAll();
            grData.DataBind();
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
                        SliderManager.Delete(int.Parse(htmlCheckBox.Value));
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