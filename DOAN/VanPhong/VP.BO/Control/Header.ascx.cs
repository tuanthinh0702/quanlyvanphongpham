using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common;
using Manager;
using System.Data;
namespace Musicviet.Control
{
    public partial class Header :WebControlBase
    {

        public string logo
        {
            get { return ViewState["logo"].ToString(); }
            set { ViewState["logo"] = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                //tham gio hang
                numbercart.Text = CountTotal().ToString();
                lblHotline.Text = GetHotline(3).ToString().Trim();
                Support();
                Getsever();
                GetProCate();
                GetCateNews();
                logo = Getlogo(1).ToString();

            }
        }

        public string Getlogo(int id)
        {
            HeadFooterInfo info = HeadFooterManager.Select(id);
            return info.Contents;

        }

        public string GetHotline(int key)
        {
            SettingInfo info = SettingManager.Select(key);
            return info.ValueSetting.ToString();
        }
        public void Support()
        {
            DataTable dt = SupportManager.SelectAll();
            rptSupport.DataSource = dt;
            rptSupport.DataBind();
        }

        public string GetSupport(int type, string srt)
        {
            if (type == 2)
            {
                return "<a class='yahoo-img' style='text-decoration: none;' href='skype:" + srt + "?chat'><img src='/images/skype_icon.png' alt='Tư vấn' title='Tư vấn' style='border: 0px;' width='16px' /></a>";
            }
            else
            {
                return "<a class='yahoo-img' style='text-decoration: none;' href='ymsgr:sendim?" + srt + "'><img src='http://opi.yahoo.com/online?u=" + srt + "&m=g&t=5'  style='border: 0px;' /></a>";
            }
        }

        public void Getsever()
        {
            DataTable dt = NewsManager.SelectNewsbyStatut(2);
            rptsever.DataSource = dt;
            rptsever.DataBind();
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

        public void GetCateNews()
        {
            DataTable dv = CategoryManager.SelectAllCateByStatus(0);
            //rptCateNews.DataSource = dv;
            //rptCateNews.DataBind();
        }

        public void GetProCate()
        {
            DataTable dv = CategoryManager.SelectCategoryProducts();
            rptcate.DataSource = dv;
            rptcate.DataBind();

        }

        protected void rptcate_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView dr = (DataRowView)e.Item.DataItem;
                Repeater rptSubCate = (Repeater)e.Item.FindControl("rptSubCate");
                DataTable dv = CategoryManager.SelectSubCateForMenu(Int32.Parse(dr.Row["CategoryID"].ToString()));
                if (dv != null)
                {
                    rptSubCate.DataSource = dv;
                    rptSubCate.DataBind();
                }
            }
        }

        protected void rptSubCate_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView dr = (DataRowView)e.Item.DataItem;
                Repeater subContent = (Repeater)e.Item.FindControl("subContent");
                DataTable dv = CategoryManager.SelectSubCateForMenu(Int32.Parse(dr.Row["CategoryID"].ToString()));
                if (dv != null)
                {
                    subContent.DataSource = dv;
                    subContent.DataBind();
                }
            }
        }

        protected void btnSearchPro_Click(object sender, EventArgs e)
        {

            Response.Redirect("/Tim-kiem-theo-san-pham/" + txtSearchPro.Text.ToString().Trim() + "," + DropDownList1.SelectedValue + ".htm");
          

        }

        public string imagePath
        {
            get { return Config.GetAppSetting("NewsImagePath"); }
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
                return strReturn + ".";
            }
            else
            {
                return chuoiKyTu.ToString();
            }
        }

        public static string GenerateNewsURL(object strId, object Title)
        {
            string strTitle = Title.ToString();
            strTitle = Util.VietNamese2Varchar(strTitle).ToString();
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
            strTitle = "/Chuyen-muc/" + strTitle + "/" + strId + ".htm";

            return strTitle;
        }

        public static string GenerateServerURL(object strId, object Title)
        {
            string strTitle = Title.ToString();
            strTitle = Util.VietNamese2Varchar(strTitle).ToString();
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

        public static string GenerateNewsDetailURL(object strId, object Title)
        {
            string strTitle = Title.ToString();
            strTitle = Util.VietNamese2Varchar(strTitle).ToString();
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

        public static string GenerateURL(object strId, object Title)
        {
            string strTitle = Title.ToString();
            strTitle = Util.VietNamese2Varchar(strTitle).ToString();
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
            strTitle = "/Danh-muc-san-pham/" + strTitle + "/" + strId + ".htm";

            return strTitle;
        }
    }
}