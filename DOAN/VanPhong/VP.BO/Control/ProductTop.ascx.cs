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
    public partial class ProductTop : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetProductTop();
            }
        }

        public void GetProductTop()
        {
            DataTable dt = ProductsManager.SelectAllByTop();
            rptproducttop.DataSource = dt;
            rptproducttop.DataBind();
        }

        public static string BinPercent(object ProductPrice, object Discount)
        {
            decimal oke = 0;
            try
            {
                if (decimal.Parse(Discount.ToString()) == 0)
                {
                    return "";
                }
                else
                {
                    oke = Decimal.Parse(ProductPrice.ToString()) / Decimal.Parse(Discount.ToString());
                    return "<span class='iconPercent'> -" + Math.Round((decimal)(oke)) + "% </span>";
                }
            }
            catch (Exception)
            {

                throw;
            }


        }

        public static string Getprice(object ProductPrice, object Discount)
        {
            if (decimal.Parse(Discount.ToString()) == 0)
            {
                return "<div class='proPrice'><span class='realPrice'></span><span class='salePrice'>" + Util.DecimalObjectToString(ProductPrice.ToString()) +
               "VNĐ</span></div>";

            }
            else
            {
                return "<div class='proPrice'><span class='realPrice'>" + Util.DecimalObjectToString(ProductPrice.ToString()) + "VNĐ</span><span class='salePrice'>" + Util.DecimalObjectToString(Discount.ToString()) +
                "VNĐ</span></div>";
            }

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

   

        public string imagePath
        {
            get { return Config.GetAppSetting("NewsImagePath"); }
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
            strTitle = "/San-pham/" + strTitle + "/" + strId + ".htm";

            return strTitle;
        }

    }
}