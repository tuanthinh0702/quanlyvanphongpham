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
    public partial class SeverDetail : WebControlBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(Request["CategoryID"]))
            {
                string a = GetCate(Request["CategoryID"]);
                if(!string.IsNullOrWhiteSpace(a))
                {
                    Label1.Text = " >> " + a;
                }
            }
            BindData();

        }
        protected string GetDir()
        {
            return Server.MapPath("/Upload/");
        }
        protected string GetCate(string cateid)
        {
            CategoryInfo info=CategoryManager.Select(int.Parse(cateid));
            if (info != null)
                return info.CategoryName;
            return "";
        }

        protected void BindData()
        {
            rptCate.DataSource = CategoryManager.SelectOne(4);
            rptCate.DataBind();
        }
        protected void rptCate_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            HiddenField hd = (HiddenField)e.Item.FindControl("hdCateId");
            Repeater rpt1 = (Repeater)e.Item.FindControl("rptProduct");
            rpt1.DataSource = ProductManager.SelectProByCate(int.Parse(hd.Value));
            rpt1.DataBind();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Page_Load(sender, e);
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Page_Load(sender, e);
        }
    }
}