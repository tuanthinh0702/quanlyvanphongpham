<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductCategoryR.ascx.cs" Inherits="Musicviet.Control.ProductCategoryR" %>
 <div class="facebooksnews" style="margin-top: 20px;">
           <div class="textringt" style="width: 212px;"><span>Sản phẩm</span></div>
                    <div class="glossymenu">
                       <asp:Repeater ID="rptCategoryProducts" runat="server" OnItemDataBound="rptCategory_ItemDataBound"> 
                          <ItemTemplate>
                           <a class="menuitem submenuheader"  href="<%#GenerateURL(Eval("CategoryName"),Eval("CategoryID")) %>"><span>+&nbsp;<%#CatChuoi(Eval("CategoryName"),10)%></span> </a>
                             <div class="submenu"><ul style="margin-bottom: -5px;">
                                    <asp:Repeater ID="rptMenu" runat="server">
                                      <ItemTemplate>
                                         <li style="border-bottom: none;height:10px;height:10px;"><a href="<%#GenerateURL(Eval("CategoryName"),Eval("CategoryID")) %>"><span> <span style="font-size: 8px; padding-left: 10px; padding-right: 8px;">-</span><%#CatChuoi(Eval("CategoryName"),10)%></span> </a></li>
                                      </ItemTemplate>
                                    </asp:Repeater>
                                 </ul></div>
                            </ItemTemplate>
                       </asp:Repeater>
                   </div>
 </div>