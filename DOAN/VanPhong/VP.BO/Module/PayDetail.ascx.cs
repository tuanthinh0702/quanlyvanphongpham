using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Manager;
using System.Data;
using Common;
using Musicviet.Class;

namespace Musicviet.Module
{
    public partial class PayDetail : WebControlBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindTitles();
                if (IsPostBack) return;
                if (Session["Cart"] == null || string.IsNullOrWhiteSpace(Session["Cart"].ToString()))
                    Response.Redirect("/");
                BindBank();
                BindTitles();
                Getsever();
                GetTitle();
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (CheckValid())
            {
                if (rdoHome.Checked)
                {
                    SaveOrder();
                    buy.Visible = false;
                    Session.Abandon();
                    Response.Redirect("/Trang-chu.htm");
                }
                if (rdoOnline.Checked)
                {
                    string order = SaveOrder();
                    decimal TransCost = Musicviet.Class.PayAll.CaculatorTransCost(countTotal(), CO.FormHelper.FormHelper.GetBankCode(ddlBank.SelectedItem.Text));
                    string redirectURL = PayAll.getRedirect(TxnRefType.cad, order, countTotal(), TransCost, CO.FormHelper.FormHelper.GetBankCode(ddlBank.SelectedItem.Text), Authentication.DefaultAccount.Email);
                    Response.Redirect(redirectURL);
                }
            }
            else
            {
                Label1.Text = "*";
            }
        }
        protected string SaveOrder()
        {
            string OrderNo = OrderManager.GenOrderCode();
            DataTable dtOrderItem = (DataTable)Session["Cart"];
            if (dtOrderItem != null)
            {
                foreach (DataRow dr in dtOrderItem.Rows)
                {
                    OrderItemInfo info = new OrderItemInfo();
                    info.OrderNo = OrderNo;
                    info.ProductID = int.Parse(dr["ProductID"].ToString());
                    info.Price = decimal.Parse(dr["Price"].ToString());
                    info.Quanity = int.Parse(dr["Quantity"].ToString());
                    OrderItemManager.Insert(info);
                }
                OrderInfo orderInfo = new OrderInfo();
                orderInfo.OrderNo = OrderNo;
                orderInfo.Name = txtName.Text.Trim();
                orderInfo.Address = txtAddress.Text.Trim();
                orderInfo.Sdt = txtPhone.Text.Trim();
                orderInfo.Email = txtEmail.Text.Trim();
                orderInfo.Notes = txtNote.Text.Trim();
                orderInfo.Total = countTotal();
                orderInfo.OrderDate = DateTime.Now;
                orderInfo.BankID = CO.FormHelper.FormHelper.GetBankCode(ddlBank.SelectedItem.Text);
                orderInfo.Status = 0;
                OrderManager.Insert(orderInfo);
                //SendMail(OrderNo);
            }
            return OrderNo;
        }
        //private decimal countTotal()
        //{
        //    decimal count = 0;
        //    DataTable dt = (DataTable)Session["Cart"];
        //    if (dt != null)
        //    {
        //        foreach (DataRow dr in dt.Rows)
        //        {
        //            count += decimal.Parse(dr["Price"].ToString()) * int.Parse(dr["Quantity"].ToString());
        //        }
        //    }
        //    return count;
        //}
        public void SendMail(string orderId)
        {
            DataTable dt = (DataTable)Session["Cart"];
            OrderInfo obj = OrderManager.Select(orderId);
            SettingInfo info = SettingManager.SelectCode("EMO");
            int counts = 1;
            // obj.Status = int.Parse(ddlStatus.SelectedValue);
            string content = "<div><fieldset style='border: 1px solid #5a5f65; padding: 20px 0px 0px 30px;'><legend style='margin-left:30px;'>Thông tin chung</legend>";
            content += "<p>Thông báo nội dung đơn hàng trên trang MUSICVIET.VN</p>";

            content += "<p>Mã đơn hàng: <b>" + obj.OrderNo + "</b></p>";
            content += "<p>Ngày đặt hàng: <b>" + obj.OrderDate + "</b></p>" +
                       "</fieldset></div><br/>";

            content += "<div><fieldset style='border: 1px solid #5a5f65;'><legend style='margin-left:30px;'>Chi tiết đơn hàng</legend>";
            content += "<table border='1' style='min-width: 500px; margin:10px 0px 20px 30px;'><tr style='font-weight: bold;text-align: center; height: 30px;'>" +
                             "<td>STT</td>" +
                             "<td>Tên sản phẩm</td>" +
                             "<td>Mã sản phẩm</td><td>Giá</td>" +
                             "<td>Số lượng</td>" +
                        "</tr>";
            foreach (DataRow rw in dt.Rows)
            {

                content += "<tr style = 'height:20px;'>";
                content += "<td><p align='center'>" + counts + "</p></td>";
                content += "<td><p align='center'>" + rw["ProductName"] + "</p></td>";
                content += "<td><p align='center'>" + rw["ProductCode"] + "</p></td>";
                content += "<td><p align='center'>" + Util.DecimalObjectToString(rw["ProductPrice"]) + "</p></td>";
                content += "<td><p align='center'>" + rw["Quanity"] + "</p></td>";
                content += "</tr>";
                counts++;
            }
            content += "</table>";
            content += "</fieldset></div><br/>";
            content += "<p>Tổng giá trị trên hóa đơn: <b>" + Util.DecimalObjectToString(countTotal()) + "</b></p><br>";
            content += "<p><b>VUI LÒNG KHÔNG TRẢ LỜI THƯ NÀY</b>.</p>";
            content += "<p>***************************************************************</p>";

            // O2S_Mail.Send(BaseHelpers.LoadSettings("emailreply"), info.Email, BaseHelpers.LoadSettings("sitestitle"), "Thông tin chi tiết đơn hàng của bạn trên " + BaseHelpers.LoadSettings("home") + "! ", content);
            CO.FormHelper.FormHelper.SendMail(info.ValueSetting, "Thông tin đơn hàng trên MUSICVIET.VN", content);
            //  SMSSend.SendMT(obj.Phone, "OPI success: OrderID-" + obj.AccountNo + " Amoumt-" + obj.Total + " Account " + obj.AccountNo, "8714", "CUA", "0", "0123456789", "1", "0", "0", "VIETEL");
            //  Approved = true;
        }
        protected bool CheckValid()
        {
            if (txtCodeValid.Text.Trim() != ImageVerifier1.Text)
            {
                lblError.Text = "Hãy nhập chính xác mã bảo mật";
                return false;
            }
            //if()
            return true;
        }

        protected void rdoOnline_CheckedChanged(object sender, EventArgs e)
        {
            bank_select.Visible = true;
        }

        protected void rdoHome_CheckedChanged(object sender, EventArgs e)
        {
            bank_select.Visible = false;
        }
        /*Bank List*/
        public void BindBank()
        {
            DataTable dt = BankListManager.SelectAvail();
            ddlBank.DataSource = dt;
            ddlBank.DataBind();
            for (int i = 0; i < this.ddlBank.Items.Count; i++)
            {
                ddlBank.Items[i].Enabled = (dt.Rows[i]["Status"].ToString() == "1");
            }

            ddlBank.Items.Insert(0, new ListItem("- Ngân hàng thanh toán -", ""));
        }
        protected void BindTitles()
        {
            if (ddlBank != null)
            {
                foreach (ListItem li in ddlBank.Items)
                {
                    li.Attributes["title"] = li.Value; // setting text value of item as tooltip
                }
            }
        }
        protected void ddlBank_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindTitles();
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

        DataTable dtOrderItem = null;
     
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

        protected void btnbuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Thanh-toan.htm");
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