using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Manager;

    public partial class Home : System.Web.UI.Page
    {
        public static string URLForHTML(string sServerURL)
        {
            if (HttpContext.Current.Request.ApplicationPath == "/")
            {
                return (HttpContext.Current.Request.ApplicationPath + sServerURL.Substring(2));
            }
            return (HttpContext.Current.Request.ApplicationPath + sServerURL.Substring(1));
        }
        private readonly string filesPath = URLForHTML("/Modules/");
        //private readonly Repository obj = new Repository();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Authentication.IsAuthenticated())
            {
                Response.Redirect("Default.aspx");
            }
      
            try
            {
                ltrUser.Text = Authentication.CurrentUser.UserName;
                if (Request.QueryString["module"] == null)
                {
                    string path = "home.ascx";

                    string filespadth = "Modules/" + path;

                    LoadMember(filespadth);
                }
                else
                {
                   // Title = Request.QueryString["module"].ToUpper();
                    string path = "Modules/" + Request.QueryString["module"] + ".ascx";
                    if (File.Exists(Server.MapPath(path)))
                    {
                        LoadMember(path);
                    }
                }
            }
            catch (Exception ex)
            {
                //ExceptionWriter.ExceptionsSave(new Exceptions("Error Load : ", ex.Message));
            }
        }

        private void LoadMember(string controlsPath)
        {
            var control = LoadControl(controlsPath) as UserControl;
            pnCOntent.Controls.Add(control);
        }


        private string RenderControl(string controlName)
        {
            var page = new Page();
            var userControl = (UserControl)page.LoadControl(controlName);
            userControl.EnableViewState = false;
            var form = new HtmlForm();
            form.Controls.Add(userControl);
            page.Controls.Add(form);

            var textWriter = new StringWriter();
            HttpContext.Current.Server.Execute(page, textWriter, false);
            return textWriter.ToString();
        }

        public bool GetDirFiles(string namesOnDir)
        {
            var dir = new DirectoryInfo(filesPath);
            FileInfo[] s = dir.GetFiles("*.*");
            foreach (FileInfo fileInfo in s)
            {
                string name = fileInfo.Name;
                if (name.Equals(namesOnDir.ToLower().Trim()))
                    return true;
            }
            return false;
        }

        public bool CheckDirFiles(string controlsPath)
        {
            var dir = new DirectoryInfo(filesPath);
            FileInfo[] s = dir.GetFiles("*.*");
            foreach (FileInfo fileInfo in s)
            {
                string name = fileInfo.Name;
                if (name.Equals(controlsPath.ToLower().Trim()))
                    return true;
            }
            return false;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/");
        }
    }
