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
    public partial class SearchPro :WebControlBase 
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Common.PageTitle.PageTitles = "Tìm kiếm";
                GetCategory();

            }
            BindDataOne();
        }

        public void GetCategory()
        {
            DataTable dv = CategoryManager.SelectCategoryProducts();
            rptCategory.DataSource = dv;
            rptCategory.DataBind();
        }
        protected void BindDataOne()
        {

            try
            {
                string[] oke = Request["key"].ToString().Split(',');
                if (oke[1] == "0")
                {
                    DataTable dCat = ProductsManager.SelectSearchPro(oke[0]);
                    if (dCat.Rows.Count > 0)
                    {
                        clpNews.MaxPages = 10000000;
                        clpNews.PageSize = 10; // số items hiển thị trên một trang.
                        clpNews.DataSource = dCat.DefaultView;
                        clpNews.BindToControl = rptProductbycate;
                        rptProductbycate.DataSource = clpNews.DataSourcePaged;
                        rptProductbycate.DataBind();
                    }
                    else
                    {
                        lblError.Text = "Không tìm thấy kết quả nào.";
                        lblError.Visible = true;
                    }

                }
                if (oke[1] == "1")
                {
                    DataTable dCat = ProductsManager.SelectSearchProMa(oke[0]);
                    if (dCat.Rows.Count > 0)
                    {
                        clpNews.MaxPages = 10000000;
                        clpNews.PageSize = 10; // số items hiển thị trên một trang.
                        clpNews.DataSource = dCat.DefaultView;
                        clpNews.BindToControl = rptProductbycate;
                        rptProductbycate.DataSource = clpNews.DataSourcePaged;
                        rptProductbycate.DataBind();
                    }
                    else
                    {
                        lblError.Text = "Không tìm thấy kết quả nào.";
                        lblError.Visible = true;
                    }

                }
    
            }
            catch (Exception)
            {
                throw;
            }
        }


        public static string BinPercent(object ProductPrice, object Discount)
        {
            decimal oke = 0;
            try
            {
                if (Discount.ToString() != "")
                {
                    oke = Decimal.Parse(ProductPrice.ToString()) / Decimal.Parse(Discount.ToString());
                    return "<span class='iconPercent'> -" + Math.Round((decimal)(oke)) + "% </span><span class='iconProHot'></span>";
                }
                else
                {
                    return "";
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public static string Getprice(object ProductPrice, object Discount)
        {
            if (Discount != null)
            {
                return "<div class='proPrice'><span class='realPrice'>" + Util.DecimalObjectToString(ProductPrice.ToString()) + "VNĐ</span><span class='salePrice'>" + Util.DecimalObjectToString(Discount.ToString()) +
                "VNĐ</span></div>";

            }
            else
            {
                return "<div class='proPrice'><span class='realPrice'></span><span class='salePrice'>" + Util.DecimalObjectToString(ProductPrice.ToString()) +
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

        public static string GenerateCateURL(object strId, object Title)
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

        protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindDataOne();
        }
    }
}