using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common;
using Manager;
namespace Musicviet.Module
{
    public partial class About : WebControlBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BinData();
            }
          
        }
        protected void BinData()
        {
            DataTable dx = AbountManager.SelectAll();
            rptAbountDetail.DataSource = dx;
            rptAbountDetail.DataBind();
        }
    }
}