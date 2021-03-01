using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Manager;

namespace Musicviet
{
    public partial class cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string productId = Request["ProductID"];
            AddToCart(productId, "1");
            int c = CountTotal();
            Response.Write(CountTotal());
            Response.End();

        }
        DataTable DTShoppingCart;
        protected DataTable CreateTable()
        {
            DTShoppingCart = new DataTable("ShoppingCart");
            DTShoppingCart.Columns.Add("ProductId", typeof(String));
            DTShoppingCart.Columns.Add("Name", typeof(String));
            DTShoppingCart.Columns.Add("ImgPath", typeof(String));
            DTShoppingCart.Columns.Add("Quantity", typeof(String));
            DTShoppingCart.Columns.Add("Price", typeof(String));
            return DTShoppingCart;
        }
        protected void AddToCart(string productId, string quantity)
        {
            ProductsInfo info = ProductsManager.Select(int.Parse(productId));
            bool check = false;
            if (Session["Cart"] != null)
            {
                DataTable dx = (DataTable)Session["Cart"];
                foreach (DataRow dtRow in dx.Rows)
                {
                    if (dtRow["ProductId"].ToString().Equals(productId))
                    {
                        dtRow["Quantity"] = int.Parse(dtRow["Quantity"].ToString()) + int.Parse(quantity);
                        check = true;
                    }
                }
                if (!check)
                {
                    DataRow dr = dx.NewRow();
                    dr["ProductId"] = info.ProductID;
                    dr["Name"] = info.ProductName;
                    dr["ImgPath"] = info.ProductImage;
                    dr["Quantity"] = 1;
                    if (Decimal.Parse(info.Discount.ToString().Trim()) == 0)
                    {

                        dr["Price"] = info.ProductPrice;
                    }
                    else
                    {
                        dr["Price"] = info.Discount;
                    }
                    dx.Rows.Add(dr);
                }
                Session["Cart"] = dx;
            }
            else
            {
                Session["Cart"] = CreateTable();
                DataRow dr = DTShoppingCart.NewRow();
                dr["ProductId"] = info.ProductID;
                dr["Name"] = info.ProductName;
                dr["ImgPath"] = info.ProductImage;
                dr["Quantity"] = 1;
                if (Decimal.Parse(info.Discount.ToString().Trim()) == 0)
                {

                    dr["Price"] = info.ProductPrice;
                }
                else
                {
                    dr["Price"] = info.Discount;
                }
                DTShoppingCart.Rows.Add(dr);
                Session["Cart"] = DTShoppingCart;
            }
        }
        private int CountTotal()
        {
            int count = 0;
            DataTable dt = (DataTable)Session["Cart"];
            if (dt != null)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    count++;
                }
            }
            return count;
        }
    }
}