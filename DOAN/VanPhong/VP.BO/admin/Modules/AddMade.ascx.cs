using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Manager;
using Common;
namespace Musicviet.Administrators.Modules
{
    public partial class AddMade: System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }
        protected void dg_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Edit":
                    vID = e.CommandArgument;
                    if (vID != null)
                        EditData(Convert.ToInt32(vID));
                    break;
                case "Del":
                    vID = e.CommandArgument;
                    DeleteData(Convert.ToInt32(vID));
                    break;
                default:
                    break;
            }
        }

        protected void dg_OnPageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            dg.CurrentPageIndex = e.NewPageIndex;

            // Re-bind the data to refresh the DataGrid control. 
            BindData();
        }
        private bool CheckValid()
        {
            if (!Page.IsValid)
                return false;
            if (this.txtName.Text.Trim() == "")
            {
                this.lblMessage.Text = "Hãy nhập xuất sứ";
                return false;
            }
            return true;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!CheckValid())
                return;

            SaveData();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            EditPanel.Enabled = false;
            vID = null;
        }

        protected void DeleteData(int ID)
        {
            try
            {
                if (MadeManager.Delete(ID))
                {
                    lblMessage.Text = "Đã xóa xuất sứ";
                    EditPanel.Enabled = false;

                    BindData();
                    vID = null;
                }
                else
                    this.lblMessage.Text = MadeManager.ErrorMessage;
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }

        protected void SaveData()
        {
            try
            {
                if (vID != null)
                {
                    //Edit on the object.  
                    int Id;
                    if (int.TryParse(vID.ToString(), out Id))
                    {
                        MadeInfo obj = MadeManager.Select(Id);
                        obj.MadeName = txtName.Text;
                        obj.Status =int.Parse(txtOrder.Text);
                        MadeManager.Update(obj);
                    }
                }
                else
                {
                     //this is a new object.  
                     MadeInfo obj=new MadeInfo();
                     obj.MadeName = txtName.Text;
                     obj.Status = int.Parse(txtOrder.Text);
                     MadeManager.Insert(obj);
                }

                lblMessage.Text = "Đã lưu dữ liệu thành công!";
                EditPanel.Enabled = false;
                BindData();
                vID = null;
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }

        protected object vID
        {
            get
            {
                return ViewState["vID"];
            }
            set
            {
                ViewState["vID"] = value;
            }
        }

        private void BindData()
        {

            DataTable dt = MadeManager.SelectAll();
            if (dt != null)
            {
                DataView dv = dt.DefaultView;
                dv.Sort = "Status ASC";
                dg.DataSource = dv;
                dg.DataBind();
            }
        }

        private void EditData(int Id)
        {
            MadeInfo obj = MadeManager.Select((int)Id);
            txtName.Text = obj.MadeName;
            txtOrder.Text = obj.Status.ToString();
            vID = obj.MadeID;
            EditPanel.Enabled = true;
        }

        private void NewData()
        {
            txtName.Text = "";
            txtOrder.Text = "0";
            vID = null;

            EditPanel.Enabled = true;
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            NewData();
        }

      }
}