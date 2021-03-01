using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common;
using Manager;

namespace Musicviet.Control
{
    public partial class LinkContent : WebControlBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                GetLink();
            }
        }

        public string imagePath
        {
            get { return Config.GetAppSetting("NewsImagePath"); }
        }


        public void GetLink()
        {
            DataTable dt = HtmlBoxManager.SelectLink(3);
            rptlinkcontent.DataSource = dt;
            rptlinkcontent.DataBind();
        }
    }
}