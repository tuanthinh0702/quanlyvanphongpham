<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PayDetail.ascx.cs" Inherits="Musicviet.Module.PayDetail" %>
<%@ Register TagPrefix="cc1" Namespace="Common" Assembly="Common" %>
 <script language="javascript" type="text/javascript">
     document.getElementById("idbody").className = "sub-page";
</script>
<%@ Import Namespace="Common" %>
<div id="wrapper" class="mainContent">
    <div id="promotionBanner" class="category-promotion"></div>
    <div id="siteMap" class="site-map">
        <asp:DataList runat="server" ID="dtlSitemap" RepeatDirection="Horizontal">
            <ItemTemplate>
                 <a href="<%#Eval("link") %>"><%#Eval("Title")%></a>
            </ItemTemplate>
            <SeparatorTemplate><span>&raquo;</span></SeparatorTemplate>
        </asp:DataList>
    </div>
    <div class="main-container clearfix">
        <div class="side-bar">
            <h3>Danh mục</h3>
           <ul id="categoryMenu" class="module-filter other-page">
                <li><a href="/Tin-Tuc.htm" title="Tin tức">Tin tức</a></li>
                <asp:Repeater runat="server" ID="rptnewscategory">
                    <ItemTemplate>
                        <li class=""><a href="<%#GenerateURL(Eval("Title"),Eval("NewsID")) %>" title="<%#Eval("Title") %>"><%#Eval("Title")%></a></li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
        <div id="pageContent" class="primary-content">
         <div class="article-wrap"><h2>Thông tin khách hàng</h2>
             <div class="article-content">
                <fieldset class="titL" style="margin-top:20px;">
 <legend>Thông tin khách hàng
 </legend>
   <div  runat="server" id="buy">
                <p style=" font-weight: bold; font-size: 13px; text-align: center; margin-top: 25px;
                    margin-bottom: 18px;">
                    Quý khách vui lòng nhập đầy đủ thông tin sau đây để chúng tôi liên hệ và giao hàng
                    đúng yêu cầu.</p>
                <table style="height: 250px; margin-bottom: 6px;">
                      <tr>
                        <td style="width: 110px;">
                            Tên đăng nhập:
                        </td>
                        <td>
                            <asp:TextBox ID="txtusser" runat="server" Height="22px" Width="411px"></asp:TextBox>
                        </td>
                        <td>
                              &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="txtusser" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                          
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Mật khẩu:
                        </td>
                        <td>
                            <asp:TextBox ID="txtPass" runat="server" Height="22px" Width="411px" TextMode="Password"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="txtPass" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
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
  <div>
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
      </div>
    </div>
</div>