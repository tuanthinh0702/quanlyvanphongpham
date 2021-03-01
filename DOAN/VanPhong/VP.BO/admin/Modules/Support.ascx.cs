using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Manager;

namespace Musicviet.Administrators.Modules
{
    public partial class Support : System.Web.UI.UserControl
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
            if (this.txtTitle.Text.Trim() == "")
            {
                this.lblMessage.Text = "Hãy nhập tiêu đề";
                return false;
            }
            if (this.txtNicknam.Text.Trim() == "")
            {
                this.lblMessage.Text = "Hãy nhập Nickname";
                return false;
            }
            if (this.txtPhone.Text.Trim() == "")
            {
                this.lblMessage.Text = "Hãy nhập số điện thoại";
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
                if (SupportManager.Delete(ID))
                {
                    lblMessage.Text = "Đã xóa mục hỗ trợ ";
                    EditPanel.Enabled = false;

                    BindData();
                    vID = null;
                }
                else
                    this.lblMessage.Text = ProviderManager.ErrorMessage;
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
                        SupportInfo obj = SupportManager.Select(Id);
                        obj.Title = txtTitle.Text;
                        obj.Yahoo = txtNicknam.Text;
                        obj.Phone = txtPhone.Text;
                        obj.Type = int.Parse(DropDownList1.SelectedValue);
                        SupportManager.Update(obj);
                    }
                }
                else
                {
                    //this is a new object.  
                  SupportInfo obj=new SupportInfo();
                    obj.Title = txtTitle.Text;
                    obj.Yahoo = txtNicknam.Text;
                    obj.Phone = txtPhone.Text;
                    obj.Type = int.Parse(DropDownList1.SelectedValue); ;
                  SupportManager.Insert(obj);
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
        protected object imagePath
        {
            get
            {
                return ViewState["imagepath"];
            }
            set
            {
                ViewState["imagepath"] = value;
            }
        }

        private void BindData()
        {

            DataTable dt = SupportManager.SelectAll();
            if (dt != null)
            {
                DataView dv = dt.DefaultView;
                dv.Sort = "ID ASC";
                dg.DataSource = dv;
                dg.DataBind();
            }
        }

        private void EditData(int Id)
        {
            SupportInfo obj = SupportManager.Select((int)Id);

            txtTitle.Text = obj.Title;
            txtNicknam.Text = obj.Yahoo;
            txtPhone.Text = obj.Phone;
            DropDownList1.SelectedValue = obj.Type.ToString();
           vID = obj.ID;
            EditPanel.Enabled = true;
        }

        private void NewData()
        {
            txtNicknam.Text = "";
            txtTitle.Text = "";
            txtPhone.Text = "";
            vID = null;

            EditPanel.Enabled = true;
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            NewData();
        }

      }
}