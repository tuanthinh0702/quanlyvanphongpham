<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Contact.ascx.cs" Inherits="Musicviet.Module.Contact" %>
<%@ Register TagPrefix="cc2" Namespace="Common" Assembly="Common" %> 
<%@ Import Namespace="Common" %>
<div class="boxgiua_wrap">

    <div class="header_layer_1">
        <div class="header_layer_2">
            <h1 class="header"><span><label>Giới thiệu</label></span></h1>
        </div>
    </div>
    <div class="box_content_layer_l">
        <div class="box_content_layer_2">
        <div class="boxgiua">
            <div class="boxgiua_lop1">
                <div class="boxgiua_lop2">
                <table style="width: 100%; height: 450px;">
                    <tr style="text-align: center;">
                        <td colspan="2">
                           <p style=" font-weight: bold; font-size: 14px; text-align: center; margin-top: 30px;"><i>Quý khách vui lòng nhập đầy đủ thông tin sau đây để chúng tôi liên hệ và giao hàng đúng yêu cầu.</i></p> </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                          Tên khách hàng</td>
                        <td>
                          <asp:TextBox ID="txtName" runat="server" Height="22px" Width="411px"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                    Số điện thoại</td>
                        <td>
                            <asp:TextBox ID="txtPhone" runat="server" Height="22px" Width="411px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                           Email</td>
                        <td>
                          <asp:TextBox ID="txtEmail" runat="server" Height="22px" Width="411px"></asp:TextBox>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" 
                                runat="server" ControlToValidate="txtEmail" ErrorMessage="*" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                ForeColor="Red"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Địa chỉ</td>
                        <td>
                            <asp:TextBox ID="txtAddress" runat="server" Height="22px" Width="411px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr style="height: 210px;">
                        <td>
                            Ghi chú</td>
                        <td>
                            <asp:TextBox ID="txtNote" runat="server" Height="200px" TextMode="MultiLine" 
                                Width="411px"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="txtNote" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Mã bảo vệ</td>
                        <td id="Td1">
                            <asp:TextBox ID="txtCode" runat="server" Width="129px"></asp:TextBox>
                           &nbsp;<cc2:ImageVerifier ID="ImageVerifier2" runat="server" Height="20px" />
                           &nbsp; <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text=" Gửi " CssClass="btnbuy" 
                                onclick="Button1_Click" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
                <div><p style=" font-weight: bold; font-size: 13px; text-align: center; margin-top: 50px;">Cảm ơn bạn đã mua hàng của chúng tôi</p></div>
              </div>
          </div>
        </div>
    </div>
    </div>
</div>