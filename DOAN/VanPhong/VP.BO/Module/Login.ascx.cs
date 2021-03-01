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
    public partial class Login : WebControlBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
              
                Common.PageTitle.PageTitles = "Đăng nhập";
                Getsever();
                GetTitle();
            }
        }

        public void Getsever()
        {
            DataTable dt = NewsManager.SelectNewsbyStatut(2);
            rptnewscategory.DataSource = dt;
            rptnewscategory.DataBind();
        }
        /*title*/
        public string gettitle(int id)
        {
            NewsInfo info =NewsManager.Select(id);
            return CatChuoi(info.Title.ToString(), 10);
        }

        public string getkey(int id)
        {
            NewsInfo info = NewsManager.Select(id);
            return CatChuoi(info.Summary.ToString(), 15);
        }
        public string getDes(int id)
        {
            NewsInfo info = NewsManager.Select(id);
            return CatChuoi(info.Summary.ToString(), 20);
        }
        
        protected void GetTitle()
        {
            try
            {
                string sTitle = "Trang chủ > ";
                if (Request["NewsID"].ToString() != null)
                {
                    int NewID = Int32.Parse(Request["NewsID"].ToString());
                    DataTable dCat = NewsManager.SelectBy(NewID);
                    dCat.Columns.Add("link");
                    for (int i = 0; i < dCat.Rows.Count; i++)
                    {
                        dCat.Rows[i]["link"] = "/Chi-tiet/" + Util.VietNamese2Varchar(dCat.Rows[i]["Title"].ToString()) + "/" + dCat.Rows[i]["NewsID"].ToString() + ".htm";

                    }
                    DataRow dr = dCat.NewRow();
                    dr = dCat.NewRow();
                    dr["Title"] = "Trang chủ";
                    dr["link"] = "#";
                    dCat.Rows.InsertAt(dr, 0);

                    dtlSitemap.DataSource = dCat;
                    dtlSitemap.DataBind();
                }
                else
                {
                    DataTable dCat = new DataTable();
                    dCat.Columns.Add("Title");
                    dCat.Columns.Add("link");
                    DataRow dr = dCat.NewRow();
                    //dr["CategoryName"] = "Trang chủ";
                    //dr["link"] = "/";
                    //dCat.Rows.Add(dr);

                    dr = dCat.NewRow();
                    dr["Title"] = "Trang chủ";
                    dr["link"] = "#";
                    dCat.Rows.InsertAt(dr, 0);

                    dtlSitemap.DataSource = dCat;
                    dtlSitemap.DataBind();
                }
            }
            catch
            {
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
            strTitle = "/Chi-tiet/" + strTitle + "/" + strId + ".htm";

            return strTitle;
        }
    }
}