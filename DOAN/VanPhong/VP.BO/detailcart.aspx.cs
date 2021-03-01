using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Common;
using Manager;

namespace Musicviet
{
    public partial class detailcart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (countTotal() < 1)
                totx.Visible = false;
            if (IsPostBack) return;
            BinData();
        }
        DataTable dtOrderItem = null;
        protected void BinData()
        {
            dtOrderItem=(DataTable)Session["Cart"];
            grvOrder.DataSource = dtOrderItem;
            grvOrder.DataBind();
            lblTotal.Text = Util.DecimalObjectToString(countTotal());
            lblTotalText.Text = Util.docso(countTotal().ToString().Replace(".0000", ""));
            
        }
        private decimal countTotal()
        {
            decimal count = 0;
            DataTable dt = (DataTable)Session["Cart"];
            if (dt != null)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    count += decimal.Parse(dr["Price"].ToString()) * int.Parse(dr["Quantity"].ToString());
                }
            }
            return count;
        }
        public DataTable RemoveOrderItem(string id)
        {
            DataTable dt = (DataTable)Session["Cart"];
            foreach (DataRow drow in dt.Rows)
            {
                if (drow["ProductId"].ToString() == id)
                {
                    dt.Rows.Remove(drow);
                    break;
                }
            }
            Session["Cart"] = dt;
            return dtOrderItem;
        }
        public DataTable UpdateOrderItem(int quanity, string id)
        {
            DataTable dt = (DataTable)Session["Cart"];
            foreach (DataRow drow in dt.Rows)
            {
                if (drow["ProductId"].ToString() == id)
                {
                    drow["Quantity"] = quanity;
                }
            }
            Session["Cart"] = dt;
            return dtOrderItem;
        }

        protected void grvOrder_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Delete":
                    x = e.CommandArgument.ToString();
                    break;
                case "Update":
                    {
                        smid = Convert.ToInt32(e.CommandArgument);
                        break;
                    }
                default:
                    break;
            }
        }
        private int smid = 0;
        private string x = "";
        protected void grvOrder_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TextBox cmbType = (TextBox)grvOrder.Rows[e.RowIndex].FindControl("cart");

            int status = int.Parse(cmbType.Text);
            // UsersManager.UpdateStatus(username, status);
            UpdateOrderItem(status, smid.ToString());
            grvOrder.EditIndex = -1;
            BinData();

        }

        protected void grvOrder_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            RemoveOrderItem(x);
            grvOrder.EditIndex = -1;
            BinData();
        }
    }
}