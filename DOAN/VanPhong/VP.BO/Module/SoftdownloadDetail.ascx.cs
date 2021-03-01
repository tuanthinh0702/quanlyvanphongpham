﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Manager;
using  Common;

namespace Musicviet.Module
{
    public partial class SoftdownloadDetail : WebControlBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetAllNewsDetail();
                GetNewsTop6();
            }
        }

        public void GetAllNewsDetail()
        {
            DataTable dtnews = NewsManager.SelectBy(Int32.Parse(Request["NewsID"].ToString()));
            rptNewsDetail.DataSource = dtnews;
            rptNewsDetail.DataBind();

        }
        public void GetNewsTop6()
        {
            DataTable dtNewOther = NewsManager.SelectNewOther(Int32.Parse(Request["NewsID"].ToString()));
            dtlOther.DataSource = dtNewOther;
            dtlOther.DataBind();

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
           strTitle = "../Phan-mem/" + strTitle + "-" + strId + ".htm";

           return strTitle;
       }
    }
  }