using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Manager;
using System.Data;

namespace Musicviet.Admingtc.Modules
{
    public partial class Vew : System.Web.UI.UserControl
    {
        private string id = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
            if (IsPostBack)
                return;
            if (id != "")
            {
                BindObject(id);
                BinData(id);
            }
              
        }
        private void BindObject(string objID)
        {
            OrderInfo obj = OrderManager.Select(objID);

            if (obj != null)
            {
                UserInfo uss = UserManager.Select(obj.Name);
                try
                {
                    lblfullname.Text = uss.FullName;
                    lblphone.Text = uss.Mobile;
                    lblemail.Text = uss.Email;
                    lblAdersss.Text = uss.Adresss;

                }
                catch { }
                lbltrangthai.Text = Getstatus(obj.Status);
                lblTotal.Text = Common.Util.DecimalObjectToString(Decimal.Parse(obj.Total.ToString()));


            }
        }

        protected string Getstatus(int stratus)
        {
            if (stratus == 0) return "Chờ xử lý";
            if (stratus == 1) return "Đang giao hàng";
            if (stratus == 2) return "Thành công";
            if (stratus == 3) return "Hủy";
            else return "N/A";

        }

        protected string GetProductName(int id)
        {
            try
            {
                ProductsInfo name = ProductsManager.Select(id);
                return name.ProductName;
            }
            catch
            {

            }
            return "N/A";

        }

        protected string GetProductCode(int id)
        {
            try
            {
                ProductsInfo name = ProductsManager.Select(id);
                return name.ProductCode;
;
            }
            catch
            {

            }
            return "N/A";

        }
        protected void BinData(string id)
        {
            DataTable tb = OrderItemManager.SelectAllVew(id);
            grvOrder.DataSource = tb;
            grvOrder.DataBind();

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            bool aex = false;
            try
            {
                OrderManager.SetApprovedStatus(int.Parse(ddlStatus.SelectedValue), id);
                aex = true;
            }
            catch { }
            if(aex==true)
            {
                lblError.Text = "cập nhật trạng thái thành công";
                Response.Redirect("/Admin/Home.aspx?module=OrderItemMgr");
            }
            else
            {
                lblError.Text = "Chưa cập nhật trạng thái";
            }

        }
    }
}