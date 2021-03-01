<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PayConfirm.ascx.cs" Inherits="Musicviet.Module.PayConfirm" %>
<%@ Register TagPrefix="cc1" Namespace="Common" Assembly="Common" %>
 <%@ Register Src="../Control/LinkFacebooks.ascx" TagName="LinkFacebooks" TagPrefix="uc6" %>
 <%@ Register Src="../Control/ProductRight.ascx" TagName="ProductRight" TagPrefix="uc7" %>
 <%@ Register Src="../Control/NewsRight.ascx" TagName="NewsRight" TagPrefix="uc8" %>
<div id="contentleft">
 <div id="contentleftwrapcontent">
 <script type="text/javascript">
     $(document).ready(function () {
         try {
             $("#ddlBank").msDropDown();

         } catch (e) {
             // alert(e.message);
         }
     });
    </script>
 <fieldset class="titL" style="margin-top:20px;">
 <legend>Thông tin khách hàng
 </legend>
   <div style="color: white;" runat="server" id="buy">
                <p style="color: white; font-weight: bold; font-size: 13px; text-align: center; margin-top: 25px;
                    margin-bottom: 18px;">
                    Quý khách vui lòng nhập đầy đủ thông tin sau đây để chúng tôi liên hệ và giao hàng
                    đúng yêu cầu.</p>
                <table style="height: 250px; margin-bottom: 6px;">
                    <tr>
                        <td style="width: 110px;">
                            Tên khách hàng
                        </td>
                        <td>
                            <asp:TextBox ID="txtName" runat="server" Height="22px" Width="411px"></asp:TextBox>
                        </td>
                        <td>
                              &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                          
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Số điện thoại
                        </td>
                        <td>
                            <asp:TextBox ID="txtPhone" runat="server" Height="22px" Width="411px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtPhone" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Email
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server" Height="22px" Width="411px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtEmail" ErrorMessage="*" Display="Dynamic" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="txtEmail" ErrorMessage="*" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Địa chỉ
                        </td>
                        <td>
                            <asp:TextBox ID="txtAddress" runat="server" Height="22px" Width="411px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ErrorMessage="*" ControlToValidate="txtAddress" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Ghi chú
                        </td>
                        <td>
                            <asp:TextBox ID="txtNote" runat="server" Height="74px" TextMode="MultiLine" Width="411px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                   <tr>
                   <td></td>
                   <td><asp:Label ID="lblError" runat="server" Text="" ForeColor="Red"></asp:Label></td>
                   </tr>
                </table>
            </div>
 </fieldset>
     <fieldset class="titL">
 <legend>
 Lựa chọn hình thức thanh toán
 </legend>
  <div style="color:white;">
 <p>
     <asp:RadioButton ID="rdoHome" runat="server" Checked="true" 
         GroupName="select_bank" oncheckedchanged="rdoHome_CheckedChanged" 
         AutoPostBack="True" />Thanh toán tại nhà.</p>
     <p>
     <asp:RadioButton ID="rdoOnline" runat="server" GroupName="select_bank" 
             oncheckedchanged="rdoOnline_CheckedChanged" AutoPostBack="True" />Thanh trực tuyến.</p>
     <div id="bank_select" runat="server" visible="true" style="margin-left: 80px; margin-top: 15px; margin-bottom: 20px;">
     <asp:DropDownList ID="ddlBank" ClientIDMode="Static" runat="server" 
                    DataTextField="BankName" DataValueField="Logo"
                    AutoPostBack="true" OnSelectedIndexChanged="ddlBank_SelectedIndexChanged" 
                    CssClass="ddl" Width="300px">
     </asp:DropDownList>
     </div>
     <table style="margin-top: 15px; height: 70px; float:left;">
      <tr>
                        <td style="width: 80px;">
                            Mã bảo mật
                        </td>
                        <td>
                            <asp:TextBox ID="txtCodeValid" runat="server"></asp:TextBox>
                            &nbsp;<cc1:ImageVerifier ID="ImageVerifier1" runat="server" Width="100" Height="20" />
                            &nbsp;<asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <a href="San-pham.htm">
                                <input type="button" value="Mua tiếp" class="btnbuy" /></a> &nbsp; &nbsp; &nbsp;
                            <asp:Button ID="Button1" runat="server" Text=" Đặt hàng " CssClass="btnbuy" OnClick="Button1_Click" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
     </table>
 </div>
 </fieldset>      
</div>
</div>
<div id="contentrighttwrapcontent">
    <table>
        <tr><td><uc6:LinkFacebooks ID="LinkFacebooks1" runat="server"/></td></tr>
        <tr><td><uc7:ProductRight ID="ProductRight1" runat="server"/></td></tr>
    </table>
  </div>