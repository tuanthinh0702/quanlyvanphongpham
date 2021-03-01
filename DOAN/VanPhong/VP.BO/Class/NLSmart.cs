using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Xml;

/// <summary>
/// Summary description for NLSmart
/// </summary>

namespace Musicviet.Class
{
    public class NLSmart
    {
        public static string _VERSION = "3.1";
        public static string _FUNCTION = "SetExpressCheckout";
        public static string _URL_SERVICE = "https://www.nganluong.vn/checkout.api.nganluong.post.php";
        public static string merchant_id = "";
        public static string merchant_password = "";
        public static string receiver_email = "";
        public NLSmart()
        {

        }
        //Thanh toan qua ngan hang noi dia
        public static string BankCheckout(string order_code, string total_amount, string bank_code, string payment_type, string order_description, string tax_amount,
                                        string fee_shipping, string discount_amount, string return_url, string cancel_url, string buyer_fullname, string buyer_email, string buyer_mobile,
                                        string buyer_address, Dictionary<string, string> array_items)
        {
            string nl_result = "";
            Dictionary<string, string> dt = new Dictionary<string, string>();
            dt.Add("function", _FUNCTION);
            dt.Add("version", _VERSION);
            dt.Add("merchant_id", merchant_id);
            dt.Add("receiver_email", receiver_email);
            dt.Add("merchant_password", GetMD5Hash(merchant_password));
            dt.Add("order_code", order_code);
            dt.Add("total_amount", total_amount);
            dt.Add("payment_method", "ATM_ONLINE");
            dt.Add("bank_code", bank_code);
            dt.Add("payment_type", payment_type);
            dt.Add("order_description", order_description);
            dt.Add("tax_amount", tax_amount);
            dt.Add("fee_shipping", fee_shipping);
            dt.Add("discount_amount", discount_amount);
            dt.Add("return_url", return_url);
            dt.Add("cancel_url", cancel_url);
            dt.Add("buyer_fullname", buyer_fullname);
            dt.Add("buyer_email", buyer_email);
            dt.Add("buyer_mobile", buyer_mobile);
            dt.Add("buyer_address", buyer_address);
            dt.Add("tong_sp", array_items.Count().ToString());


            string post_field = "";
            foreach (KeyValuePair<string, string> pair in dt)
            {
                if (post_field != "") post_field += '&';
                post_field += pair.Key + "=" + pair.Value;
            }
            if (array_items.Count() > 0)
            {

                foreach (KeyValuePair<string, string> pairs in array_items)
                {
                    if (post_field != "") post_field += '&';
                    post_field += pairs.Key + "=" + pairs.Value;
                }

            }

            //nl_result=CheckoutCall(post_field);
            return _URL_SERVICE + "?" + post_field;
        }

        //Thanh toan qua Visa/Master Card
        public static string VisaCheckout(string order_code, string total_amount, string bank_code, string payment_type, string order_description, string tax_amount,
                                       string fee_shipping, string discount_amount, string return_url, string cancel_url, string buyer_fullname, string buyer_email, string buyer_mobile,
                                       string buyer_address, Dictionary<string, string> array_items)
        {
            string nl_result = "";
            Dictionary<string, string> dt = new Dictionary<string, string>();
            dt.Add("function", _FUNCTION);
            dt.Add("version", _VERSION);
            dt.Add("merchant_id", merchant_id);
            dt.Add("receiver_email", receiver_email);
            dt.Add("merchant_password", GetMD5Hash(merchant_password));
            dt.Add("order_code", order_code);
            dt.Add("total_amount", total_amount);
            dt.Add("payment_method", "VISA");
            dt.Add("bank_code", bank_code);
            dt.Add("payment_type", payment_type);
            dt.Add("order_description", order_description);
            dt.Add("tax_amount", tax_amount);
            dt.Add("fee_shipping", fee_shipping);
            dt.Add("discount_amount", discount_amount);
            dt.Add("return_url", return_url);
            dt.Add("cancel_url", cancel_url);
            dt.Add("buyer_fullname", buyer_fullname);
            dt.Add("buyer_email", buyer_email);
            dt.Add("buyer_mobile", buyer_mobile);
            dt.Add("buyer_address", buyer_address);
            dt.Add("tong_sp", array_items.Count().ToString());


            string post_field = "";
            foreach (KeyValuePair<string, string> pair in dt)
            {
                if (post_field != "") post_field += '&';
                post_field += pair.Key + "=" + pair.Value;
            }
            if (array_items.Count() > 0)
            {

                foreach (KeyValuePair<string, string> pairs in array_items)
                {
                    if (post_field != "") post_field += '&';
                    post_field += pairs.Key + "=" + pairs.Value;
                }

            }

            //nl_result=CheckoutCall(post_field);
            return _URL_SERVICE + "?" + post_field;
        }
        public static String GetMD5Hash(String input)
        {

            System.Security.Cryptography.MD5CryptoServiceProvider x = new System.Security.Cryptography.MD5CryptoServiceProvider();

            byte[] bs = System.Text.Encoding.UTF8.GetBytes(input);

            bs = x.ComputeHash(bs);

            System.Text.StringBuilder s = new System.Text.StringBuilder();

            foreach (byte b in bs)
            {
                s.Append(b.ToString("x2").ToLower());
            }
            String md5String = s.ToString();
            return md5String;
        }
        public static string GetTransactionDetail(string token)
        {
            string html = "";
            Dictionary<string, string> aDictionary = new Dictionary<string, string>();
            aDictionary.Add("merchant_id", merchant_id);
            aDictionary.Add("merchant_password", GetMD5Hash(merchant_password));
            aDictionary.Add("version", _VERSION);
            aDictionary.Add("function", "GetTransactionDetail");
            aDictionary.Add("token", token);
            string post_field = "";
            foreach (KeyValuePair<string, string> pair in aDictionary)
            {
                if (post_field != "") post_field += '&';
                post_field += pair.Key + "=" + pair.Value;
            }
            HttpWebRequest s = (HttpWebRequest)WebRequest.Create(_URL_SERVICE + "?" + post_field);
            HttpWebResponse r = (HttpWebResponse)s.GetResponse();
            // Stream w = r.GetResponseStream();
            StringBuilder sb = new StringBuilder();
            Byte[] buf = new byte[8192];
            Stream resStream = r.GetResponseStream();
            int count = 0;
            do
            {
                count = resStream.Read(buf, 0, buf.Length);
                if (count != 0)
                {
                    sb.Append(Encoding.UTF8.GetString(buf, 0, count)); // just hardcoding UTF8 here
                }
            } while (count > 0);
            html = sb.ToString().Trim().Replace(@"\", "");
            //XmlDocument x = new XmlDocument();
            //x.LoadXml(html);
            //error = x.GetElementsByTagName("order_code")[0].InnerText;
            return html;
        }
    }
}