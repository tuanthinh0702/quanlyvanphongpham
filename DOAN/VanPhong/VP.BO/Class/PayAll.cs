using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Manager;
using Common;
using CO.FormHelper;

namespace Musicviet.Class
{
    public class PayAll
    {
        public static decimal CaculatorTransCost(decimal SumAll, string bankID)
        {
            BankListInfo ibank = BankListManager.SelectCode(bankID);
            if (ibank != null && ibank.Currency.Trim().ToLower() == "vnd")
            {
                return ibank.TransValue + SumAll * ibank.TransRate;
            }
            else
                return 0;
        }
       
        public static string getRedirect(TxnRefType TxnRefType, string OrderID, decimal Total, decimal TransCost, string bank, string account)
        {
            string redirectURL = "";
            bank = bank.ToLower().Trim();
            Dictionary<string, string> ad = new Dictionary<string, string>();
            ad.Add("card_phone_game", "10000");
            // LinhDT
            if (bank == BankDeclare.OnePayInternational || bank == BankDeclare.VietcomBank || bank == BankDeclare.TienPhongBank || bank == BankDeclare.TechcomBank || bank == BankDeclare.VietinBank || bank == BankDeclare.VIBank || bank == BankDeclare.DongABank || bank == BankDeclare.HDBank || bank == BankDeclare.Eximbank || bank == BankDeclare.Gpbank || bank == BankDeclare.Maritimebank || bank == BankDeclare.Navibank || bank == BankDeclare.Oceanbank || bank == BankDeclare.Pgbank || bank == BankDeclare.Sacombank || bank == BankDeclare.Seabank || bank == BankDeclare.Shb || bank == BankDeclare.Vietabank || bank == BankDeclare.Vpbank || bank == BankDeclare.Agribank || bank == BankDeclare.BIDV || bank == BankDeclare.Seabank || bank == BankDeclare.ACB || bank == BankDeclare.MBank || bank == BankDeclare.NamAbank || bank == BankDeclare.Saigonbank || bank == BankDeclare.ACB)
            {
                BankListInfo banks = BankListManager.SelectConfigProvider(bank);
                switch (banks.Provider)
                {
                    case "onepay":
                        {
                            if (bank == BankDeclare.VietcomBank || bank == BankDeclare.TienPhongBank || bank == BankDeclare.TechcomBank || bank == BankDeclare.VietinBank || bank == BankDeclare.VIBank || bank == BankDeclare.DongABank || bank == BankDeclare.HDBank || bank == BankDeclare.Eximbank || bank == BankDeclare.Gpbank || bank == BankDeclare.Maritimebank || bank == BankDeclare.Navibank || bank == BankDeclare.Oceanbank || bank == BankDeclare.Pgbank || bank == BankDeclare.Sacombank || bank == BankDeclare.Seabank || bank == BankDeclare.Shb || bank == BankDeclare.Vietabank || bank == BankDeclare.Vpbank || bank == BankDeclare.Agribank || bank == BankDeclare.BIDV || bank == BankDeclare.Seabank || bank == BankDeclare.ACB || bank == BankDeclare.MBank || bank == BankDeclare.NamAbank || bank == BankDeclare.Saigonbank || bank == BankDeclare.ACB)
                            {
                                redirectURL = OnePay.Trans2OnePay(OrderID, Total, bank, getMerchantTntRef(TxnRefType, OrderID, bank, account),BankDeclare.ReWriteBank(bank));
                            }
                            //else if (bank == BankDeclare.Agribank || bank == BankDeclare.BIDV)
                            //{
                            //    BankNet bankNet = new BankNet();
                            //    redirectURL = bankNet.SendOrder(TxnRefType, OrderID, Total, TransCost, bank, account);
                            //}
                            //else if (bank == BankDeclare.OnePayInternational)
                            //// redirectURL = VCB.Trans2OPI(OrderID, Total, bank, getMerchantTntRef(TxnRefType, OrderID, bank, account));
                            //{
                            //    redirectURL = VCB.Trans2OPI(OrderID, Total, bank, getMerchantTntRef(TxnRefType, OrderID, bank, account));
                            //    //redirectURL = NLSmart.VisaCheckout(OrderID, Total.ToString(), bank, "", "Phuong thuc mua hang_" + TxnRefType, "0", "0", "0", Config.GetAppSetting("WebsiteAppPath") + "successvisa.aspx", Config.GetAppSetting("WebsiteAppPath") + "bw/errorpay.html", "Customer_" + account, "customer_visa@the365.vn", "mobiphone_visa", "address_visa", ad);
                            //    //redirectURL = FormHelper.FormHelper.GetRedirect(redirectURL);
                            //}
                            break;
                        }
                    
                    case "nganluong":
                        {
                            if (bank == BankDeclare.VietcomBank || bank == BankDeclare.TienPhongBank || bank == BankDeclare.TechcomBank || bank == BankDeclare.VietinBank || bank == BankDeclare.VIBank || bank == BankDeclare.DongABank || bank == BankDeclare.HDBank || bank == BankDeclare.Eximbank || bank == BankDeclare.Gpbank || bank == BankDeclare.Maritimebank || bank == BankDeclare.Navibank || bank == BankDeclare.Oceanbank || bank == BankDeclare.Pgbank || bank == BankDeclare.Sacombank || bank == BankDeclare.Seabank || bank == BankDeclare.Shb || bank == BankDeclare.Vietabank || bank == BankDeclare.Vpbank || bank == BankDeclare.Agribank || bank == BankDeclare.BIDV || bank == BankDeclare.Seabank || bank == BankDeclare.ACB || bank == BankDeclare.MBank || bank == BankDeclare.NamAbank || bank == BankDeclare.Saigonbank || bank == BankDeclare.ACB)
                            {
                                // redirectURL = VCB.Trans2OnePay(OrderID, Total, bank, getMerchantTntRef(TxnRefType, OrderID, bank, account));
                                //insert trans
                                string vpc_TicketNo = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
                                InsertTrans(getMerchantTntRef(TxnRefType, OrderID, bank, account), "Bluewave", OrderID, Total, vpc_TicketNo, bank);
                                //make redirect
                                redirectURL = NLSmart.BankCheckout(OrderID, Util.DecimalObjectToString(Total, true, 0).Replace(".", ""), bank, "",
                                                                   "Phuong thuc mua hang_" + TxnRefType, "0", "0", "0",
                                                                   Config.GetAppSetting("WebsiteAppPath") + "successful.aspx?type=" + TxnRefType.ToString(), Config.GetAppSetting("WebsiteAppPath") + "Error.aspx", Authentication.DefaultAccount.FullName,
                                                                   Authentication.DefaultAccount.Email, Authentication.DefaultAccount.Phone, Authentication.DefaultAccount.Address,
                                                                   ad);
                                redirectURL = FormHelper.GetRedirect(redirectURL);
                            }
                            else if (bank == BankDeclare.OnePayInternational)
                            {
                                //insert trans
                                string vpc_TicketNo = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
                                InsertTrans(getMerchantTntRef(TxnRefType, OrderID, bank, account), "Bluewave", OrderID, Total, vpc_TicketNo, bank);
                                //make redirect
                                redirectURL = NLSmart.VisaCheckout(OrderID, Util.DecimalObjectToString(Total, true, 0).Replace(".", ""), bank, "", "Phuong thuc mua hang_" + TxnRefType, "0", "0", "0", Config.GetAppSetting("WebsiteAppPath") + "successvisa.aspx?type=" + TxnRefType.ToString(), Config.GetAppSetting("WebsiteAppPath") + "Error.aspx", Authentication.DefaultAccount.FullName, Authentication.DefaultAccount.Email, Authentication.DefaultAccount.Phone, Authentication.DefaultAccount.Address, ad);
                                redirectURL = FormHelper.GetRedirect(redirectURL);
                            }
                            break;
                        }
                    default:
                        {
                            break;
                        }
                }
            }
            else if (bank == BankDeclare.Nganluong)
            {
                Total = Math.Round(Total, 0);
                string tran_info = getMerchantTntRef(TxnRefType, OrderID, bank, account);
                SaveTransNL(OrderID, tran_info, Total);
                redirectURL = NL.buildCheckoutUrl(OrderID, Total.ToString(), tran_info);
            }
            // LinhDT:
            else if (bank == BankDeclare.Baokim)
            {
                Total = Math.Round(Total, 0);
                string tran_info = getMerchantTntRef(TxnRefType, OrderID, bank, account);
                redirectURL = BK.createRequestUrl(OrderID, Total.ToString(), tran_info);
                SaveTransBK(OrderID, tran_info, Total, redirectURL);
            }
            //else if (bankID == "dab")
            //    return "";

            return redirectURL;
        }
        public static void InsertTrans(string vpc_MerchTxnRef, string vpc_Merchant, string vpc_OrderInfo, decimal Total, string vpc_TicketNo, string vpc_BankType)
        {
            if (!TransManager.Insert(vpc_MerchTxnRef, vpc_Merchant, vpc_OrderInfo, Total, vpc_TicketNo, vpc_BankType))
                throw new ApplicationException("Lỗi cập nhật Data!!!");
        }
        public static string getMerchantTntRef(TxnRefType txnRefType, string OrderID, string bank, string account)
        {
            string strTemp = txnRefType.ToString() + "/" + bank + "/" + account + "/" + DateTime.Now.ToString("hhmmss");
            return strTemp;
        }
        public static void SaveTransNL(string OrderID, string tran_info, decimal Total)
        {
            string TicketNo = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
            //if (!TransManager.Insert(tran_info, NL.merchant_site_code, OrderID, CaculatorTransCost(Total, BankDeclare.Nganluong), TicketNo, BankDeclare.Nganluong))
            //    throw new ApplicationException("Lỗi cập nhật Data!!!");
            if (!TransManager.Insert(tran_info, NL.merchant_site_code, OrderID, Total, TicketNo, BankDeclare.Nganluong))
                throw new ApplicationException("Lỗi cập nhật Data!!!");
        }
        public static void SaveTransBK(string OrderID, string tran_info, decimal Total, string redUrl)
        {
            TransInfo infTrans = new TransInfo();
            infTrans.Vpc_OrderInfo = OrderID;
            infTrans.Vpc_MerchTxnRef = tran_info;
            infTrans.Vpc_Merchant = BK.merchant_id;
            infTrans.Vpc_Amount = CaculatorTransCost(Total, BankDeclare.Baokim);
            infTrans.Vpc_TicketNo = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
            infTrans.Vpc_ReturnUrl = redUrl;
            infTrans.Vpc_BankType = BankDeclare.Baokim;

            if (!TransManager.Insert(infTrans))
                throw new ApplicationException("Lỗi cập nhật Data!!!");
        }
        public static bool checkSucess(string bank)
        {
            switch (bank)
            {
                case BankDeclare.VietcomBank:
                    return HttpContext.Current.Request["vpc_TxnResponseCode"] == "0";
                // LinhDT
                case BankDeclare.TienPhongBank:
                    return HttpContext.Current.Request["vpc_TxnResponseCode"] == "0";
                case BankDeclare.TechcomBank:
                    return HttpContext.Current.Request["vpc_TxnResponseCode"] == "0";

                case BankDeclare.HDBank:
                    return HttpContext.Current.Request["vpc_TxnResponseCode"] == "0";
                case BankDeclare.VietinBank:
                    return HttpContext.Current.Request["vpc_TxnResponseCode"] == "0";
                case BankDeclare.VIBank:
                    return HttpContext.Current.Request["vpc_TxnResponseCode"] == "0";
                case BankDeclare.OnePayInternational:
                    return HttpContext.Current.Request["vpc_TxnResponseCode"] == "0";
                case BankDeclare.DongABank:
                    return HttpContext.Current.Request["vpc_TxnResponseCode"] == "0";
                //case BankDeclare.DongABank:
                //    return false;
                case BankDeclare.Nganluong:
                    return HttpContext.Current.Request["error_text"] == "";
                default: return false;
            }
        }
        public static string getBank()
        {
            if (HttpContext.Current.Request["vpc_Merchant"] != null)
                if (HttpContext.Current.Request["vpc_Merchant"].ToString().ToUpper().Trim() == "HAIMINHVND")
                    return BankDeclare.OnePayInternational;
                else
                {
                    if (HttpContext.Current.Request["vpc_MerchTxnRef"] != null)
                    {
                        string bank = HttpContext.Current.Request["vpc_MerchTxnRef"].ToString().ToLower().Split('/')[1];
                        if (bank == BankDeclare.DongABank)
                            return BankDeclare.DongABank;
                        else if (bank == BankDeclare.HDBank)
                            return BankDeclare.HDBank;
                        else if (bank == BankDeclare.VietinBank)
                            return BankDeclare.VietinBank;
                        else if (bank == BankDeclare.VIBank)
                            return BankDeclare.VIBank;
                        // LinhDT
                        else if (bank == BankDeclare.TechcomBank)
                            return BankDeclare.TechcomBank;
                        else if (bank == BankDeclare.TienPhongBank)
                            return BankDeclare.TienPhongBank;
                        else if (bank == BankDeclare.OnePayInternational)
                            return BankDeclare.OnePayInternational;
                        else
                            return BankDeclare.VietcomBank;
                    }
                    else
                        return BankDeclare.VietcomBank;
                }
            else if (HttpContext.Current.Request["order_code"] != null)
                return BankDeclare.Nganluong;
            else if (HttpContext.Current.Request["token"] != null)
                return BankDeclare.Paypal;
            else
                return BankDeclare.Unknow;
        }

        public static string getOrderID()
        {
            switch (getBank())
            {
                case BankDeclare.VietcomBank:
                    return HttpContext.Current.Request["vpc_OrderInfo"];
                // LinhDT
                case BankDeclare.TechcomBank:
                    return HttpContext.Current.Request["vpc_OrderInfo"];
                case BankDeclare.TienPhongBank:
                    return HttpContext.Current.Request["vpc_OrderInfo"];

                case BankDeclare.HDBank:
                    return HttpContext.Current.Request["vpc_OrderInfo"];
                case BankDeclare.VietinBank:
                    return HttpContext.Current.Request["vpc_OrderInfo"];
                case BankDeclare.VIBank:
                    return HttpContext.Current.Request["vpc_OrderInfo"];
                case BankDeclare.OnePayInternational:
                    return HttpContext.Current.Request["vpc_OrderInfo"];
                case BankDeclare.DongABank:
                    return HttpContext.Current.Request["vpc_OrderInfo"];
                //case BankDeclare.DongABank:
                //    return "";
                case BankDeclare.Nganluong:
                    return HttpContext.Current.Request["order_code"];
                default: return "";
            }
        }
        public static TxnRefType getService()
        {
            string service = "unk";
            if (HttpContext.Current.Request["vpc_MerchTxnRef"] != null)
                service = HttpContext.Current.Request["vpc_MerchTxnRef"].ToString().ToLower().Split('/')[0];
            else if (HttpContext.Current.Request["transaction_info"] != null)
                service = HttpContext.Current.Request["transaction_info"].ToString().ToLower().Split('/')[0];

            switch (service)
            {
                case "cad": return TxnRefType.cad;
                case "phone": return TxnRefType.phone;
                case "deco": return TxnRefType.deco;
                case "oncash": return TxnRefType.oncash;
                case "zingxu": return TxnRefType.zingxu;
                case "fptgate": return TxnRefType.fptgate;
                case "vcoin": return TxnRefType.vcoin;
                default: return TxnRefType.unk;
            }
        }
        public static bool verifyReturnUrl(string bank)
        {
            switch (bank)
            {
                case BankDeclare.VietcomBank:
                    return OnePay.verifyPaymentUrl() ? true : false;
                // LinhDT
                case BankDeclare.TienPhongBank:
                    return OnePay.verifyPaymentUrl() ? true : false;
                case BankDeclare.TechcomBank:
                    return OnePay.verifyPaymentUrl() ? true : false;

                case BankDeclare.VietinBank:
                    return OnePay.verifyPaymentUrl() ? true : false;
                case BankDeclare.VIBank:
                    return OnePay.verifyPaymentUrl() ? true : false;
                case BankDeclare.HDBank:
                    return OnePay.verifyPaymentUrl() ? true : false;
                case BankDeclare.OnePayInternational:
                    return OnePay.verifyOPIUrl() ? true : false;
                case BankDeclare.DongABank:
                    return OnePay.verifyPaymentUrl() ? true : false;
                //case BankDeclare.DongABank:
                //    return false;
                case BankDeclare.Nganluong:
                    string transaction_info = HttpContext.Current.Request["transaction_info"].Trim().ToString();
                    string order_code = HttpContext.Current.Request["order_code"].Trim().ToString();
                    string price = HttpContext.Current.Request["price"].Trim().ToString();
                    string payment_id = HttpContext.Current.Request["payment_id"].Trim().ToString();
                    string payment_type = HttpContext.Current.Request["payment_type"].Trim();
                    string error_text = HttpContext.Current.Request["error_text"].Trim();
                    string secure_code = HttpContext.Current.Request["secure_code"].Trim();

                    return NL.verifyPaymentUrl(transaction_info, order_code, price, payment_id, payment_type, error_text, secure_code);// ? true : false;
                default: return false;
            }
        }
    }
}