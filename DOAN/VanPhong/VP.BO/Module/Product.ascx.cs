using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CO.FormHelper;
using Common;
using Manager;

namespace Musicviet.Module
{
    public partial class Product : WebControlBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Common.PageTitle.PageTitles = BindDataCategoryname().ToString();
              
                string a = Request["CategoryID"].ToString();
                if (!string.IsNullOrWhiteSpace(Request["CategoryID"]))
                {
                    lblNamecate.Text = BindDataCategoryname();
                    GetTitle();
                    GetCategory();        
                }
            }
            BindDataOne();
            

        }

        public  void GetCategory()
        {
            DataTable dv = CategoryManager.SelectCategoryProducts();
            rptCategory.DataSource = dv;
            rptCategory.DataBind();
        }

        protected void BindDataOne()
        {
            DataView dt = ProductsManager.SelectProByCateDaotv(int.Parse(Request["CategoryID"])).DefaultView;
            try
            {
                if (ddlSort.SelectedValue!="0"&& ddlSort.SelectedValue=="1")
                    dt.Sort = "CreateOn ASC";
                if (ddlSort.SelectedValue != "0" && ddlSort.SelectedValue == "2")
                    dt.Sort = "ProductPrice ASC";
                if (ddlSort.SelectedValue != "0" && ddlSort.SelectedValue == "3")
                    dt.Sort = "ProductPrice DESC";
                clpNews.MaxPages = 10000000;
                clpNews.PageSize = 16; // số items hiển thị trên một trang.
                clpNews.DataSource = dt;
                clpNews.BindToControl = rptProductbycate;
                rptProductbycate.DataSource = clpNews.DataSourcePaged;
                rptProductbycate.DataBind();
            }
            catch (Exception)
            {
                
                throw;
            }
         
        }

        public string BindDataCategoryname()
        {
            CategoryInfo info = CategoryManager.Select(int.Parse(Request["CategoryID"]));
            return info.CategoryName;
        }

        protected void GetTitle()
        {
            try
            {
                string sTitle = "Trang chủ > ";
                if (Request["CategoryID"] != null)
                {
                    int CatID = int.Parse(Request["CategoryID"]);
                    DataTable dCat = CategoryManager.SelectParentCate(CatID);
                    dCat.Columns.Add("link");
                    for (int i = 0; i < dCat.Rows.Count; i++)
                    {
                        dCat.Rows[i]["link"] = "/Danh-muc-san-pham/" + Util.VietNamese2Varchar(dCat.Rows[i]["CategoryName"].ToString()) + "/" + dCat.Rows[i]["CategoryID"].ToString() + ".htm";

                    }
                    DataRow dr = dCat.NewRow();
                    dr = dCat.NewRow();
                    dr["CategoryName"] = "Trang chủ";
                    dr["link"] = "http://trienlong.com.vn/";
                    dCat.Rows.InsertAt(dr, 0);

                    dtlsitemap.DataSource = dCat;
                    dtlsitemap.DataBind();
                }
                else
                {
                    DataTable dCat = new DataTable();
                    dCat.Columns.Add("CategoryName");
                    dCat.Columns.Add("link");
                    DataRow dr = dCat.NewRow();
                    //dr["CategoryName"] = "Trang chủ";
                    //dr["link"] = "/";
                    //dCat.Rows.Add(dr);

                    dr = dCat.NewRow();
                    dr["CategoryName"] = "Trang chủ";
                    dr["link"] = "http://trienlong.com.vn/";
                    dCat.Rows.InsertAt(dr, 0);

                    dtlsitemap.DataSource = dCat;
                    dtlsitemap.DataBind();
                }
            }
            catch
            {
            }
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
                    oke = (Decimal.Parse(ProductPrice.ToString()) - Decimal.Parse(Discount.ToString())) / (Decimal.Parse(ProductPrice.ToString())) * 100;
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


        public static string GenerateUrlCart(object Title, object strId)
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
            strTitle = "/Gio-hang/" + strTitle + "-" + strId + ".htm";

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