using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Manager;
using Common;
using System.Data;

namespace Musicviet.Control
{
    public partial class Right : WebControlBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
               GetTopNewsRight();
               GetProductsRight();
               CategoryProduct();
               CategoryNews();
            }

        }

        public  void CategoryProduct()
        {

            DataTable dt = CategoryManager.SelectCategoryProducts();
            rptCategoryProducts.DataSource = dt;
            rptCategoryProducts.DataBind();

        }

        public void CategoryNews()
        {
            DataTable dt = CategoryManager.SelectCategoryNews();
            dtlcategoryNews.DataSource = dt;
            dtlcategoryNews.DataBind();
            

        }


        protected void rptCategory_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView dr = (DataRowView)e.Item.DataItem;
                Repeater rptMenu = (Repeater)e.Item.FindControl("rptMenu");
                DataTable dt1 = CategoryManager.SelectSubCateForMenu(Int32.Parse(dr.Row["CategoryID"].ToString()));
                if (dt1 != null)
                {
                    rptMenu.DataSource = dt1;
                    rptMenu.DataBind();
                }
            }

        }
        public  void GetProductsRight()
        {

            DataTable dt = ProductManager.SelectProductRight(5);
            dtlselectproductright.DataSource = dt;
            dtlselectproductright.DataBind();

        }

        public void GetTopNewsRight()
        {
            DataTable dt = NewsManager.SelectNewsTopRight(5);
            dtlTopNews.DataSource = dt;
            dtlTopNews.DataBind();

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