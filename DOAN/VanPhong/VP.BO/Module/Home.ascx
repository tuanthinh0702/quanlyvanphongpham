<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Home.ascx.cs" Inherits="Musicviet.Module.Home" %>
<%@ Register src="~/Control/Slider.ascx" tagName="Slider"  tagPrefix="uc3"%>
<%@ Register src="~/Control/LinkContent.ascx" tagName="LinkContent" tagPrefix="uc4" %>
<%@ Register src="~/Control/ProductTop.ascx" tagName="ProductTop" tagPrefix="uc5" %>
<div id="wrapper" class="mainContent">
    <uc3:Slider ID="Slider1" runat="server"/>
    <uc4:LinkContent ID="LinkContent1" runat="server" />
    <uc5:ProductTop ID="ProductTop1" runat="server"/>
<%--san pham binh thuong ---%>

    <div id="listCatePro">
      <asp:Repeater runat="server" ID="rptcatehome"  onitemdatabound="rptcatehome_ItemDataBound">
        <ItemTemplate>
         <div class="listPro">
           <div class="titlePro">
                  <h4>
                      <a href='<%#GenerateCateURL(Eval("CategoryName"),Eval("CategoryID"))%>' title='<%#Eval("CategoryName")%>'><%#CatChuoi(Eval("CategoryName"),5) %></a>
                  </h4>
                  <a href="<%# GenerateCateURL(Eval("CategoryName"),Eval("CategoryID"))%>">Xem thêm &raquo;</a>
            </div>
            <div class="listItems clearfix">
                <asp:Repeater runat="server" ID="rptproductbycate">
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
                          <%#BinPercent(Eval("ProductPrice"), Eval("Discount"))%>  <span class='iconProHot'></span>
                     </div>
                   </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
      </ItemTemplate>
     </asp:Repeater>
   </div>
</div>

<!--endcontent-center-->