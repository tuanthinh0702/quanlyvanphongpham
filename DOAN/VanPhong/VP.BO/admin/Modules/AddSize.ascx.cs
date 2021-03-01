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
    public partial class AddSize: System.Web.UI.UserControl
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
                this.lblMessage.Text = "Hãy nhập tên kích thước(cỡ)";
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
                if (SizeManager.Delete(ID))
                {
                    lblMessage.Text = "Đã xóa kích thước cỡ";
                    EditPanel.Enabled = false;
                    BindData();
                    vID = null;
                }
                else
                    this.lblMessage.Text = SizeManager.ErrorMessage;
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
                        SizeInfo obj = SizeManager.Select(Id);
                        obj.Sizename = txtName.Text;
                        obj.Status = int.Parse(txtOrder.Text);
                        SizeManager.Update(obj);
                    }
                }
                else
                {
                    //this is a new object.  
                   SizeInfo obj=new SizeInfo();
                   obj.Sizename = txtName.Text;
                   obj.Status = int.Parse(txtOrder.Text);
                   SizeManager.Insert(obj);
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

            DataTable dt = SizeManager.SelectAll();
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
            SizeInfo obj = SizeManager.Select((int)Id);

            txtName.Text = obj.Sizename;
            txtOrder.Text = obj.Status.ToString();
            vID = obj.SizeID;
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