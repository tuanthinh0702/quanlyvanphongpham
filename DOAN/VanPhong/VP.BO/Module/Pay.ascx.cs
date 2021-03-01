using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common;
using Manager;

namespace Musicviet.Module
{
    public partial class Pay : WebControlBase
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            if (Request["type"] == "success")
            { panelSuccess.Visible = true;}
            else 
            { panelSuccess.Visible = true;}
            Session["Cart"] = null;
            Session.Remove("Cart");
        }

      }
}