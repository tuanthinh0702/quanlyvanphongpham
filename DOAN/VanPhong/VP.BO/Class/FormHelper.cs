using System;
using System.Data;
using System.Text;
using System.Web;
using System.Web.UI.WebControls;
using System.Xml;
using Common;
using Manager;
using System.IO;
using System.Net;

namespace CO.FormHelper
{
    public class FormHelper
    {
        public static string PageTitle = "KhuyenMai365.vn: ";

        public static string GetClientIP()
        {
            string ip = string.Empty;
            ip = System.Web.HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
            if(ip==string.Empty)
            {
                ip = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
            }
            return ip;
        }

        public static string GetClientBroswer()
        {
            return System.Web.HttpContext.Current.Request.ServerVariables["HTTP_USER_AGENT"].ToString();
        }

        public static string GetClientOS()
        {
            return System.Web.HttpContext.Current.Request.Browser.Platform;
        }

        public static string QuestionNo2String(int questionNo)
        {
            if (questionNo != null)
            {
                switch (questionNo)
                {
                    case 1: return "Tên trường học đầu tiên của bạn là gì?";
                    case 2: return "Con vật nào bạn yêu thích nhất?";
                    case 3: return "Màu sắc ưa thích nhất của bạn là màu gì?";
                    case 4: return "Cô giáo dạy lớp 1 của bạn tên gì?";
                    case 5: return "Thần tượng của bạn là ai?";
                    default: return "";
                }
            }
            else
                return "";
        }

        public static string OrderStatusToString(object OrderStatus)
        {
            if (OrderStatus != null)
            {
                switch (int.Parse(OrderStatus.ToString()))
                {
                    case 0:
                        return "Chưa GD";
                    case 1:
                        return "Thành công";
                    case 2:
                        return "Chờ xác minh";
                    case 7:
                        return "Đã hủy";
                    case 8:
                        return "Quá hạn";
                    default:
                        return "N/A";
                }
            }
            else
                return "Không xác định";
        }
        public static string StripAllTags(string input)
        {
            char[] array = new char[input.Length];
            int arrayIndex = 0;
            bool inside = false;

            for (int i = 0; i < input.Length; i++)
            {
                char let = input[i];
                if (let == '<')
                {
                    inside = true;
                    continue;
                }

                if (let == '>')
                {
                    inside = false;
                    continue;
                }
                if (!inside)
                {
                    array[arrayIndex] = let;
                    arrayIndex++;
                }
            }

            return new string(array, 0, arrayIndex);
        }
        public static string SplitContent(string value, int max)
        {
            string result = string.Empty;
            StringBuilder str = new StringBuilder();
            String[] listvalue = StripAllTags(value.Trim()).Split(' ');
            if (listvalue.Length > max)
            {
                for (int i = 0; i < max; i++)
                {
                    str.Append(listvalue[i] + " ");
                    result = str.ToString() + "...";
                }
            }
            else
                result = StripAllTags(value.Trim());
            return result;
        }
        public static string Split(string value, int max)
        {
            string result = string.Empty;
            if (value.Length <= max)
                return value;
            result = value.Substring(0, max);
            if (value.Length > result.Length)
                result += " ...";
            return result;
        }
        //private static void InsertCart2DB(AccountInfo objMember, int CardTypeID, int Quantity)
        //{
        //    try
        //    {
        //        CartManager.Insert(objMember.AccountNo, CardTypeID, Quantity);
        //    }
        //    catch { }
        //}

        //private static void InsertCart2Se(DataTable dtCard, int CardTypeID, int Quantity)
        //{            
        //    bool Exist = false;
        //    for (int i = 0; i < dtCard.Rows.Count; i++)
        //    {
        //        if (Util.ObjectToInt(dtCard.Rows[i]["CardTypeID"]) == CardTypeID)
        //        {
        //            Exist = true;
        //            break;
        //        }
        //    }
        //    if (!Exist)
        //    {
        //        DataTable dt = CardTypeManager.TSelect(CardTypeID);
                
        //        if (dt != null&&dt.Rows.Count>0)
        //        {
        //            dt.Columns.Add("Quantity");
        //            dt.Rows[0]["Quantity"] = Quantity;
        //            DataRow dr = dt.Rows[0];
        //            dtCard.ImportRow(dr);
        //            //dtCard.Rows[lProduct.Rows.Count - 1]["Quantity"] = Quantity;
        //        }
        //    }
        //}

        //private static void InsertCart2Se(DataTable lProduct, DataRow dRow)
        //{
        //    int productId = int.Parse(dRow["ProductID"].ToString());
        //    bool Exist = false;
        //    for (int i = 0; i < lProduct.Rows.Count; i++)
        //    {
        //        if (Util.ObjectToInt(lProduct.Rows[i]["ProductID"]) == productId)
        //        {
        //            Exist = true;
        //            break;
        //        }
        //    }
        //    if (!Exist)
        //    {
        //        lProduct.ImportRow(dRow);
        //    }
        //}

        //public static void AddCart(int CardTypeID, int Quantity)
        //{
        //    DataTable dtCart;

        //    if (Authentication.IsAuthenticatedMember())
        //    {
        //        AccountInfo objMember = Authentication.CurrentMember;
        //        InsertCart2DB(objMember, CardTypeID, Quantity);
        //    }
        //    else
        //    {
        //        if (HttpContext.Current.Session["Cart"] != null)
        //        {
        //            dtCart = (DataTable)HttpContext.Current.Session["Cart"];
        //            InsertCart2Se(dtCart, CardTypeID, Quantity);
        //        }
        //        else
        //        {
        //            dtCart = new DataTable();
        //            dtCart = CardTypeManager.TSelect(Convert.ToInt32(CardTypeID));
        //            try
        //            {
        //                dtCart.Columns.Add("Quantity");
        //            }
        //            catch { }
        //            dtCart.Rows[0]["Quantity"] = Quantity;
        //        }
        //        HttpContext.Current.Session["Cart"] = dtCart;
        //    }
        //}

        //public static void AddCart(DataTable dt)
        //{
        //    DataTable lProduct;

        //    if (Authentication.IsAuthenticatedMember())
        //    {
        //        AccountInfo objMember = Authentication.CurrentMember;
        //        for (int i = 0; i < dt.Rows.Count - 1; i++)
        //        {
        //            InsertCart2DB(objMember, int.Parse(dt.Rows[1]["CardTypeID"].ToString()), int.Parse(dt.Rows[1]["Quantity"].ToString()));
        //        }
        //    }
        //    else
        //    {
        //        if (HttpContext.Current.Session["Cart"] != null)
        //        {
        //            lProduct = (DataTable)HttpContext.Current.Session["Cart"];
        //            for (int i = 0; i < dt.Rows.Count - 1; i++)
        //            {
        //                lProduct = (DataTable)HttpContext.Current.Session["Cart"];
        //                InsertCart2Se(lProduct, dt.Rows[i]);
        //            }
        //        }
        //        else
        //        {
        //            lProduct = new DataTable();
        //            lProduct = dt;
        //        }
        //        HttpContext.Current.Session["Cart"] = lProduct;
        //    }            
        //}

        //private static DataTable CreatItemPaging(int startIndex, int endIndex)
        //{
        //    DataTable dt = new DataTable();
        //    dt.Columns.Add("Name");
        //    for (int i = startIndex; i <= endIndex; i++)
        //    {
        //        DataRow dr = dt.NewRow();
        //        dr["name"] = i;
        //        dt.Rows.Add(dr);
        //    }
        //    return dt;
        //}

        //public static DataTable CreatPaging(int NumItems, int pageShow, int pSize, int CurrentPage)
        //{
        //    DataTable dt = new DataTable();
        //    int halfPageShow = (int)pageShow / 2;
        //    halfPageShow = pageShow % 2 == 1 ? halfPageShow + 1 : halfPageShow;
        //    int maxPageShow = (int)NumItems / pSize;

        //    if (NumItems > pageShow * pSize)
        //    {
        //        if (NumItems % pSize != 0)
        //            maxPageShow += 1;
        //        if (CurrentPage <= halfPageShow)
        //        {
        //            dt = CreatItemPaging(1, pageShow);
        //        }
        //        else if (CurrentPage + 1 > maxPageShow - halfPageShow)
        //        {
        //            dt = CreatItemPaging(maxPageShow - pageShow + 1, maxPageShow);
        //        }
        //        else
        //        {
        //            dt = CreatItemPaging(CurrentPage - halfPageShow + 1, CurrentPage + halfPageShow - 1);
        //        }
        //    }
        //    else
        //    {                
        //        if (NumItems % pSize != 0)
        //            maxPageShow += 1;
        //        dt = CreatItemPaging(1, maxPageShow);
        //    }
        //    return dt;
        //}

        //public static DataTable CreatPaging(int NumItems, int pSize)
        //{
        //    DataTable dt = new DataTable();
        //    int maxPageShow = (int)NumItems / pSize;
        //    if (NumItems % pSize != 0)
        //        maxPageShow += 1;
        //    dt = CreatItemPaging(1, maxPageShow);
        //    return dt;
        //}

        //public static string ConvertImagePath(System.Web.UI.Page iPage, object obj, string ParentPath)
        //{
        //    try
        //    {
        //        if (obj == null)
        //            return ParentPath + Config.DefaultImage;
        //        else
        //        {
        //            string path = ParentPath + obj.ToString();
        //            if (File.Exists(iPage.Server.MapPath(path)))
        //                return path;
        //            else
        //                return ParentPath + Config.DefaultImage;
        //        }
        //    }
        //    catch
        //    {
        //        return ParentPath + Config.DefaultImage;
        //    }
        //}

        //public static string ConvertImagePath(System.Web.UI.Page iPage, object obj, string ParentPath, bool LargeImage)
        //{
        //    string defaultImage = "";
        //    string path = "";
        //    if (LargeImage)
        //    {
        //        defaultImage = ParentPath + Config.DefaultImage;
        //        path = ParentPath + obj.ToString();
        //    }
        //    else
        //    {
        //        defaultImage = ParentPath + Config.DefaultImage;
        //        path = ParentPath + obj.ToString();
        //    }
        //    try
        //    {
        //        if (obj == null)
        //            return defaultImage;
        //        else
        //        {
        //            if (File.Exists(iPage.Server.MapPath(path)))
        //                return path;
        //            else
        //                return defaultImage;
        //        }
        //    }
        //    catch
        //    {
        //        return defaultImage;
        //    }
        //}

        #region Send Mail
        public static void SendMail(string To, string Subject, string Body)
        {
            try
            {
                System.Net.Mail.SmtpClient email = new System.Net.Mail.SmtpClient();
                email.Host = Config.SmtpServer;
                email.Port = Config.SmtpPort;
                email.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                email.UseDefaultCredentials = true;
                email.Credentials = new System.Net.NetworkCredential(Config.SmtpUsername, Config.SmtpPassword);
                System.Net.Mail.MailAddress mAddfrom = new System.Net.Mail.MailAddress(Config.SmtpDefaultMail, "MUSICVIET.VN");
                System.Net.Mail.MailAddress mAddto = new System.Net.Mail.MailAddress(To);
                System.Net.Mail.MailMessage mailMsg = new System.Net.Mail.MailMessage(mAddfrom, mAddto);
                mailMsg.IsBodyHtml = true;
                mailMsg.Body = Body;
                mailMsg.Subject = Subject;
                mailMsg.BodyEncoding = System.Text.Encoding.UTF8;
                email.Send(mailMsg);
            }
            catch (Exception ex)
            { }
        }
        public static string CreatMailBodyREG(string FullName, string Account, string Password)
        {
            string sBody = "Neu ban khong doc duoc tieng Viet, vui long chon menu View / Encoding. Chon Charset la UTF-8.<br/><br/>";
            sBody += "Chào mừng " + FullName + " đến với <a href='KhuyenMai365.vn'>KhuyenMai365.vn</a>! <br /><br/>";
            sBody += " Cảm ơn quý khách đã sử dụng dịch vụ của chúng tôi. Dưới đây là thông tin tài khoản quý khách đã đăng ký tại <a href='KhuyenMai365.vn'>KhuyenMai365.vn</a>: <br />";
            sBody += " 1. Tài khoản: " + Account + "<br/>";
            sBody += " 2. Mật khẩu: " + Password + "<br/><br/>";
            //sBody += "Quý khách vui lòng bấm vào link sau đây để hoàn tất đăng ký tài khoản: <a href='http://KhuyenMai365.vn/default.aspx?module=confirm&id=" + HttpUtility.UrlEncode(Util.MD5Encrypt(Account, true)) + "'>http://KhuyenMai365.vn/default.aspx?module=confirm&id=" + HttpUtility.UrlEncode(Util.MD5Encrypt(Account, true)) + "</a> <br />";
            //sBody += "Trong trường hợp quý khách bấm vào liên kết này không được thì quý khách có thể copy liên kết và dán vào ô URL trên trình duyệt Internet rồi gõ Enter.<br />";
            sBody += "<a href='http://KhuyenMai365.vn'>KhuyenMai365.vn</a> mang đến cho bạn sản phẩm thẻ trực tuyến, với các mặt hàng phong phú đa dạng, dịch vụ khách hàng tốt nhất tại Việt Nam.</a> Hãy ghé thăm website của chúng tôi để tham quan và mua hàng bằng cách bấm vào liên kết: <a href='http://KhuyenMai365.vn" + "'>KhuyenMai365.vn</a><br /><br />";
            sBody += "Quý khách nên lưu giữ lại thư này để tham khảo về sau.<br />";
            sBody += "Xin không trả lời lại thư này.<br />";
            sBody += "Trong trường hợp cần thiết hãy liên hệ với chúng tôi qua số điện thoại trên website <a href='KhuyenMai365.vn'>KhuyenMai365.vn</a><br/>";
            sBody += "***************************************************************<br />";
            sBody += "Quý khách có thể thay đổi thông tin cá nhân và mật khẩu tài khoản của quý khách tại KhuyenMai365.vn bất cứ lúc nào bằng cách:<br />";
            sBody += " 1. Đăng nhập với tài khoản của quý khách tại địa chỉ <a href='http://KhuyenMai365.vn/ssl/Default.htm?module=login'>KhuyenMai365.vn/login</a><br />";
            sBody += " 2. Bấm vào liên kết Tài khoản.<br />";
            sBody += " 3. Bấm vào liên kết Thông tin cá nhân để thay đổi thông tin cá nhân.<br />";
            sBody += " 4. Bấm vào liên kết Đổi mật khẩu để đổi mật khẩu mới.<br /><br />";
            sBody += "Chúc quý khách một ngày tốt lành!<br/>";
            sBody += "<b><a href='http://KhuyenMai365.vn'>KhuyenMai365.vn</a></b><br/>";
            return sBody;
        }

        public static string CreatMailBodyPRO(string userName)
        {
            string sBody = "Neu ban khong doc duoc tieng Viet, vui long chon menu View / Encoding. Chon Charset la UTF-8.<br/><br/>";
            sBody += "Chào mừng quý khách! <br/><br/>";
            sBody += "Thông tin cá nhân tài khoản " + userName + " của quý khách tại <a href='KhuyenMai365.vn'>KhuyenMai365.vn</a> đã được thay đổi.<br/>";
            sBody += "Đây chỉ là thư thông báo cho việc bảo mật thông tin tài khoản của quý khách tại <a href='KhuyenMai365.vn'>KhuyenMai365.vn</a> nên quý khách không cần thao tác gì thêm.<br/><br/>";
            sBody += "Xin không trả lời lại thư này.<br/>";
            sBody += "Trong trường hợp cần thiết hãy liên hệ với chúng tôi qua số điện thoại trên website <a href='KhuyenMai365.vn'>KhuyenMai365.vn</a><br/>";
            sBody += "***************************************************************<br />";
            sBody += "Quý khách có thể thay đổi thông tin cá nhân tài khoản của quý khách tại KhuyenMai365.vn bất cứ lúc nào bằng cách:<br />";
            sBody += " 1. Đăng nhập với tài khoản của quý khách tại địa chỉ <a href='http://KhuyenMai365.vn/ssl/Default.htm?module=login'>KhuyenMai365.vn/login</a><br />";
            sBody += " 2. Bấm vào liên kết Tài khoản.<br />";
            sBody += " 3. Bấm vào liên kết Thông tin cá nhân.<br /><br /><br />";
            sBody += "Chúc quý khách một ngày tốt lành!<br/>";
            sBody += "<b><a href='http://KhuyenMai365.vn'>KhuyenMai365.vn</a></b><br/>";
            return sBody;
        }

        public static string CreatMailBodyPSS(string userName)
        {
            string sBody = "Neu ban khong doc duoc tieng Viet, vui long chon menu View / Encoding. Chon Charset la UTF-8.<br/><br/>";
            sBody += "Chào mừng quý khách! <br/><br/>";
            sBody += "Mật khẩu tài khoản " + userName + " của quý khách tại <a href='KhuyenMai365.vn'>KhuyenMai365.vn</a> đã được thay đổi.<br/>";
            sBody += "Đây chỉ là thư thông báo cho việc bảo mật thông tin tài khoản của quý khách tại <a href='KhuyenMai365.vn'>KhuyenMai365.vn</a> nên quý khách không cần thao tác gì thêm.<br/><br/>";
            sBody += "Xin không trả lời lại thư này.<br/>";
            sBody += "Trong trường hợp cần thiết hãy liên hệ với chúng tôi qua số điện thoại trên website <a href='KhuyenMai365.vn'>KhuyenMai365.vn</a><br/>";
            sBody += "***************************************************************<br />";
            sBody += "Quý khách có thể thay đổi mật khẩu tài khoản của quý khách tại KhuyenMai365.vn bất cứ lúc nào bằng cách:<br />";
            sBody += " 1. Đăng nhập với tài khoản của quý khách tại địa chỉ <a href='http://KhuyenMai365.vn/ssl/Default.htm?module=login'>KhuyenMai365.vn/login</a><br />";
            sBody += " 2. Bấm vào liên kết Tài khoản.<br />";
            sBody += " 3. Bấm vào liên kết Đổi mật khẩu.<br /><br /><br />";
            sBody += "Chúc quý khách một ngày tốt lành!<br/>";
            sBody += "<b><a href='http://KhuyenMai365.vn'>KhuyenMai365.vn</a></b><br/>";
            return sBody;
        }

        public static string CreatMailBodyFORGET(string UserName, string Pass)
        {
            string sBody = "Neu ban khong doc duoc tieng Viet, vui long chon menu View / Encoding. Chon Charset la UTF-8.<br/><br/>";
            sBody += "Chào mừng quý khách! <br/><br />";
            sBody += " Cảm ơn quý khách đã sử dụng dịch vụ của chúng tôi. Dưới đây là thông tin tài khoản quý khách đã đăng ký tại website của chúng tôi <br />";
            sBody += " - E-mail/Tên đăng nhập: " + UserName + "<br />";
            sBody += " - Mật khẩu đăng nhập là: " + Pass + " (quý khách có thể dùng chức năng 'Quên mật khẩu' để lấy lại mật khẩu mới)<br />";
            sBody += "Xin không trả lời lại thư này.<br/>";
            sBody += "Trong trường hợp cần thiết hãy liên hệ với chúng tôi qua số điện thoại trên website <a href='KhuyenMai365.vn'>KhuyenMai365.vn</a><br/>";
            sBody += "***************************************************************<br />";
            sBody += "Quý khách có thể thay đổi mật khẩu tài khoản của quý khách tại KhuyenMai365.vn bất cứ lúc nào bằng cách:<br />";
            sBody += " 1. Đăng nhập với tài khoản của quý khách tại địa chỉ <a href='http://KhuyenMai365.vn/ssl/default.htm?module=login'>KhuyenMai365.vn/login</a><br />";
            sBody += " 2. Bấm vào liên kết Tài khoản.<br />";
            sBody += " 3. Bấm vào liên kết Đổi mật khẩu.<br /><br /><br />";
            sBody += "Chúc quý khách một ngày tốt lành!<br/>";
            sBody += "<b><a href='http://KhuyenMai365.vn'>KhuyenMai365.vn</a></b><br/>";
            return sBody;
        }

        public static string AddWithChildren(XmlNode xnod, Int32 intLevel)
        {
            XmlNode xnodWorking;
            string strValue = (string)xnod.Value;
            if (strValue != null)
            {
                strValue = ":" + strValue;
            }
            strSpace += strValue;

            if (xnod.NodeType == XmlNodeType.Element)
            {
                XmlNamedNodeMap mapAttributes = xnod.Attributes;
                foreach (XmlNode xnodAttribute in mapAttributes)
                {
                    strSpace += ":" + xnodAttribute.Value;
                }
                if (xnod.HasChildNodes)
                {
                    xnodWorking = xnod.FirstChild;
                    while (xnodWorking != null)
                    {
                        AddWithChildren(xnodWorking, intLevel + 1);
                        xnodWorking = xnodWorking.NextSibling;
                    }
                }
            }
            return strSpace;
        }

        public static string strSpace = "";

        //public static string CreatMailBody_Template(OrderInfo iOrder, string str, XmlTextReader reader, bool ShowAll)
        //{
        //    XmlDocument xmlDoc = new XmlDocument();
        //    xmlDoc.Load(reader);
        //    reader.Close();

        //    XmlNode xNode = xmlDoc.DocumentElement;
        //    string[] productTag = new string[0];
        //    string[] orderTag = new string[0];
        //    DataTable dt = OrderManager.SelectData(iOrder.OrderID);

        //    switch (dt.Rows[0]["BankID"].ToString().Trim().ToLower())
        //    {
        //        case "vcb":
        //            dt.Rows[0]["BankID"] = "VietcomBank";
        //            break;
        //        // LinhDT:
        //        case "tcb":
        //            dt.Rows[0]["BankID"] = "TechcomBank";
        //            break;
        //        case "tpb":
        //            dt.Rows[0]["BankID"] = "TienPhongBank";
        //            break;

        //        case "vib":
        //            dt.Rows[0]["BankID"] = "VIB";
        //            break;
        //        case "vtb":
        //            dt.Rows[0]["BankID"] = "VietinBank";
        //            break;
        //        case "hdb":
        //            dt.Rows[0]["BankID"] = "HDBank";
        //            break;
        //        case "dab":
        //            dt.Rows[0]["BankID"] = "DongABank";
        //            break;
        //        case "nl":
        //            dt.Rows[0]["BankID"] = "Ngân Lượng";
        //            break;
        //        // LinhDT:
        //        case "bk":
        //            dt.Rows[0]["BankID"] = "Bảo Kim";
        //            break;

        //        case "opi":
        //            dt.Rows[0]["BankID"] = "VISA/Master Card";
        //            break;
        //        case "pp":
        //            dt.Rows[0]["BankID"] = "Paypal";
        //            break;
        //        default:
        //            dt.Rows[0]["BankID"] = "N/A";
        //            break;
        //    }

        //    try
        //    {
        //        for (int i = 0; i < xNode.ChildNodes.Count; i++)
        //        {
        //            XmlNode xmlnode = xNode.ChildNodes[i];
        //            strSpace = "";
        //            string str12 = AddWithChildren(xmlnode, 2);
        //            string[] strTag = str12.Split(':');

        //            if (strTag[1].IndexOf("ProductList") < 0)
        //                try
        //                {
        //                    try
        //                    {
        //                        decimal result = 0;
        //                        // LinhDT:
        //                        if (strTag[1].IndexOf("Customer") > 0 || strTag[1].IndexOf("OrderCode") > 0)
        //                        {
        //                            str = str.Replace(strTag[1].Replace(" ", "").Replace(":", ""), dt.Rows[0][strTag[2].Replace(" ", "").Replace(":", "")].ToString());
        //                        }

        //                        else if (decimal.TryParse(dt.Rows[0][strTag[2].Replace(" ", "").Replace(":", "")].ToString(), out result))
        //                            str = str.Replace(strTag[1].Replace(" ", "").Replace(":", ""), Util.DecimalObjectToString(result, true));
        //                        else
        //                            str = str.Replace(strTag[1].Replace(" ", "").Replace(":", ""), dt.Rows[0][strTag[2].Replace(" ", "").Replace(":", "")].ToString());
        //                    }
        //                    catch
        //                    {
        //                        str = str.Replace(strTag[1].Replace(" ", "").Replace(":", ""), dt.Rows[0][strTag[2].Replace(" ", "").Replace(":", "")].ToString());
        //                    }
        //                }
        //                catch { }
        //            else if (strTag[1].IndexOf("OrderList") < 0)
        //                productTag = strTag;
        //            else
        //                orderTag = strTag;
        //        }
        //    }
        //    catch (Exception ex)
        //    { }

        //    int iProduct = str.IndexOf("$$ProductList$$");
        //    int itable = str.IndexOf("<table", iProduct + 1);
        //    int itrHeader = str.IndexOf("<tr", itable + 1);
        //    int iStarttrLoop = str.IndexOf("<tr", itrHeader + 1);
        //    int iEndtrLoop = str.IndexOf("</tr>", iStarttrLoop + 1);
        //    string strLoop = str.Substring(iStarttrLoop, iEndtrLoop - iStarttrLoop + 5);

        //    string str2 = str.Substring(0, iStarttrLoop);
        //    decimal SumAll = 0;
        //    decimal Sum = 0;
        //    if (productTag.Length > 0)
        //    {
        //        dt.Columns.Add("Sum");
        //        string[] pro = dt.Rows[0]["Menu"].ToString().Split(',');
        //        for (int i = 0; i < pro.Length; i++)
        //        {
                    
        //        }

        //        for (int i = 0; i < dt.Rows.Count; i++)
        //        {
        //            Sum = decimal.Parse(dt.Rows[i]["Price"].ToString());

        //            dt.Rows[i]["Price"] = Sum;
        //            Sum = Sum * decimal.Parse(dt.Rows[i]["Quantity"].ToString());
        //            dt.Rows[i]["Sum"] = Sum;

        //            SumAll += Sum;
        //            string strProduct = strLoop;
        //            try
        //            {
        //                strProduct = strLoop;
        //                for (int j = 2; j < productTag.Length; j += 2)
        //                {
        //                    try
        //                    {
        //                        if (decimal.Parse(dt.Rows[i][productTag[j + 1]].ToString()) >= 0)
        //                            strProduct = strProduct.Replace(productTag[j], Util.DecimalObjectToString(dt.Rows[i][productTag[j + 1]], true));
        //                        else
        //                            strProduct = strProduct.Replace(productTag[j], dt.Rows[i][productTag[j + 1]].ToString());
        //                    }
        //                    catch
        //                    {
        //                        try
        //                        {
        //                            strProduct = strProduct.Replace(productTag[j], dt.Rows[i][productTag[j + 1]].ToString());
        //                        }
        //                        catch { }
        //                    }
        //                }
        //            }
        //            catch (Exception ex)
        //            { }
        //            str2 += strProduct;
        //        }
        //    }
        //    str2 += str.Substring(iEndtrLoop + 5, str.Length - iEndtrLoop - 5);
        //    str2 = str2.Replace("$$ProductList$$", "");
        //    str2 = str2.Replace("$$Total$$", Util.DecimalObjectToString(Sum.ToString(), true));
        //    SumAll = Sum + iOrder.TransactionCosts - iOrder.CouponValue;
        //    str2 = str2.Replace("$$SumAll$$", Util.DecimalObjectToString(SumAll.ToString(), true));
        //    str2 = str2.Replace("$$SumAllText$$", Util.docso(SumAll.ToString("##")));

        //    return str2;
        //}

        public static string InsertCard(string strRow, DataTable dt, string[] cardList, string fillfield, string fillvalue)
        {
            int fSpan = strRow.IndexOf("<span");
            int feSpan = strRow.IndexOf("</span>", fSpan);
            string strCard = strRow.Substring(fSpan, feSpan - fSpan + 7);

            try
            {
                string sCard = strCard;
                if (dt != null)
                {
                    for (int iii = 0; iii < dt.Rows.Count; iii++)
                    {
                        sCard = strCard;
                        DataRow drCard = dt.Rows[iii];
                        for (int jj = 2; jj < cardList.Length; jj += 2)
                        {
                            if (fillfield != "")
                            {
                                if (cardList[jj + 1] != fillfield)
                                {
                                    try
                                    {
                                        DateTime newDate;
                                        if (DateTime.TryParse(drCard[cardList[jj + 1]].ToString(), out newDate))
                                            sCard = sCard.Replace(cardList[jj], newDate.ToString("dd/MM/yyyy"));
                                        else
                                            sCard = sCard.Replace(cardList[jj], drCard[cardList[jj + 1]].ToString());
                                    }
                                    catch
                                    {
                                        try
                                        {
                                            sCard = sCard.Replace(cardList[jj], drCard[cardList[jj + 1]].ToString());
                                        }
                                        catch { }
                                    }
                                }
                                else
                                {
                                    sCard = sCard.Replace(cardList[jj], fillvalue);
                                }
                            }
                            else
                            {
                                try
                                {
                                    DateTime newDate;
                                    if (DateTime.TryParse(drCard[cardList[jj + 1]].ToString(), out newDate))
                                        sCard = sCard.Replace(cardList[jj], newDate.ToString("dd/MM/yyyy"));
                                    else
                                        sCard = sCard.Replace(cardList[jj], drCard[cardList[jj + 1]].ToString());
                                }
                                catch
                                {
                                    try
                                    {
                                        sCard = sCard.Replace(cardList[jj], drCard[cardList[jj + 1]].ToString());
                                    }
                                    catch { }
                                }
                            }
                        }
                        sCard += "<br />";
                        strRow = strRow.Insert(fSpan, sCard);
                        fSpan += sCard.Length;
                        feSpan += sCard.Length;
                    }
                }
                strRow = strRow.Remove(fSpan, feSpan - fSpan + 7);
                return strRow;
            }
            catch { return ""; }

        }
        #endregion

        public static decimal MinusDecimalObject(object obj1, object obj2, object obj3)
        {
            try
            {
                if (obj3 != null && (decimal)obj3 > 0)
                {
                    return decimal.Parse(obj1.ToString()) - decimal.Parse(obj3.ToString());
                }
                else
                {
                    return decimal.Parse(obj1.ToString()) - decimal.Parse(obj2.ToString());
                }
            }
            catch
            {
                return 0;
            }
        }

        public static bool ShowMinusDecimalObject(object obj1, object obj2, object obj3)
        {
            try
            {
                if (obj3 != null && (decimal)obj3 > 0)
                {
                    if (decimal.Parse(obj1.ToString()) > 0 && decimal.Parse(obj3.ToString()) > 0)
                        return decimal.Parse(obj1.ToString()) - decimal.Parse(obj3.ToString()) > 0;
                    else
                        return false;
                }
                else
                {
                    if (decimal.Parse(obj1.ToString()) > 0 && decimal.Parse(obj2.ToString()) > 0)
                        return decimal.Parse(obj1.ToString()) - decimal.Parse(obj2.ToString()) > 0;
                    else
                        return false;
                }
            }
            catch
            {
                return false;
            }
        }

        public static string ReplaceToTranfer(object InString)
        {
            return ReplaceToTranfer(InString.ToString());
        }

        public static string ReplaceToTranfer(string InString)
        {
            return InString.Replace("'", "").Replace("*", "");
        }

        public static string CardStringStatus(int InStock)
        {
            if (InStock > 0)
                return "Trong kho chỉ còn " + InStock + " thẻ.";
            else
                return "Trong kho đã hết sản phẩm này.";
        }

        #region "Giỏ hang - Cart"
        //public static void UpdateQuantityItemInCart(int itemID, int Quantity)
        //{
        //    if (Authentication.IsAuthenticatedMember())
        //    {
        //        CartManager.Update(Authentication.CurrentMember.AccountNo, itemID, Quantity);
        //    }
        //    else
        //    {
        //        DataTable dtCart = (DataTable)HttpContext.Current.Session["Cart"];
        //        for (int i = 0; i < dtCart.Rows.Count; i++)
        //        {
        //            if (Util.ObjectToInt(dtCart.Rows[i]["CardTypeID"]) == itemID)
        //            {
        //                dtCart.Rows[i]["Quantity"] = Quantity;
        //                break;
        //            }
        //        }
        //        HttpContext.Current.Session["Cart"] = dtCart;
        //    }
        //}
        #endregion

        public static bool checkIP()
        {
            //nếu dùng Proxy
            string clientIP;
            string ipCall = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (!string.IsNullOrEmpty(ipCall))
            {
                string[] ipRange = ipCall.Split(',');
                int le = ipRange.Length - 1;
                clientIP = ipRange[le];
            }
            else //không dùng proxy
                clientIP = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];

            return clientIP == "123.30.51.48" ? true : false; // 123.30.51.48 là nganluong.vn
        }


        public static string FormatText(string longText)
        {
            longText = longText.Replace("-", "");

            int index = longText.Length;
            while (index > 9)
            {
                index -= 4;
                longText = longText.Insert(index, "-");
            }
            if (index == 9)
            {
                while (index > 3)
                {
                    longText = longText.Insert(index - 3, "-");
                    index -= 3;
                }
            }
            else if (index == 8)
            {
                longText = longText.Insert(index - 4, "-");
            }
            else if (index < 8)
            {
                index = ((int)(index / 2));
                longText = longText.Insert(index, "-");
            }

            return longText;
        }
        public static string WebsitePath()
        {
            return Config.GetAppSetting("WebsiteAppPath");
        }
        public static string GetRedirect(string url)
        {
            HttpWebRequest s = (HttpWebRequest)WebRequest.Create(url);
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
            String html = sb.ToString().Trim();
            // Response.Redirect(GetXMLValue(html));
            return GetViaName(html, "<checkout_url>", "</checkout_url>");
        }
        public static String GetViaName(String xml, String starts, String ends)
        {
            //string s = "User name (sales)";
            try
            {
                int start = xml.IndexOf(starts);
                int end = xml.IndexOf(ends);
                string result = xml.Substring(start + starts.Length, end - start + 1 - ends.Length);
                return result;
            }
            catch (Exception)
            {
                return "";
                throw;
            }
        }
        //chuan hoa bank
        public static string GetBankCode(string text)
        {
            string returnValue = "";
            switch (text)
            {
                case "VietcomBank":
                    {
                        returnValue = "VCB"; break;
                    }
                case "BIDV":
                    {
                        returnValue = "BIDV"; break;
                    }
                case "VietinBank":
                    {
                        returnValue = "VTB"; break;
                    }
                case "VIBank":
                    {
                        returnValue = "VIB"; break;
                    }
                case "HDBank":
                    {
                        returnValue = "HDB"; break;
                    }
                case "Ngân lượng":
                    {
                        returnValue = "NL"; break;
                    }
                case "VISA/MasterCard":
                    {
                        returnValue = "OPI"; break;
                    }
                case "Bảo Kim":
                    {
                        returnValue = "BK"; break;
                    }
                case "AgriBank":
                    {
                        returnValue = "AGB"; break;
                    }
                case "TechComBank":
                    {
                        returnValue = "TCB"; break;
                    }
                case "DongABank":
                    {
                        returnValue = "DAB"; break;
                    }
                case "TienPhongBank":
                    {
                        returnValue = "TPB"; break;
                    }
                case "MBank":
                    {
                        returnValue = "MB"; break;
                    }
                case "EximBank":
                    {
                        returnValue = "EXB"; break;
                    }
                case "ACB":
                    {
                        returnValue = "ACB"; break;
                    }
                case "MariTimeBank":
                    {
                        returnValue = "MSB"; break;
                    }
                case "VietABank":
                    {
                        returnValue = "VAB"; break;
                    }
                case "VPBank":
                    {
                        returnValue = "VPB"; break;
                    }
                case "SacomBank":
                    {
                        returnValue = "SCB"; break;
                    }
                case "GPBank":
                    {
                        returnValue = "GPB"; break;
                    }
                case "SHB":
                    {
                        returnValue = "SHB"; break;
                    }
                case "SeaBank":
                    {
                        returnValue = "SB"; break;
                    }
                case "OceanBank":
                    {
                        returnValue = "OJB"; break;
                    }
                case "NaviBank":
                    {
                        returnValue = "NVB"; break;
                    }
                case "PgBank":
                    {
                        returnValue = "PGB"; break;
                    }
                case "NamABank":
                    {
                        returnValue = "NAB"; break;
                    }
                case "SaigonBank":
                    {
                        returnValue = "SGB"; break;
                    }
                default:
                    {
                        returnValue = "abc"; break;
                    }
            }
            return returnValue;
        }

    }
}