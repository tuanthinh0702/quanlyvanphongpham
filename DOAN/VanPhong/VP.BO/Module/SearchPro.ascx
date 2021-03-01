<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchPro.ascx.cs" Inherits="Musicviet.Module.SearchPro" %>
<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
 <script language="javascript" type="text/javascript">
     document.getElementById("idbody").className = "sub-page";
</script>
<div id="wrapper" class="mainContent">
    <div id="promotionBanner" class="category-promotion"></div>
    <div id="siteMap" class="site-map">
        Tìm kiếm &raquo; Sản phẩm 
    </div>
    <div class="main-container clearfix">
        <div class="side-bar">
            <h3>Tìm theo</h3>
            <ul id="categoryMenu" class="module-filter">
                <li><a href="#">Tất cả</a></li>
                <asp:Repeater runat="server" ID="rptCategory">
                    <ItemTemplate>
                      <li class="">
                          <a href="<%#GenerateCateURL(Eval("CategoryID"),Eval("CategoryName")) %>" title="<%#Eval("CategoryName") %>"><%#CatChuoi(Eval("CategoryName"), 8)%></a>
                      </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
            <div class="module-promotion">
                <img src="http://www.halica.vn/resources/img/panel_small2.jpg" width="228" height="205" alt="Promotion" />
            </div>
        </div>

        <div id="productContent" class="primary-content">
            <div class="category-title-content">
             
            </div>
            <div class="pgn-tools  clearfix">
                 <div class="tools-paging">
                  <span style="font-weight: bold;">Kết quả</span>
                 </div>
                 <div class="tools-viewType">
                    <span>Yêu thích</span>
                    <asp:DropDownList runat="server" ID="ddlSort"  AutoPostBack="True"
                        onselectedindexchanged="ddlSort_SelectedIndexChanged">
                        <asp:ListItem Value="0">Mới nhất</asp:ListItem>
                        <asp:ListItem Value="1">Cũ nhất</asp:ListItem>
                        <asp:ListItem Value="2">Giá thấp</asp:ListItem>
                        <asp:ListItem Value="3">Giá cao</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="listItems sub-list clearfix">
                 <asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                <asp:Repeater runat="server" ID="rptProductbycate">
                    <ItemTemplate>
                         <div class="proItem">
                        <a href="<%#GenerateURL(Eval("ProductName"),Eval("ProductID"))%>" title='<%#Eval("ProductName")%>' class="proImg">
                            <img src="<%=imagePath %><%#Eval("ProductImage") %>" width="165" height="150" alt="<%#Eval("ProductName")%>"/>
                        </a>
                        <h2>
                            <a href="<%#GenerateURL(Eval("ProductName"),Eval("ProductID"))%>" title='<%#Eval("ProductName")%>'><%#CatChuoi(Eval("ProductName"), 4)%></a>
                        </h2>
                         <%#Getprice(Eval("ProductPrice"),Eval("Discount"))%>
                        <div class="proBtn">
                            <a href="<%#GenerateURL(Eval("ProductName"),Eval("ProductID"))%>" title='<%#Eval("ProductName")%>' class="btn viewpro">Xem</a>
                        </div>
                          <%#BinPercent(Eval("ProductPrice"), Eval("Discount"))%>  
                     </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="pgn-tools last clearfix">
                <div class="tools-paging">
                     <cc1:CollectionPager ID="clpNews" PagingMode="PostBack" FirstText="Đầu" LastText="Cuối" BackText="« Trước &amp;nbsp;"
                       BackNextLinkSeparator="" BackNextLocation="Split" PageNumbersDisplay="Numbers"
                       ShowFirstLast="True" NextText=" &amp;nbsp; Sau »" LabelText="" runat="server"
                       ResultsLocation="None" QueryStringKey="page">
                    </cc1:CollectionPager>
                </div>
            </div>
        </div>
    </div>
</div>
