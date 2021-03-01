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
                                <%#Eval("Name") %></b>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Ảnh mô tả
                        </HeaderTemplate>
                        <ItemTemplate>
                            <img alt="ảnh mô tả" src="/Upload/<%#Eval("ImgPath") %>" width="60"/>
                        </ItemTemplate>
                        <ItemStyle  HorizontalAlign="Center"/>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Giá
                        </HeaderTemplate>
                        <ItemTemplate>
                            <%#Common.Util.DecimalObjectToString(Eval("Price")) %>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                 </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Số lượng
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:TextBox ID="cart" runat="server" Text='<%#Eval("Quantity") %>' Width="50px" MaxLength="2"
                                ClientIDMode="Static" style="text-align:center;"></asp:TextBox>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
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
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    Giỏ hàng của bạn hiện không có sản phẩm nào
                </EmptyDataTemplate>
            </asp:GridView>  

            <p style="text-align: right; margin-right: 50px; font-size: 13px; font-weight: bold;
           
                margin-top: 10px;" runat="server" id="totx">
                Tổng tiền :
                <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label><br />
                Thành tiền :
                <asp:Label ID="lblTotalText" runat="server" Text="" ForeColor="Red"></asp:Label>
            </p><br />
            <div class="nutdathang"><p style="text-align:center;"> <a href="/Trang-chu.htm">
             <input type="button" value="Mua tiếp"  /></a> &nbsp; &nbsp; &nbsp;
             <asp:Button ID="btnbuy" runat="server" Text="Thanh toán" style="width:89px;" 
                    onclick="btnbuy_Click"/></p> </div>
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
