using System;
using System.IO;

namespace Musicviet
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (Request.QueryString["module"] == null)
                {
                    this.contentTop.LoadMember("Module/Home.ascx");
                }
                else
                {
                    string path = "Module/" + Request.QueryString["module"] + ".ascx";

                    if (File.Exists(Server.MapPath(path)))
                    {
                        this.contentTop.LoadMember(path);
                    }
                }

            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        }
    }
}