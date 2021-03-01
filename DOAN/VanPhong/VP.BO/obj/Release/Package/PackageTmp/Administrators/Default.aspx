<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Default" Theme="Muse" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1" runat="server">
        <title>Trang quản trị trienlong.com</title>
       </head>
    <body id="login">
        <form id="form1" runat="server">
            <div class="container">
                <div class="row">
                    <a href="#" class="center block"></a>
                    <div class="col_6 pre_3 padding_top_60">
                        <asp:Panel ID="Panel1" runat="server" DefaultButton="btnLogin">
                        <div class="widget clearfix">
                            <h2>Đăng nhập</h2>
                            <div class="widget_inside">
                                <p class="margin_bottom_15">Bạn cần nhập đầy đủ thông tin dưới đây</p>
                                <div class="form">
                                    <div class="clearfix">
                                        <label>Tài khoản</label>
                                        <div class="input">
                                            <input type="text" class="xlarge" id="txtUserName" runat="server"/>
                                            <asp:RequiredFieldValidator ID="validUsers" runat="server" 
                                                                        ControlToValidate="txtUserName" Display="Dynamic" ErrorMessage="*" 
                                                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                        <label>Mật khẩu</label>
                                        <div class="input">
                                            <input type="password" class="xlarge" id="txtPassword" runat="server"/>
                                            <asp:RequiredFieldValidator ID="validPass" runat="server" 
                                                                        ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="*" 
                                                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                        <div class="input no-label">
                                            <input type="checkbox" id="chkRemember" runat="server" /> Nhớ mật khẩu?
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                        <div class="input no-label">
                                            <asp:Label runat="server" ID="lblError" ForeColor="Red"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="clearfix grey-highlight">
                                        <div class="input no-label ">
                                            <asp:LinkButton runat="server" ID="btnLogin" CssClass="button blue" 
                                                            onclick="btnLogin_Click"><span>Đăng nhập</span></asp:LinkButton>
                                            <asp:LinkButton runat="server" ID="btnReset" CssClass="button" 
                                                            onclick="btnReset_Click" CausesValidation="False"><span>Làm lại</span></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>