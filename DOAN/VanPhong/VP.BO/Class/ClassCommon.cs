using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Musicviet.Class
{
    public class ClassCommon
    {
    }
    /*Session Card*/
    public class SessionShopping
    {
        public SessionShopping()
        { }
        public string OrderId { get; set; }
        public int CategoryId { get; set; }
        public int ProviderId { get; set; }
        public int ProductId { get; set; }
    }
    /*Session TopupPhone*/
    public class TopupPhone
    {
        public TopupPhone() { }
        public string OrderId { get; set; }
        public int MoneyTopup { get; set; }
        public string Mobiphone { get; set; }
    }
    /*Session TopupGame*/
    public class TopupGame
    {
        public TopupGame() { }
        public string OrderId { get; set; }
        public int MoneyTopup { get; set; }
        public string AccountGame { get; set; }
        public int GameType { get; set; }
    }
    /*declare bank*/
    public class BankDeclare
    {
        public const string VietcomBank = "vcb";
        public const string TechcomBank = "tcb"; // LinhDT
        public const string TienPhongBank = "tpb"; // LinhDT
        public const string OnePayInternational = "opi";
        public const string DongABank = "dab";
        public const string HDBank = "hdb";
        public const string VietinBank = "vtb";
        public const string VIBank = "vib";
        public const string Nganluong = "nl";
        public const string Baokim = "bk"; // LinhDT
        public const string Paypal = "pp";
        public const string Unknow = "unk";
        public const string Eximbank = "exb";
        public const string Maritimebank = "mrb"; //msb
        public const string Navibank = "nvb";
        public const string Vietabank = "vab";
        public const string Vpbank = "vpb";
        public const string Sacombank = "scb";
        public const string Gpbank = "gpb";
        public const string Agribank = "agb";
        public const string BIDV = "bidv";
        public const string Oceanbank = "ojb";
        public const string Pgbank = "pgb";
        public const string Shb = "shb";
        public const string Seabank = "sb";
        public const string NamAbank = "nab"; //Ngân hàng Nam á - banknet
        public const string Saigonbank = "sgb";//Ngân hàng Sai gòn công thương Việt nam - banknet 
        public const string MBank = "mb";
        public const string ACB = "acb";
        public const string MSB = "msb";
        public const string BAB = "bab";//ngan hang bac a
        public const string ABB = "ABB";//ngan hang an binh
        public static int ReWriteBank(string codeBank)
        {
            switch (codeBank.ToLower())
            {
                case BankDeclare.TechcomBank:
                    return 2;
                case BankDeclare.TienPhongBank:
                    return 3;
                case BankDeclare.VietinBank:
                    return 4;
                case BankDeclare.VIBank:
                    return 5;
                case BankDeclare.Vietabank:
                    return 9;
                case BankDeclare.MSB:
                    return 10;
                case BankDeclare.Eximbank:
                    return 11;
                case BankDeclare.Shb:
                    return 12;
                case BankDeclare.HDBank:
                    return 7;
                case BankDeclare.VietcomBank:
                    return 1;
                case BankDeclare.DongABank:
                    return 6;
                case BankDeclare.MBank:
                    return 8;
                case BankDeclare.Sacombank:
                    return 16;
                case BankDeclare.Navibank:
                    return 17;
                case BankDeclare.Seabank:
                    return 20;
                case BankDeclare.Oceanbank:
                    return 18;
                case BankDeclare.BIDV:
                    return 19;
                case BankDeclare.BAB:
                    return 22;
                case BankDeclare.Vpbank:
                    return 14;
                case BankDeclare.ABB:
                    return 15;

            }
            return 0;
        }
    }
}