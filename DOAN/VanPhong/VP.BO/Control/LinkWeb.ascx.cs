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
    public partial class LinkWeb : WebControlBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                GetProductNew();
            }
        }

        public void GetProductNew()
        {
            //DataTable dt = HtmlBoxManager.SelectLink(5);
            //dtlLink.DataSource = dt;
            //dtlLink.DataBind();
            rptProNew.DataSource = ProductManager.SelectProductNew();
            rptProNew.DataBind();
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

    }
}