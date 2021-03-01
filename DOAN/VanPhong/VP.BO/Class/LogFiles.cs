using System;
using System.IO;
using System.Text;

namespace Musicviet.Class
{
    public class LogFiles
    {
        private string sLogFormat;
        private string sTime;

        public LogFiles()
        {
            sLogFormat = DateTime.Now.ToShortDateString().ToString() + " " + DateTime.Now.ToLongTimeString().ToString() + " ==> ";

            string sYear = DateTime.Now.Year.ToString();
            string sMonth = DateTime.Now.Month.ToString();
            string sDay = DateTime.Now.Day.ToString();
            sTime = DateTime.Now.ToString("yyyyMMdd");// sYear + sMonth + sDay;
        }

        public void ErrorLog(string sPathName, string sURL)
        {
            try
            {
                StreamWriter sw = new StreamWriter(sPathName + sTime + ".txt", true);
                sw.WriteLine(sLogFormat + sURL);
                sw.Flush();
                sw.Close();
            }
            catch { }
        }
    }
}