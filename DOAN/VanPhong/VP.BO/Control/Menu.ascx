<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Menu.ascx.cs" Inherits="Musicviet.Control.Menu" %>
       <div id="menu">
            <ul id="nav">
                <li><a href="/Trang-chu.htm" id="Home"><span>Trang chủ</span></a></li>
                <li><a href="/Gioi-thieu.htm" id="About"><span>Giới thiệu</span></a> </li>
                <li id="product"><a href="#"><span>Sản phẩm</span></a>
       
                <ul>
                       <asp:Repeater ID="rptCategoryProducts" runat="server" OnItemDataBound="rptCategory_ItemDataBound"> 
                          <ItemTemplate>
								<li><a href="<%#GenerateURL(Eval("CategoryName"),Eval("CategoryID")) %>"><%#CatChuoi(Eval("CategoryName"),10)%></a>
									<ul>
									    <asp:Repeater ID="rptMenu" runat="server">
                                      <ItemTemplate>
										<li><a href="<%#GenerateURL(Eval("CategoryName"),Eval("CategoryID")) %>"><%#CatChuoi(Eval("CategoryName"),10)%></a></li>
									 </ItemTemplate>
                                    </asp:Repeater>
									</ul>
								</li>
								    </ItemTemplate>
                       </asp:Repeater>
							</ul>
                 </li>
                <li><a href="/Tin-Tuc.htm" id="News"><span>Tin tức</span></a></li>
                <li><a href="/Lien-he.htm" id="Contact"><span>Liên hệ</span></a> </li>
            </ul>
   
        </div>
  <div class="divmenubrackground"> </div>   