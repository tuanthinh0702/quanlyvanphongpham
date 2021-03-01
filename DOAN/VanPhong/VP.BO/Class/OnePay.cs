using System;
using System.Collections.Specialized;
using System.Web;
using Common;
using Manager;
using System.Text;
using System.Collections.Generic;
using System.Security.Cryptography;



namespace Musicviet.Class
{
    public enum TxnRefType
    {
        cad,
        unk,
        phone,
        deco,
        oncash,
        vcoin,
        fptgate,
        zingxu,
    }

    public class OnePay
    {



        /// <summary>
        /// Onepay noi dia
        /// </summary>
          ////Test
        public static int nClientID = 0;
        private static string SECURE_SECRET = "A3EFDFABA8653DF2342E8DAC29B51AF0";
        private static string MERCHANT_ID = "ONEPAY";
        private static string ACCESS_CODE = "D67342C2";
        private static string ONEPAY_URL = "http://mtf.onepay.vn/onecomm-pay/vpc.op";
         //Test
        private static string OPI_SECURE_SECRET = "18D7EC3F36DF842B42E1AA729E4AB010";
        private static string OPI_MERCHANT_ID = "TESTONEPAYUSD";
        private static string OPI_ACCESS_CODE = "2F668CD2";
        private static string OPI_ONEPAY_URL = "https://onepay.vn/vpcpay/vpcpay.op";

        private static string RETURN_URL = Config.WebsiteAppPath + "finish.aspx";//"PayC.aspx";//Config.WebsiteAppPath + "AccOnePayR.aspx";
        private static string AGAIN_URL = Config.WebsiteAppPath + "/PayO.aspx";//Config.WebsiteAppPath + "AccOnePayO.aspx";



        public static string Trans2OnePay(string OrderID, decimal Total, string vpc_BankType, string vpc_MerchTxnRef, int vpc_Bank)
        {
            // Thao tác sau khi bấm thanh toán
            // InitValues
            int vpc_order_id = nClientID;
            //string vpc_MerchTxnRef = getMerchantTntRef(OrderID, vpc_BankType);
            string vpc_Merchant = MERCHANT_ID;
            string vpc_OrderInfo = OrderID;
            decimal vpc_Amount = Total * 100;
            string vpc_TicketNo = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();

            // Update Database
            if (!TransManager.Insert(vpc_MerchTxnRef, vpc_Merchant, vpc_OrderInfo, Total, vpc_TicketNo, vpc_BankType))
                throw new ApplicationException("Lỗi cập nhật Data!!!");

            // Onepay nội địa

            // Khoi tao lop thu vien va gan gia tri cac tham so gui sang cong thanh toan
            VPCRequest conn = new VPCRequest(ONEPAY_URL);
            conn.SetSecureSecret(SECURE_SECRET);
            // Add the Digital Order Fields for the functionality you wish to use
            // Core Transaction Fields
            conn.AddDigitalOrderField("Title", "onepay paygate");
            conn.AddDigitalOrderField("vpc_Locale", "vn");//Chon ngon ngu hien thi tren cong thanh toan (vn/en)
            conn.AddDigitalOrderField("vpc_Version", "2");
            conn.AddDigitalOrderField("vpc_Command", "pay");
            conn.AddDigitalOrderField("vpc_Merchant", MERCHANT_ID);
            conn.AddDigitalOrderField("vpc_AccessCode", ACCESS_CODE);
            conn.AddDigitalOrderField("vpc_MerchTxnRef", vpc_MerchTxnRef);
            conn.AddDigitalOrderField("vpc_OrderInfo", vpc_OrderInfo);
            conn.AddDigitalOrderField("vpc_Amount", vpc_Amount.ToString());
            conn.AddDigitalOrderField("vpc_Currency", "VND");
            conn.AddDigitalOrderField("vpc_ReturnURL", RETURN_URL);
            // Thong tin them ve khach hang. De trong neu khong co thong tin
            conn.AddDigitalOrderField("vpc_SHIP_Street01", "194 Tran Quang Khai");
            conn.AddDigitalOrderField("vpc_SHIP_Provice", "Hanoi");
            conn.AddDigitalOrderField("vpc_SHIP_City", "Hanoi");
            conn.AddDigitalOrderField("vpc_SHIP_Country", "Vietnam");
            conn.AddDigitalOrderField("vpc_Customer_Phone", "043966668");
            conn.AddDigitalOrderField("vpc_Customer_Email", "support@onepay.vn");
            conn.AddDigitalOrderField("vpc_Customer_Id", "onepay_paygate");
            // Dia chi IP cua khach hang
            conn.AddDigitalOrderField("vpc_TicketNo", vpc_TicketNo);
            conn.AddDigitalOrderField("vpc_Bank", vpc_Bank.ToString());
            // Chuyen huong trinh duyet sang cong thanh toan
            String url = conn.Create3PartyQueryString();
            return url;


        }

        //public static string Trans2OPI(string OrderID, decimal Total, string vpc_BankType, string vpc_MerchTxnRef)
        //{
        //    // Thao tác sau khi bấm thanh toán
        //    // InitValues
        //    int vpc_order_id = nClientID;
        //    //string vpc_MerchTxnRef = getMerchantTntRef(OrderID, vpc_BankType);
        //    string vpc_Merchant = OPI_MERCHANT_ID;
        //    string vpc_OrderInfo = OrderID;
        //    string vpc_Amount = Math.Round((Total * 100),0).ToString();// Math.Round((Total / SettingManager.SelectCode("USDPAYPAL").SettingValue), 2) * 100;
        //    string vpc_TicketNo = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
        //    string vpc_SHIP_Country = "";
        //    string vpc_SHIP_City = "";
        //    string vpc_SHIP_Provice = "";
        //    string vpc_SHIP_Street01 = "";
        //    string vpc_Customer_Email = "";
        //    string vpc_Customer_Id = "";
        //    string vpc_Customer_Phone = "";
        //    if (Authentication.CurrentMember != null)
        //    {
        //        vpc_SHIP_Country = "";// Authentication.CurrentMember.CountryID != int.MinValue ? Util.VietNamese2Varchar(CountryManager.Select(Authentication.CurrentMember.CountryID).CountryName, false) : "";
        //        vpc_SHIP_City = "";// Authentication.CurrentMember.ProvinceID != int.MinValue ? Util.VietNamese2Varchar(ProvinceManager.Select(Authentication.CurrentMember.ProvinceID).ProvinceName, false) : "";
        //        vpc_SHIP_Provice = "";// Authentication.CurrentMember.DistrictID != int.MinValue ? Util.VietNamese2Varchar(DistrictManager.Select(Authentication.CurrentMember.DistrictID).DistrictName, false) : "";
        //        vpc_SHIP_Street01 = "";// Authentication.CurrentMember.Address != null ? Util.VietNamese2Varchar(Authentication.CurrentMember.Address, false) : "";
        //        vpc_Customer_Email = Authentication.CurrentMember.Email;
        //        vpc_Customer_Id = Authentication.CurrentMember.AccountNo;
        //        vpc_Customer_Phone = Authentication.CurrentMember.Mobile;
        //    }

        //    // Update Database
        //    if (!TransManager.Insert(vpc_MerchTxnRef, vpc_Merchant, vpc_OrderInfo, Total, vpc_TicketNo, vpc_BankType))
        //        throw new ApplicationException("Lỗi cập nhật Data!!!");

        //    // Onepay quốc tế

        //    // Khoi tao lop thu vien va gan gia tri cac tham so gui sang cong thanh toan
        //    VPCRequest conn = new VPCRequest(OPI_ONEPAY_URL);
        //    conn.SetSecureSecret(OPI_SECURE_SECRET);
        //    // Add the Digital Order Fields for the functionality you wish to use
        //    // Core Transaction Fields
        //    conn.AddDigitalOrderField("AgainLink", "http://onepay.vn");
        //    conn.AddDigitalOrderField("Title", "onepay paygate");
        //    conn.AddDigitalOrderField("vpc_Locale", "vn");//Chon ngon ngu hien thi tren cong thanh toan (vn/en)
        //    conn.AddDigitalOrderField("vpc_Version", "2");
        //    conn.AddDigitalOrderField("vpc_Command", "pay");
        //    conn.AddDigitalOrderField("vpc_Merchant", OPI_MERCHANT_ID);
        //    conn.AddDigitalOrderField("vpc_AccessCode", OPI_ACCESS_CODE);
        //    conn.AddDigitalOrderField("vpc_MerchTxnRef", vpc_MerchTxnRef);
        //    conn.AddDigitalOrderField("vpc_OrderInfo", vpc_OrderInfo);
        //    conn.AddDigitalOrderField("vpc_Amount", vpc_Amount);
        //    conn.AddDigitalOrderField("vpc_ReturnURL", RETURN_URL);
        //    // Thong tin them ve khach hang. De trong neu khong co thong tin
        //    conn.AddDigitalOrderField("vpc_SHIP_Street01", vpc_SHIP_Street01);
        //    conn.AddDigitalOrderField("vpc_SHIP_Provice", vpc_SHIP_Provice);
        //    conn.AddDigitalOrderField("vpc_SHIP_City", vpc_SHIP_City);
        //    conn.AddDigitalOrderField("vpc_SHIP_Country", vpc_SHIP_Country);
        //    conn.AddDigitalOrderField("vpc_Customer_Phone", vpc_Customer_Phone);
        //    conn.AddDigitalOrderField("vpc_Customer_Email", vpc_Customer_Email);
        //    conn.AddDigitalOrderField("vpc_Customer_Id", vpc_Customer_Id);
        //    // Dia chi IP cua khach hang
        //    conn.AddDigitalOrderField("vpc_TicketNo", vpc_TicketNo);
        //    // Chuyen huong trinh duyet sang cong thanh toan
        //    String url = conn.Create3PartyQueryString();
        //    return url;
        //}

        public static bool verifyPaymentUrl()
        {
            NameValueCollection colQuery = HttpContext.Current.Request.QueryString;
            if (colQuery.Count == 0)
            {
                HttpContext.Current.Response.Redirect("/PayO.aspx");
                return false;
            }

            string hashvalidateResult = "";
            // Khoi tao lop thu vien
            VPCRequest conn = new VPCRequest("http://onepay.vn");
            conn.SetSecureSecret(SECURE_SECRET);
            // Xu ly tham so tra ve va kiem tra chuoi du lieu ma hoa
            hashvalidateResult = conn.Process3PartyResponse(HttpContext.Current.Request.QueryString);

            //// Lay gia tri tham so tra ve tu cong thanh toan
            //String vpc_TxnResponseCode = conn.GetResultField("vpc_TxnResponseCode", "Unknown");
            //string amount = conn.GetResultField("vpc_Amount", "Unknown");
            //string localed = conn.GetResultField("vpc_Locale", "Unknown");
            //string command = conn.GetResultField("vpc_Command", "Unknown");
            //string version = conn.GetResultField("vpc_Version", "Unknown");
            //string cardBin = conn.GetResultField("vpc_Card", "Unknown");
            //string orderInfo = conn.GetResultField("vpc_OrderInfo", "Unknown");
            //string merchantID = conn.GetResultField("vpc_Merchant", "Unknown");
            //string authorizeID = conn.GetResultField("vpc_AuthorizeId", "Unknown");
            //string merchTxnRef = conn.GetResultField("vpc_MerchTxnRef", "Unknown");
            //string transactionNo = conn.GetResultField("vpc_TransactionNo", "Unknown");
            //string txnResponseCode = vpc_TxnResponseCode;
            //string message = conn.GetResultField("vpc_Message", "Unknown");

            if (hashvalidateResult == "INVALIDATED")
            {
                
               // hashvalidateResult = "INVALIDATED";
                return false;
            }
            else
            {
               // hashvalidateResult = "CORRECTED";
                return true;
            }

           
        }

        public static bool verifyOPIUrl()
        {
            string hashvalidateResult = "";
            // Khoi tao lop thu vien
            VPCRequest conn = new VPCRequest("http://onepay.vn");
            conn.SetSecureSecret(OPI_SECURE_SECRET);
            // Xu ly tham so tra ve va kiem tra chuoi du lieu ma hoa
            hashvalidateResult = conn.Process3PartyResponse(HttpContext.Current.Request.QueryString);

            // Lay gia tri tham so tra ve tu cong thanh toan
            //String vpc_TxnResponseCode = conn.GetResultField("vpc_TxnResponseCode", "Unknown");
            //string amount = conn.GetResultField("vpc_Amount", "Unknown");
            //string localed = conn.GetResultField("vpc_Locale", "Unknown");
            //string command = conn.GetResultField("vpc_Command", "Unknown");
            //string version = conn.GetResultField("vpc_Version", "Unknown");
            //string cardType = conn.GetResultField("vpc_Card", "Unknown");
            //string orderInfo = conn.GetResultField("vpc_OrderInfo", "Unknown");
            //string merchantID = conn.GetResultField("vpc_Merchant", "Unknown");
            //string authorizeID = conn.GetResultField("vpc_AuthorizeId", "Unknown");
            //string merchTxnRef = conn.GetResultField("vpc_MerchTxnRef", "Unknown");
            //string transactionNo = conn.GetResultField("vpc_TransactionNo", "Unknown");
            //string acqResponseCode = conn.GetResultField("vpc_AcqResponseCode", "Unknown");
            //string txnResponseCode = vpc_TxnResponseCode;
            //string message = conn.GetResultField("vpc_Message", "Unknown");
            if (hashvalidateResult == "INVALIDATED")
            {
               // vpc_Result.Text = "Transaction is pending";
                //hashvalidateResult = "INVALIDATED";
                // Response.Write("Hash value is equal=> Transaction is successful");
                return false;
            }
            else
            {
                //if (txnResponseCode.Trim() == "0")
                //{
                //    vpc_Result.Text = "Transaction was paid successful";
                //}
                //else
                //{
                //    vpc_Result.Text = "Transaction was not paid successful";
                //}
              //  hashvalidateResult = "CORRECTED";
                // Response.Write("Hash value is not equal=> Transaction is unsuccessful"); 
                return true;
            }

        }
    }

    public class VPCRequest
    {
        Uri _address;
        SortedList<String, String> _requestFields = new SortedList<String, String>(new VPCStringComparer());
        String _rawResponse;
        SortedList<String, String> _responseFields = new SortedList<String, String>(new VPCStringComparer());
        String _secureSecret;


        public VPCRequest(String URL)
        {
            _address = new Uri(URL);
        }

        public void SetSecureSecret(String secret)
        {
            _secureSecret = secret;
        }

        public void AddDigitalOrderField(String key, String value)
        {
            if (!String.IsNullOrEmpty(value))
            {
                _requestFields.Add(key, value);
            }
        }

        public String GetResultField(String key, String defValue)
        {
            String value;
            if (_responseFields.TryGetValue(key, out value))
            {
                return value;
            }
            else
            {
                return defValue;
            }
        }

        public String GetResultField(String key)
        {
            return GetResultField(key, "");
        }

        private String GetRequestRaw()
        {
            StringBuilder data = new StringBuilder();
            foreach (KeyValuePair<string, string> kvp in _requestFields)
            {
                if (!String.IsNullOrEmpty(kvp.Value))
                {
                    data.Append(kvp.Key + "=" + HttpUtility.UrlEncode(kvp.Value) + "&");
                }
            }
            //remove trailing & from string
            if (data.Length > 0)
                data.Remove(data.Length - 1, 1);
            return data.ToString();
        }

        public string GetTxnResponseCode()
        {
            return GetResultField("vpc_TxnResponseCode");
        }

        //_____________________________________________________________________________________________________
        // Three-Party order transaction processing

        public String Create3PartyQueryString()
        {
            StringBuilder url = new StringBuilder();
            //Payment Server URL
            url.Append(_address);
            url.Append("?");
            //Create URL Encoded request string from request fields 
            url.Append(GetRequestRaw());
            //Hash the request fields
            url.Append("&vpc_SecureHash=");
            url.Append(CreateSHA256Signature(true));
            return url.ToString();
        }

        public string Process3PartyResponse(System.Collections.Specialized.NameValueCollection nameValueCollection)
        {
            foreach (string item in nameValueCollection)
            {
                if (!item.Equals("vpc_SecureHash") && !item.Equals("vpc_SecureHashType"))
                {
                    _responseFields.Add(item, nameValueCollection[item]);
                }

            }

            if (!nameValueCollection["vpc_TxnResponseCode"].Equals("0") && !String.IsNullOrEmpty(nameValueCollection["vpc_Message"]))
            {
                if (!String.IsNullOrEmpty(nameValueCollection["vpc_SecureHash"]))
                {
                    if (!CreateSHA256Signature(false).Equals(nameValueCollection["vpc_SecureHash"]))
                    {
                        return "INVALIDATED";
                    }
                    return "CORRECTED";
                }
                return "CORRECTED";
            }

            if (String.IsNullOrEmpty(nameValueCollection["vpc_SecureHash"]))
            {
                return "INVALIDATED";//no sercurehash response
            }
            if (!CreateSHA256Signature(false).Equals(nameValueCollection["vpc_SecureHash"]))
            {
                return "INVALIDATED";
            }
            return "CORRECTED";
        }

        //_____________________________________________________________________________________________________

        private class VPCStringComparer : IComparer<String>
        {
            /*
             <summary>Customised Compare Class</summary>
             <remarks>
             <para>
             The Virtual Payment Client need to use an Ordinal comparison to Sort on 
             the field names to create the SHA256 Signature for validation of the message. 
             This class provides a Compare method that is used to allow the sorted list 
             to be ordered using an Ordinal comparison.
             </para>
             </remarks>
             */

            public int Compare(String a, String b)
            {
                /*
                 <summary>Compare method using Ordinal comparison</summary>
                 <param name="a">The first string in the comparison.</param>
                 <param name="b">The second string in the comparison.</param>
                 <returns>An int containing the result of the comparison.</returns>
                 */

                // Return if we are comparing the same object or one of the 
                // objects is null, since we don't need to go any further.
                if (a == b) return 0;
                if (a == null) return -1;
                if (b == null) return 1;

                // Ensure we have string to compare
                string sa = a as string;
                string sb = b as string;

                // Get the CompareInfo object to use for comparing
                System.Globalization.CompareInfo myComparer = System.Globalization.CompareInfo.GetCompareInfo("en-US");
                if (sa != null && sb != null)
                {
                    // Compare using an Ordinal Comparison.
                    return myComparer.Compare(sa, sb, System.Globalization.CompareOptions.Ordinal);
                }
                throw new ArgumentException("a and b should be strings.");
            }
        }

        //______________________________________________________________________________
        // SHA256 Hash Code

        public string CreateSHA256Signature(bool useRequest)
        {
            // Hex Decode the Secure Secret for use in using the HMACSHA256 hasher
            // hex decoding eliminates this source of error as it is independent of the character encoding
            // hex decoding is precise in converting to a byte array and is the preferred form for representing binary values as hex strings. 
            byte[] convertedHash = new byte[_secureSecret.Length / 2];
            for (int i = 0; i < _secureSecret.Length / 2; i++)
            {
                convertedHash[i] = (byte)Int32.Parse(_secureSecret.Substring(i * 2, 2), System.Globalization.NumberStyles.HexNumber);
            }

            // Build string from collection in preperation to be hashed
            StringBuilder sb = new StringBuilder();
            SortedList<String, String> list = (useRequest ? _requestFields : _responseFields);
            foreach (KeyValuePair<string, string> kvp in list)
            {
                if (kvp.Key.StartsWith("vpc_") || kvp.Key.StartsWith("user_"))
                    sb.Append(kvp.Key + "=" + kvp.Value + "&");
            }
            // remove trailing & from string
            if (sb.Length > 0)
                sb.Remove(sb.Length - 1, 1);

            // Create secureHash on string
            string hexHash = "";
            using (HMACSHA256 hasher = new HMACSHA256(convertedHash))
            {
                byte[] hashValue = hasher.ComputeHash(Encoding.UTF8.GetBytes(sb.ToString()));
                foreach (byte b in hashValue)
                {
                    hexHash += b.ToString("X2");
                }
            }
            return hexHash;
        }
    }
}