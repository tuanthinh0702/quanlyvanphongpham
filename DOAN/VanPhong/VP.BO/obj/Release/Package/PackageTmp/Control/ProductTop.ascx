<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductTop.ascx.cs" Inherits="Musicviet.Control.ProductTop" %>
<%--sam pham ban chay nhat--%>

    <div id="dProTopSale" class="listPro hotPro">
        <div class="titlePro"><h4>Bán chạy nhất</h4></div>
        <div class="listItems clearfix">
            <asp:Repeater runat="server" ID="rptproducttop">
                <ItemTemplate>
                     <div class="proItem">
                        <a href="<%#GenerateURL(Eval("ProductName"),Eval("ProductID"))%>" title='<%#Eval("ProductName")%>' class="proImg">
                            <img src="<%=imagePath %><%#Eval("ProductImage") %>" width="165" height="150" alt="<%#Eval("ProductName")%>"/>
                        </a>
                        <h2>
                            <a href="<%#GenerateURL(Eval("ProductName"),Eval("ProductID"))%>" title='<%#Eval("ProductName")%>'><%#CatChuoi(Eval("ProductName"),4)%></a>
                        </h2>
                         <%#Getprice(Eval("ProductPrice"),Eval("Discount"))%>
                        <div class="proBtn">
                            <a href="<%#GenerateURL(Eval("ProductName"),Eval("ProductID"))%>" title='<%#Eval("ProductName")%>' class="btn viewpro">Xem</a>
                        </div>
                          <%#BinPercent(Eval("ProductPrice"), Eval("Discount"))%>  <span class='iconProHot'></span>
                     </div>
                </ItemTemplate>
            </asp:Repeater>
          
        </div>
    </div>