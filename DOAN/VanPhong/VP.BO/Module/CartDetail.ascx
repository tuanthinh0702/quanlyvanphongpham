<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CartDetail.ascx.cs" Inherits="Musicviet.Module.CartDetail" %>
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
         <div class="article-wrap"><h2>Chi tiết giỏ hàng</h2>
             <div class="article-content">
                 <br />
                 <br />
              <asp:GridView ID="grvOrder" ClientIDMode="Static" runat="server" CssClass="dataTable"
                AutoGenerateColumns="False" OnRowCommand="grvOrder_RowCommand" OnRowUpdating="grvOrder_RowUpdating"
                OnRowDeleting="grvOrder_RowDeleting" Width="100%">
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
    </div>
</div>