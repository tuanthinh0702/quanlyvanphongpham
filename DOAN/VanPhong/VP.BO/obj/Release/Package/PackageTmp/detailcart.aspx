<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="detailcart.aspx.cs" Inherits="Musicviet.detailcart" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href='http://localhost:1740/css/reset.Css'/>
     <link rel="stylesheet" type="text/css" href="http://localhost:1740/css/style.Css"/>
     <script type="text/javascript" src="http://localhost:1740/js/jquery-1.7.2.min.js"></script>
     <script src="http://localhost:1740/js/jquery.colorbox.js" type="text/javascript"></script>
     <style>
        table#grvOrder
        {
            width: 600px;
            margin-left: 10px;
            border: 1px solid #d2d2d2;
        }
        table#grvOrder tr td, tbody th
        {
            vertical-align: middle;
            border: 1px solid #d2d2d2;
            text-align: center;
        }
        #grvOrder tbody th
        {
            font-weight: bold;
            font-size: 14px;
            height: 32px;
        }
         #grvOrder a
         {
             color:Blue;
         }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width:600px; margin:auto 0; padding-top:10px;">
    <div style="height:360px;width:640px; overflow:auto;">
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
               </div>
            <p style="text-align: right; margin-right: 50px; font-size: 13px; font-weight: bold;
           
                margin-top: 10px;" runat="server" id="totx">
                Tổng tiền :
                <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label><br />
                Thành tiền :
                <asp:Label ID="lblTotalText" runat="server" Text=""></asp:Label>
            </p><br />
            <p style="text-align:center;"> <a href="San-pham.htm">
                                <input type="button" value="Mua tiếp" class="btnbuy" /></a> &nbsp; &nbsp; &nbsp;
                         <asp:Button ID="Button1" runat="server" Text="Thanh toán" CssClass="btnbuy" OnClientClick="Redirect();" style="width:89px;"/></p> 
    </div>
    </form>
    <script language="javascript">
        function Redirect() {
            parent.$.fn.colorbox.close();
            parent.window.location = "default.aspx?module=PayConfirm";
    }
    </script>
</body>
</html>
