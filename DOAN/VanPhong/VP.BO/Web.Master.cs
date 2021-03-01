using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Manager;
using Common;
using System.Data;
namespace Musicviet
{
    public partial class Web : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            return;
            string oke = CountTotal().ToString();
            Common.PageTitle.PageTitles = gettitle(6);
            Common.PageTitle.PageDescription = "<meta name='Description'   content='" + getdes(5) + "'" + "/>";
            Common.PageTitle.PageKeywords = "<meta name='Keywords'   content='" + getkey(4) + "'" + "/>";
        }

        //title , keyword , Description

        public string gettitle(int title)
        {
            SettingInfo info = SettingManager.Select(title);
            return info.ValueSetting.ToString();
        }

        public string getkey(int key)
        {
            SettingInfo info = SettingManager.Select(key);
            return info.ValueSetting.ToString();
        }

        public string getdes(int des)
        {
            SettingInfo info = SettingManager.Select(des);
            return info.ValueSetting.ToString();
        }
        
        private int CountTotal()
        {
            int count = 0;
            DataTable dt = (DataTable)Session["Cart"];
            if (dt != null)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    count++;
                }
            }
            return count;
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
         //   if (chkNews.Checked)
         //   {
         //       Response.Redirect("/Tim-kiem-theo-tin-tuc/" + searchInput.Value + ".htm");
         //       //Response.Redirect("Default.aspx?module=Search&key=" + searchInput.Value);
          //  }
         //   else if (chkProduct.Checked)
         //   {
         //       Response.Redirect("/Tim-kiem-theo-san-pham/" + searchInput.Value + ".htm");
         //   }

        }
       
    }
}