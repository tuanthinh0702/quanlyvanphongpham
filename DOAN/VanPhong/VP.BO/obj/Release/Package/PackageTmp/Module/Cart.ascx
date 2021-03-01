<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Cart.ascx.cs" Inherits="Musicviet.Module.Cart" %>
<%@ Register TagPrefix="cc1" Namespace="Common" Assembly="Common" %>
<%@ Register TagPrefix="uc7" TagName="ProductRight" Src="~/Control/ProductRight.ascx" %>
<%@ Register TagPrefix="uc8" TagName="NewsRight" Src="~/Control/NewsRight.ascx" %>
<%@ Register TagPrefix="uc6" TagName="LinkFacebooks" Src="~/Control/LinkFacebooks.ascx" %>
<script type="text/javascript">    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
        fjs.parentNode.insertBefore(js, fjs);
    } (document, 'script', 'facebook-jssdk'));</script>
<div id="contentleft">
    <style>
        table#grvOrder
        {
            width: 680px;
            margin-left: 10px;
            border: 1px solid white;
        }
        table#grvOrder tr td, tbody th
        {
            vertical-align: middle;
            border: 1px solid white;
            text-align: center;
        }
        #grvOrder tbody th
        {
            font-weight: bold;
            font-size: 14px;
            height: 32px;
        }
    </style>
    <div id="contentleftwrapcontent">
        <div class="textnews">
            <span>Chi tiết đơn hàng </span>
        </div>
        <div style="color: white;">
            <asp:GridView ID="grvOrder" ClientIDMode="Static" runat="server" CssClass="dataTable"
                AutoGenerateColumns="False" OnRowCommand="grvOrder_RowCommand" OnRowUpdating="grvOrder_RowUpdating"
                OnRowDeleting="grvOrder_RowDeleting">
                <Columns>
                    <asp:TemplateField HeaderText="STT">
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemTemplate>
                            <%#Container.DataItemIndex + 1%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Tên sản phẩm
                        </HeaderTemplate>
                        <ItemTemplate>
                            <b>
                                <%#Eval("ProductName") %></b>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Ảnh mô tả
                        </HeaderTemplate>
                        <ItemTemplate>
                            <img alt="ảnh mô tả" src="/Upload/<%#Eval("ProductImage") %>" width="60" height="60" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Giá
                        </HeaderTemplate>
                        <ItemTemplate>
                            <%#Common.Util.DecimalObjectToString(Eval("ProductPrice")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Số lượng
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:TextBox ID="cart" runat="server" Text='<%#Eval("Quanity") %>' Width="50px" MaxLength="2"
                                ClientIDMode="Static"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Thao tác
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkUpdate" runat="server" CausesValidation="True" CommandArgument='<%#Eval("ProductID") %>'
                                CommandName="Update" Text=" Lưu "></asp:LinkButton>
                            &nbsp;
                            <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="True" CommandArgument='<%#Eval("ProductID") %>'
                                CommandName="Delete" Text=" Xóa "></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <p style="text-align: right; margin-right: 50px; font-size: 13px; font-weight: bold;
                margin-top: 10px;">
                Tổng tiền :
                <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label><br />
                Thành tiền :
                <asp:Label ID="lblTotalText" runat="server" Text=""></asp:Label>
            </p>
            <div style="color: white;" runat="server" id="buy">
                <p style="color: white; font-weight: bold; font-size: 13px; text-align: center; margin-top: 25px;
                    margin-bottom: 18px;">
                    Quý khách vui lòng nhập đầy đủ thông tin sau đây để chúng tôi liên hệ và giao hàng
                    đúng yêu cầu.</p>
                <table style="height: 250px; margin-left: 80px; margin-bottom: 6px;">
                    <tr>
                        <td style="width: 110px;">
                            Tên khách hàng
                        </td>
                        <td>
                            <asp:TextBox ID="txtName" runat="server" Height="22px" Width="411px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
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
                        <td>
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
        </div>
    </div>
</div>
<div id="contentrighttwrapcontent">
    <table>
        <tr>
            <td>
                <uc6:LinkFacebooks ID="LinkFacebooks1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <uc7:ProductRight ID="ProductRight1" runat="server" />
            </td>
        </tr>
    </table>
</div>
