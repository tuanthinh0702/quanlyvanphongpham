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
    public partial class Modules : WebControlBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            if (!string.IsNullOrWhiteSpace(Request["cate"]))
            {
                string a = GetCate(Request["cate"]);
                if (!string.IsNullOrWhiteSpace(a))
                {
                    Label1.Text = " » " + a;
                    sapxep.Visible = true;
                    BindDataOne();
                 onePro.Visible = true;
                    //xc.Visible = true;
                }
            }
        }
        protected string GetDir()
        {
            return Server.MapPath("/Upload/");
        }
        protected string GetCate(string cateid)
        {
            CategoryInfo info = CategoryManager.Select(int.Parse(cateid));
            if (info != null)
                return info.CategoryName;
            return "";
        }
        protected void BindDataOne()
        {
            //PagedDataSource objPds = new PagedDataSource();
            //objPds.DataSource = ProductManager.SelectAllCate(int.Parse(Request["CategoryID"])).DefaultView;
            DataView dt = ProductManager.SelectAllCate(int.Parse(Request["cate"])).DefaultView;
            if (ddlSort.SelectedValue != "0" && ddlSort.SelectedValue == "1")
                dt.Sort = "ProductPrice ASC";
            if (ddlSort.SelectedValue != "0" && ddlSort.SelectedValue == "2")
                dt.Sort = "ProductPrice DESC";
            clpNews.MaxPages = 10000000;
            clpNews.PageSize = 12; // số items hiển thị trên một trang.
            clpNews.DataSource = dt;
            clpNews.BindToControl = rptProductOne;
            rptProductOne.DataSource = clpNews.DataSourcePaged;
            rptProductOne.DataBind();
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
        protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindDataOne();
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
            strTitle = "/San-pham/" + strTitle + "-" + strId + ".htm";

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