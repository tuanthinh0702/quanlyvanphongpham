using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Common;

namespace Musicviet.Class
{
    public class OrderProduct
    {
         private readonly DataTable dtOrderItem = new DataTable("OrderItem");
      public OrderProduct()
    {
        dtOrderItem.Columns.Add("ProductID", typeof (String));
        dtOrderItem.Columns.Add("ProductName", typeof (String));
        dtOrderItem.Columns.Add("ProductImage", typeof (String));
        dtOrderItem.Columns.Add("ProductType", typeof (String));
        dtOrderItem.Columns.Add("ProductPrice", typeof (Decimal));
        dtOrderItem.Columns.Add("ProductCode", typeof(String));
        dtOrderItem.Columns.Add("Quanity", typeof(Int32));
     }

    public DataTable AddOrderItem(string id, string name,string image, string type, decimal price, string code)
    {
        bool check = false;

        if (dtOrderItem.Rows.Count != 0)
        {
            foreach (DataRow dtRow in dtOrderItem.Rows)
            {
                if (dtRow["ProductID"].ToString()==id)
                {
                    dtRow["Quanity"] = 1 + Convert.ToInt32(dtRow["Quanity"].ToString()); //+ money;
                    check = true;
                }
            }
        }
            if (!check)
            {
                DataRow drOrderItem2 = dtOrderItem.NewRow();
                drOrderItem2["ProductID"] = id;
                drOrderItem2["ProductName"] = name;
                drOrderItem2["ProductImage"] = image;
                drOrderItem2["ProductType"] = type;
                drOrderItem2["ProductPrice"] = price.ToString();
                drOrderItem2["ProductCode"] = code;
                drOrderItem2["Quanity"] = 1;
                dtOrderItem.Rows.Add(drOrderItem2);
            }
        
        return dtOrderItem;
    }

    public DataTable RemoveOrderItem(string id)
    {
        foreach (DataRow drow in dtOrderItem.Rows)
        {
            if (drow["ProductID"].ToString() == id)
            {
                dtOrderItem.Rows.Remove(drow);
                break;
            }
        }
        return dtOrderItem;
    }
    public DataTable UpdateOrderItem(int quanity, string id)
    {
        foreach (DataRow drow in dtOrderItem.Rows)
        {
            if (drow["ProductID"].ToString() == id)
            {
                drow["Quanity"] = quanity;
            }
        }
        return dtOrderItem;
    }
    }
}