using System;
using System.Web;
using System.IO;
using System.Collections;
using System.Collections.Specialized;
using Common;

namespace Musicviet.Class
{
    public class NL
    {
        
        //test
        public static String RECEIVER = "";
        public static String merchant_site_code = ""; //"16180";	//thay mã merchant site mà bạn đã đăng ký vào đây
        public static String secure_pass = "";
        public static String nganluong_url = "http://sandbox.nganluong.vn/checkout.php";

        public static string RETURN_URL = Config.WebsiteAppPath + "finish.aspx";// "PayC.aspx";

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

        public static String buildCheckoutUrl(String order_code, String price, String transaction_info)
        {
            // Tạo biến secure code
            String secure_code = "";
            secure_code += merchant_site_code;
            secure_code += " " + HttpUtility.UrlEncode(RETURN_URL).ToLower();
            secure_code += " " + RECEIVER;
            secure_code += " " + transaction_info;
            secure_code += " " + order_code;
            secure_code += " " + price;
            secure_code += " " + secure_pass;

            // Tạo mảng băm
            Hashtable ht = new Hashtable();
            ht.Add("merchant_site_code", merchant_site_code);
            ht.Add("return_url", HttpUtility.UrlEncode(RETURN_URL).ToLower());
            ht.Add("receiver", RECEIVER);
            ht.Add("transaction_info", transaction_info);
            ht.Add("order_code", order_code);
            ht.Add("price", price);
            ht.Add("secure_code", GetMD5Hash(secure_code));

            // Tạo url redirect
            String redirect_url = nganluong_url;
            if (redirect_url.IndexOf("?") == -1)
            {
                redirect_url += "?";
            }
            else if (redirect_url.Substring(redirect_url.Length - 1, 1) != "?" && redirect_url.IndexOf("&") == -1)
            {
                redirect_url += "&";
            }

            String url = "";
            // Duyệt các phần tử trong mảng băm ht1 để tạo redirect url
            IDictionaryEnumerator en = ht.GetEnumerator();
            while (en.MoveNext())
            {
                if (url == "")
                    url += en.Key.ToString() + "=" + en.Value.ToString();
                else
                    url += "&" + en.Key.ToString() + "=" + en.Value.ToString();
            }

            String rdu = redirect_url + url;
            return rdu;
        }

        public static Boolean verifyPaymentUrl(String transaction_info, String order_code, String price, String payment_id, String payment_type, String error_text, String secure_code)
        {
            // Tạo mã xác thực từ chủ web
            String str = "";
            str += " " + transaction_info;
            str += " " + order_code;
            str += " " + price;
            str += " " + payment_id;
            str += " " + payment_type;
            str += " " + error_text;
            str += " " + merchant_site_code;
            str += " " + secure_pass;

            // Mã hóa các tham số
            String verify_secure_code = "";

            verify_secure_code = GetMD5Hash(str);

            // Xác thực mã của chủ web với mã trả về từ nganluong.vn
            if (verify_secure_code == secure_code) return true;

            return false;
        }
    }
}