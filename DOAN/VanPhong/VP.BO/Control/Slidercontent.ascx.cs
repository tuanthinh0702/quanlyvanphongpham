using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common;
using System.Data;
using Manager;

namespace Musicviet.Control
{
    public partial class Slidercontent : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Getproduct();

            }

        }

        public void Getproduct()
        {
            DataTable dt = ProductsManager.SelectAllByTop();
            rptSlidercontent.DataSource = dt;
            rptSlidercontent.DataBind();

        }

        public static string Getprice(object ProductPrice, object Discount)
        {
            if (Discount != null)
            {
                return "<label><div class='gia_tt'>" + Util.DecimalObjectToString(ProductPrice.ToString()) + " VNĐ</div></label><span>" + Util.DecimalObjectToString(Discount.ToString()) +
                "VNĐ</span>";

            }
            else
            {
                return "<label><div class='gia_tt'></div></label><span>" + Util.DecimalObjectToString(ProductPrice.ToString()) +
                "VNĐ</span>";
            }

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
            strTitle = "/San-pham/" + strTitle + "/" + strId + ".htm";

            return strTitle;
        }

    }
}