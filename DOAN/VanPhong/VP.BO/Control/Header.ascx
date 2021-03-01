<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="Musicviet.Control.Header" %>
<header id="header">
    
<div class="mainContent">
<%-- /*menu*/   --%>
<div class="headerNav">
    <ul class="navLinks clearfix">
        <li> <a href="/Trang-chu.htm">Trang chủ</a></li>
        <li><a href="/Tin-Tuc.htm" title="tin tức">Tin tức</a></li>
        <asp:Repeater runat="server" ID="rptsever">
         <ItemTemplate>
             <li><a href="<%#GenerateServerURL(Eval("NewsID"),Eval("Title")) %>" title="<%#Eval("Title") %>"><%#Eval("Title")%></a></li>
         </ItemTemplate>   
        </asp:Repeater>
        <li><div id="cart-id"><a href="/Chi-tiet-gio-hang.htm" id="shopping">Giỏ hàng: (<asp:Label runat="server" ID="numbercart" Text="0" ClientIDMode="Static" CssClass="munbercount"></asp:Label>)</a></div></li> 
    </ul>
</div>

<%--/*support*/--%>
<div class="logo-support clearfix">
    <div style="float: left;margin-left: 10px; margin-right: 60px;">
      <a href="/Trang-chu.htm" class="logotrienlong">
        <img src="<%=imagePath %><%=logo %>" alt="trienlong"  width="150px"/>
      </a>
    </div>
    <div style="float:right;margin-left: 10px;margin-right: 10px;margin-top: 10px;"><span>Hotline: <asp:Label runat="server" ID="lblHotline" ForeColor="Red" Font-Bold="True"></asp:Label></span></div>
    <div class="supporter clearfix">
        <asp:Repeater runat="server" ID="rptSupport">
            <ItemTemplate>
                 <div class="support-yahoo clearfix">
                    
                    <%#GetSupport(Int32.Parse(Eval("Type").ToString().Trim()), Eval("Yahoo").ToString())%>
                   <p class="yahoo-infor"><span><%#Eval("Title") %></span></p>
                 </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>

<%--/*menuleft*/--%>
<div class="nav-search clearfix">
    
<nav class="pageNav" id="pageNaviagtor">
<a href="#" class="navAll">Tất cả</a>
<ul class="navi">
<asp:Repeater runat="server" ID="rptcate" OnItemDataBound="rptcate_OnItemDataBound">
    <ItemTemplate>
   <li class="multiMenu mucbot ">
      <a href="<%#GenerateURL(Eval("CategoryID"),Eval("CategoryName")) %>" title="<%#Eval("CategoryName") %>"><%#CatChuoi(Eval("CategoryName"), 8)%></a>
       <div class="innerNav clearfix">
                  <div class="contentSubCate clearfix">
                      <asp:Repeater runat="server" ID="rptSubCate" OnItemDataBound="rptSubCate_OnItemDataBound">
                          <ItemTemplate>
                             <div class="subCate">
                             <a href="<%#GenerateURL(Eval("CategoryID"),Eval("CategoryName")) %>" title="<%#Eval("CategoryName") %>"><%#CatChuoi(Eval("CategoryName"), 8)%></a>
                             <div class="subContent">
                               <ul>
                                  <asp:Repeater runat="server" ID="subContent">
                                      <ItemTemplate>
                                          <li><a href="<%#GenerateURL(Eval("CategoryID"),Eval("CategoryName")) %>" title="<%#Eval("CategoryName") %>"><%#CatChuoi(Eval("CategoryName"), 8)%></a></li>
                                      </ItemTemplate>
                                  </asp:Repeater>
                                </ul>
                             </div>
                             </div>                
                          </ItemTemplate>
                      </asp:Repeater>
                  </div>
                  <div class="subCate bgPromote">
                      <img src="<%=imagePath%><%#Eval("LongDescription")%>" alt="<%#Eval("CategoryName")%>" />
                      <a href="<%#GenerateURL(Eval("CategoryID"),Eval("CategoryName")) %>" title="<%#Eval("CategoryName") %>">Xem tất cả &raquo;</a>
                  </div>
            </div>
  </li>
        
    </ItemTemplate>
</asp:Repeater>
  <li class="bgNavi">
     <img src="img/contactus.jpg" width="167" height="157" />
  </li>
</ul>
</nav>

<%--/*SEARCH*/--%>
  <div class="searchTool">
                  <span class="iconSearch"></span>
                  <asp:TextBox type="text" ID="txtSearchPro" class="textSearch"  runat="server"/>
                   <asp:DropDownList ID="DropDownList1" runat="server" CssClass="okeser"> 
                       <asp:ListItem Value="0">Tên sản phẩm</asp:ListItem>  
                       <asp:ListItem  Value="1">Mã sản phẩm</asp:ListItem>                                   
                  </asp:DropDownList>
                 <%-- <a href="javascript:void(0);" id="btnSearchPro" class="btn btnSearch">Tìm kiếm</a>--%>
                  <asp:Button ID="btnSearchPro" runat="server" CssClass="btn btnSearch" Text="Tìm kiếm" 
                    onclick="btnSearchPro_Click" ValidationGroup="srch" />
   </div>
                  
<%--buy cart--%>
  <div class="shopCart"></div>

</div>
</div>  
</header>