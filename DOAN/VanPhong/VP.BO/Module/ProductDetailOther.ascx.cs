using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common;
using Manager;
namespace Musicviet.Module
{
    public partial class ProductDetailOther : WebControlBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                return;
            }
            BindData();
            BindOther();
        }
        protected  void BindData()
        {
            try
            {
            FormView1.DataSource = ProductManager.SelectProOne(int.Parse(Request["id"]));
            FormView1.DataBind();
            }
            catch (Exception)
            {
                FormView1.DataSource = null;
                FormView1.DataBind();
                throw;
            }

        }
        protected void BindOther()
        {
            try
            {
                rptOther.DataSource = ProductManager.SelectProductOther(int.Parse(Request["id"]));
                rptOther.DataBind();
            }
            catch (Exception)
            {
                rptOther.DataSource = null;
                rptOther.DataBind();
            }
        }
    }
}