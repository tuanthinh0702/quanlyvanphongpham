using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Manager;

namespace Musicviet.Administrators.Modules
{
    public partial class About : System.Web.UI.UserControl
    {
        private int id = 0;

        protected string imageName
        {
            get
            {
                return ViewState["ImageName"].ToString();
            }
            set
            {
                ViewState["ImageName"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)//tai trang
        {
            id = Request.QueryString["id"] != null ? Int32.Parse(Request.QueryString["id"].ToString()) : 0;//nhap cac gia tri de gui cho webserver
            if (IsPostBack)//goi lai trang 1 lan
                return;
            this.imageName = "";
            if (id > 0)// so lan nhap
                BindObject(id);

        }

        private void BindObject(int objID)
        {
            AbountInfo obj = AbountManager.Select(objID);

            if (obj != null)
            {

                txtDetailText.Value = obj.AbountContent;

            }
        }


        protected void SaveData() //luu du lieu
        {
  
            try
            {
                if (id > 0)
                {
                    AbountInfo info = new AbountInfo();
                    info.AbountContent = txtDetailText.Value;
                    info.AbountID = id;
                    AbountManager.Update(info);
                }
                else
                {
                    //this is a new object.  
                    AbountInfo info = new AbountInfo();
                    info.AbountContent = txtDetailText.Value;
                    AbountManager.Insert(info);
                }

                this.lblError.Text = "Đã lưu dữ liệu thành công";
            }
            catch (Exception ex)
            {
                this.lblError.Text = ex.Message;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;
            SaveData();
        }
    }

}