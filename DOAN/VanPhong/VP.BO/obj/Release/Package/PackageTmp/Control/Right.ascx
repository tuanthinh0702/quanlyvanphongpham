<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Right.ascx.cs" Inherits="Musicviet.Control.Right" %>
  <div id="contentrighttwrapcontent">
    <%--  category--%>
          <div class="facebooksnews">
           <div class="textringt" style="width: 212px;"><span>Sản phẩm</span></div>
                    <ul>
                       <asp:Repeater ID="rptCategoryProducts" runat="server" OnItemDataBound="rptCategory_ItemDataBound"> 
                          <ItemTemplate>
                           <li style="border-bottom: none;list-style: none outside none;padding-top: 10px; width: 95%;height:10px;"><a href="Default.aspx?Module=Product&CategoryID=<%#Eval("CategoryID") %>"><span>&nbsp;<%#CatChuoi(Eval("CategoryName"),10)%></span> </a>
                                 <ul>
                                    <asp:Repeater ID="rptMenu" runat="server">
                                      <ItemTemplate>
                                         <li style="border-bottom: none;height:10px;height:10px;"><a href="Default.aspx?Module=Product&CategoryID=<%#Eval("CategoryID") %>"><span>&nbsp;&nbsp;&nbsp; <%#CatChuoi(Eval("CategoryName"),10)%></span> </a></li>
                                      </ItemTemplate>
                                    </asp:Repeater>
                                 </ul>
                            </li>
                         </ItemTemplate>
                       </asp:Repeater>
                    </ul>
           </div><!--endfacebook news-->
           <div class="facebooksnews">
            <div class="textringt" style="width: 212px;"><span>Tin tức</span></div>
                    <div style=" clear:both;"></div>
                        <ul style="margin-bottom: 15px;">
                           <asp:Repeater ID="dtlcategoryNews" runat="server">
                             <ItemTemplate>
                                <li style=" border-bottom: none;height:10px;"><a href="Default.aspx?Module=News&CategoryID=<%#Eval("CategoryID") %>"><span>&nbsp;&nbsp;&nbsp; <%#CatChuoi(Eval("CategoryName"),10)%></span> </a></li>
                             </ItemTemplate>
                           </asp:Repeater>
                    </ul>
            </div><!--endfacebook news-->
    <%--        <div class="facebooksnews">
                <div class="textringt" style="width: 212px;"><span>MusicViet trên facebook</span></div>
                <div class="contentnews" style="color: white;">
                   <%-- <img src="images/facebook.png" alt="facebook" style="width: 211px;">--%>
                   <%--<div class="fb-like-box" data-href=" http://www.facebook.com/thanhnam.nhaccu" data-width="210" data-height="190" data-show-faces="true" data-stream="false" data-header="false"></div>
                </div>
            </div><!--endfacebook news-->--%>

            <div class="facebooksnews">
                <div class="textringt"><span>Tin trong ngày</span></div>
                <div class="contentnews">
                    <ul>
                     <asp:DataList ID="dtlTopNews" runat="server">
                     <ItemTemplate>
                        <li style="width:214px;"><a href="Default.aspx?Module=NewsDetail&NewsID=<%#Eval("NewsID") %>"><img style=" float:left; " src='/Upload/<%#Eval("ImagePath") %>'  alt="img tin tuc" width="52px" height="52px"> <p><%#CatChuoi(Eval("Title"), 10)%></p></a></li>
                     </ItemTemplate>
                     </asp:DataList>
                    </ul>
                </div>
            </div><!--endfacebook news-->

            <div class="facebooksnews"  style="height: 272px!important;overflow: hidden;" >
                <div class="textringt"><span>Sản phẩm tiêu biểu</span></div>
                <div class="contentnews">
                    <div class=randomPost1>
                        <ul id="postItem">
                        <asp:DataList ID="dtlselectproductright" runat="server">
                           <ItemTemplate>
                              <li class="post-1" style="border-bottom:none;width:214px;"> <a href="Default.aspx?module=ProductDetail&id=<%#Eval("ProductId") %>"><img style=" float:left; "  height="47px" border="0" width="67px" src='/Upload/<%#Eval("ProductImage") %>' alt="<%#Eval("ProductName")%>"><p><%#CatChuoi(Eval("ProductName"), 10)%></p> </a></li>
                           </ItemTemplate>
                        </asp:DataList>
                        </ul>
                    </div>
                </div>
            </div><!--endproductnew-->

            <%--<div class="facebooksnews">
                <div class="textringt"><span>Website-Liên kết</span></div>
                <div class="contentnews">
                </div>
            </div><!--endlinknews>-->--%>

   </div><!--endcontentrighttwrapcontent-->