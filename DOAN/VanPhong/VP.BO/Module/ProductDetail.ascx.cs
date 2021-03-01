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
    public partial class ProductDetail :WebControlBase
    {

        protected string detail
        {
            get
            {
                return ViewState["Detail"].ToString();
            }
            set
            {
                ViewState["Detail"] = value;
            }
        }

        protected string hotline
        {
            get
            {
                return ViewState["Hotline"].ToString();
            }
            set
            {
                ViewState["Hotline"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                return;
            }
            Common.PageTitle.PageTitles = gettitle(int.Parse(Request["id"]));
            Common.PageTitle.PageDescription = "<meta name='Description'   content='" + getDes(int.Parse(Request["id"])) + "'" + "/>";
            Common.PageTitle.PageKeywords = "<meta name='Keywords'   content='" + getkey(int.Parse(Request["id"])) + "'" + "/>";
            BindData();
            this.detail = getDetailProduct(int.Parse(Request["id"]));
            this.hotline = gethotline(3);
            BindOther();
            GetProductTop();
        }

        /*title*/
        public string gettitle(int id)
        {
            ProductsInfo info = ProductsManager.Select(id);
            return CatChuoi(info.ProductName.ToString(), 10);
        }

        public string getkey(int id)
        {
            ProductsInfo info = ProductsManager.Select(id);
            return CatChuoi(info.SubProductName.ToString(), 15);
        }
        public string getDes(int id)
        {
            ProductsInfo info = ProductsManager.Select(id);
            return CatChuoi(info.SubProductName.ToString(), 20);
        }

        /* hotline*/
        public string gethotline(int hotline)
        {
            SettingInfo info = SettingManager.Select(hotline);
            return info.ValueSetting.ToString();
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

        protected  void BindData()
        {
            try
            {
             rptproductdetail.DataSource = ProductsManager.SelectProOne(int.Parse(Request["id"]));
              rptproductdetail.DataBind();
            }
            catch (Exception)
            {
                rptproductdetail.DataSource = null;
                rptproductdetail.DataBind();
                throw;
            }

        }

        protected void BindOther()
        {
            try
            {
                rptproductother.DataSource = ProductsManager.SelectProductOther(int.Parse(Request["id"]));
                rptproductother.DataBind();
            }
            catch (Exception)
            {
                rptproductother.DataSource = null;
                rptproductother.DataBind();
            }
        }

        public string getDetailProduct(int id)
        {
            ProductsInfo info = ProductsManager.Select(id);
            try
            {
                return info.Description.ToString();
            }
            catch (Exception)
            {

                return "";
            }
        }

        protected void rptproductdetail_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Repeater rpt1 = (Repeater)e.Item.FindControl("rptimgmore");
            rpt1.DataSource = ABC().AsEnumerable().Take(4).CopyToDataTable();
            rpt1.DataBind();
        }

        protected DataTable ABC()
        {
            DataTable dataImg = new DataTable();
            //bind lai datatable image
            dataImg.Columns.Add("ImagePath");
            dataImg.Columns.Add("ProductName");
            ProductsInfo obj = ProductsManager.Select(int.Parse(Request["id"]));
            string[] aStrings = obj.ProductImageList.Remove(obj.ProductImageList.Length-1).Split('|');
            for (int i = 0; i < aStrings.Count(); i++)
            {
                DataRow dr = dataImg.NewRow();
                dr["ImagePath"] = aStrings[i];
                dr["ProductName"] = obj.ProductName;
                dataImg.Rows.Add(dr);
            }
            return dataImg;
        }

        public static string BinPercentDetail(object ProductPrice, object Discount)
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
                    return "<span class='percent-label'>Phần trăm giảm: <strong>" + Math.Round((decimal)(oke)) + "</strong>%</span>";
                }
            }
            catch (Exception)
            {

                throw;
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

        public static string GetpriceDetail(object ProductPrice, object Discount)
        {
            if (decimal.Parse(Discount.ToString()) == 0)
            {
                return "<span class='sale-price'>" + Util.DecimalObjectToString(ProductPrice.ToString()) + "VNĐ</span>";
               
            }
            else
            {
                return "<span class='sale-price'>" + Util.DecimalObjectToString(Discount.ToString()) + "VNĐ</span><span class='real-price-label'>Giá gốc: </span><span class='real-price'>" + Util.DecimalObjectToString(ProductPrice.ToString()) + "VNĐ</span>";
                    
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

        
    }
}