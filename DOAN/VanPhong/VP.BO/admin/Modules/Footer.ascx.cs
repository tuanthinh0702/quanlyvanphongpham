using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Manager;
using Common;
namespace Musicviet.Administrators.Modules
{
    public partial class Footer : System.Web.UI.UserControl
    {
        private int id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Request.QueryString["id"] != null ? Int32.Parse(Request.QueryString["id"].ToString()) : 0;
            if (IsPostBack)
                return;
            if (id > 0)
                BindObject(id);
        }

        private void BindObject(int i)
        {
            HeadFooterInfo obj = HeadFooterManager.Select(i);
            txtDetailText.Value = obj.Contents;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if(id>0)
            {
                HeadFooterInfo obj = new HeadFooterInfo();
                obj.Contents = txtDetailText.Value;
                obj.Type = 2;//footer 
                obj.ID = id;
                HeadFooterManager.Update(obj);
                lblError.Text = "Cập nhật thành công";
            }
            else
            {
                HeadFooterInfo obj = new HeadFooterInfo();
                obj.Contents = txtDetailText.Value;
                obj.Type = 2;//footer
                HeadFooterManager.Insert(obj);
                lblError.Text = "Thêm mới thành công";
            }
        }
    }
}