using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common;
using Manager;
using System.Data;

namespace Musicviet.Module
{
    public partial class CenterNews : WebControlBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            
            if (!IsPostBack)
            {
                //GetAllNews();
                //GetCategoryone();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "initHIS3", "initHIS3();", true);
                this.Page.Title = "Tin tức";
                DataView dvOther = CategoryManager.SelectLevel1_News().DefaultView;
                dvOther.RowFilter = "NewsID > 0";
                dtlCat.DataSource = dvOther;
                dtlCat.DataBind();
            }
        }

        //public void GetCategoryone()
        //{
        //    int CatID = int.Parse(Request["CategoryID"]);
        //    if (Request["CategoryID"] != null)
        //    {
        //        DataTable dt = CategoryManager.Selectone(CatID);
        //        rptCategoryOne.DataSource = dt;
        //        rptCategoryOne.DataBind();
        //    }
        //    else
        //    {
        //        Response.Redirect("Default.aspx?Module=Home");
        //    }
        //}

        //public void GetAllNews()
        //{
        //    if (Request["CategoryID"] != null)
        //    {
        //        int CatID = int.Parse(Request["CategoryID"]);
        //        DataTable dCat = NewsManager.SelectNewsTop6(CatID);
        //        if (dCat.Rows.Count > 0)
        //        {
        //            clpNews.MaxPages = 10000000;
        //            clpNews.PageSize = 6; // số items hiển thị trên một trang.
        //            clpNews.DataSource = dCat.DefaultView;
        //            clpNews.BindToControl = dtlAllNews;
        //            dtlAllNews.DataSource = clpNews.DataSourcePaged;
        //            dtlAllNews.DataBind();
        //        }
        //        else
        //        {
        //            lblError.Text = "Dữ liệu đang cập nhật.";
        //            lblError.Visible = true;
        //        }
        //    }
        //    else
        //    {
        //        Response.Redirect("Default.aspx?Module=Home");
        //    }

        //}
        protected DataTable getNews(int CategoryID)
        {
            DataTable dt = NewsManager.SelectByTopByCat(5, CategoryID, null);
            dt.Rows.RemoveAt(0);
            return dt;
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
            strTitle = "../Chi-tiet/" + strTitle + "-" + strId + ".htm";

            return strTitle;
        }
    }


}