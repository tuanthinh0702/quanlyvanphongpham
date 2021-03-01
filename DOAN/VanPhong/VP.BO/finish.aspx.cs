using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Musicviet.Class;
using Common;
using Manager;

namespace Musicviet
{
    public partial class finish : System.Web.UI.Page
    {
        public string OrderID
        {
            get
            {
                if (this.ViewState["OrderID"] == null) return "0";
                else return Convert.ToString(this.ViewState["OrderID"].ToString());
            }
            set { this.ViewState["OrderID"] = value; }
        }
        TxnRefType Service;
        string Account;
        string sBank;
        protected void Page_Load(object sender, EventArgs e)
        {
            string a = Request.Url.AbsoluteUri;
            LogRequest();
            sBank = PayAll.getBank();
            // Xác thực địa chỉ và mã trả về nếu là url giả mạo thì thoát, đúng thì mới tiếp tục kiểm tra trạng thái kết quả giao dịch trả về.
             if (!PayAll.verifyReturnUrl(sBank))
            {
                UpdateUnSussessTrans();
                Response.Redirect("~/");
                return;
            }

            OrderID = PayAll.getOrderID();
            Service = PayAll.getService();
            //Account = PayAll.getAccount();

            // Kiểm tra trạng thái kết quả giao dịch trả về. Nếu giao dịch thành công
            if (PayAll.checkSucess(sBank))
            {
                UpdateSussessTrans();
                DoWhenSuccess();
                Response.Redirect("default.aspx?module=Pay&type=success");
            }
            // Nếu giao dịch không thành công
            else
            {
                UpdateUnSussessTrans();
                DoWhenFail();
                Response.Redirect("default.aspx?module=Pay");
            }
        }

        public void LogRequest()
        {
            try
            {
                LogFiles logFile = new LogFiles();
                logFile.ErrorLog(Server.MapPath("/Logs/Success/LogUrl"), Request.Url.ToString());
            }
            catch { }
        }

        public void LogError(string Error)
        {
            try
            {
                LogFiles logFile = new LogFiles();
                logFile.ErrorLog(Server.MapPath("/Log/Error/LogUrl"), "ERROR: " + Error + " >>>URL: " + Request.Url.ToString());
            }
            catch { }
        }
        public void UpdateUnSussessTrans()
        {
            try
            {
                int txnResponseCode = 2;//khong thanh cong hoac gia mao url
                string retURL = Server.HtmlEncode(Request.Url.ToString());
                string merchTxnRef;
                if (sBank == BankDeclare.VietcomBank || sBank == BankDeclare.TienPhongBank || sBank == BankDeclare.TechcomBank || sBank == BankDeclare.VietinBank || sBank == BankDeclare.VIBank || sBank == BankDeclare.DongABank || sBank == BankDeclare.HDBank || sBank == BankDeclare.Eximbank || sBank == BankDeclare.Gpbank || sBank == BankDeclare.Maritimebank || sBank == BankDeclare.Navibank || sBank == BankDeclare.Oceanbank || sBank == BankDeclare.Pgbank || sBank == BankDeclare.Sacombank || sBank == BankDeclare.Seabank || sBank == BankDeclare.Shb || sBank == BankDeclare.Vietabank || sBank == BankDeclare.Vpbank || sBank == BankDeclare.Agribank || sBank == BankDeclare.BIDV || sBank == BankDeclare.Seabank || sBank == BankDeclare.ACB || sBank == BankDeclare.MBank || sBank == BankDeclare.NamAbank || sBank == BankDeclare.Saigonbank || sBank == BankDeclare.ACB)
                    merchTxnRef = Request["vpc_MerchTxnRef"].ToString();
                else if (sBank == BankDeclare.Nganluong)
                    merchTxnRef = Request["transaction_info"].ToString();
                else if (sBank == BankDeclare.Paypal)
                    merchTxnRef = Session["token"].ToString().Trim();
                else
                    merchTxnRef = "";
                TransManager.Update(merchTxnRef, retURL, txnResponseCode);
            }
            catch { }
        }
        public void UpdateSussessTrans()
        {
            try
            {
                int txnResponseCode = 1;//thanh cong
                string retURL = Server.HtmlEncode(Request.Url.ToString());
                string merchTxnRef;
                if (sBank == BankDeclare.VietcomBank || sBank == BankDeclare.TienPhongBank || sBank == BankDeclare.TechcomBank || sBank == BankDeclare.VietinBank || sBank == BankDeclare.VIBank || sBank == BankDeclare.DongABank || sBank == BankDeclare.HDBank || sBank == BankDeclare.Eximbank || sBank == BankDeclare.Gpbank || sBank == BankDeclare.Maritimebank || sBank == BankDeclare.Navibank || sBank == BankDeclare.Oceanbank || sBank == BankDeclare.Pgbank || sBank == BankDeclare.Sacombank || sBank == BankDeclare.Seabank || sBank == BankDeclare.Shb || sBank == BankDeclare.Vietabank || sBank == BankDeclare.Vpbank || sBank == BankDeclare.Agribank || sBank == BankDeclare.BIDV || sBank == BankDeclare.Seabank || sBank == BankDeclare.ACB || sBank == BankDeclare.MBank || sBank == BankDeclare.NamAbank || sBank == BankDeclare.Saigonbank || sBank == BankDeclare.ACB)
                    merchTxnRef = Request["vpc_MerchTxnRef"].ToString();
                else if (sBank == BankDeclare.Nganluong)
                    merchTxnRef = Request["transaction_info"].ToString();
                else if (sBank == BankDeclare.Paypal)
                    merchTxnRef = Session["token"].ToString().Trim();
                else
                    merchTxnRef = "";
                TransManager.Update(merchTxnRef, retURL, txnResponseCode);
            }
            catch { }
        }
        public void DoWhenSuccess()
        {
            //update trang thai thanh cong
                OrderManager.UpdateStatus(OrderID, 1);
            //Response.Redirect("/Default.aspx?module=orderdetail&id=" + OrderID);
            //Response.Redirect("/ma-the-nap.htm");
        }
        public void DoWhenFail()
        {
            //update trang thai thanh cong
            OrderManager.UpdateStatus(OrderID, 2);
            //Response.Redirect("/Default.aspx?module=orderdetail&id=" + OrderID);
            //Response.Redirect("/ma-the-nap.htm");
        }
    }
}