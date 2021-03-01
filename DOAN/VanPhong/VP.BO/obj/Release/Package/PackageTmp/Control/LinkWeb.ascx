<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LinkWeb.ascx.cs" Inherits="Musicviet.Module.LinkWeb" %>
 <div id="linkwrapcontent" style="width: 935px; float: left;height: 290px;">
            <span>SẢM PHẨM MỚI</span>
            <div id="linkleftwrapcontent" style="padding-left:5px;">
            <%--<div class="silderlinkwrapcontent" style="overflow: hidden;position: relative; display: block; margin-top: 0px; padding: 0px; height: 214px; width: 697px; overflow:hidden;">
               <ul id="mycarouselpartner">
                    <asp:Repeater ID="dtlLink" runat="server">
                        <ItemTemplate>
                              <li jcarouselindex="1" style="float: left; list-style: none outside none; margin:0px 5px;" class="jcarousel-item jcarousel-item-horizontal jcarousel-item-7 jcarousel-item-7-horizontal">
                                <a href='<%#Eval("Link") %>' target="_blank"> <img src='/Upload/<%#Eval("LinkImage") %>' class="attachment-post-thumbnail wp-post-image" alt="no-img" title="dow" height="179" width="179"></a>
                         </li>
                        </ItemTemplate>
                    </asp:Repeater>
                   </ul>
            </div>--%>
            <ul class="product-new">
            <asp:Repeater ID="rptProNew" runat="server">
            <ItemTemplate>
             <li>
            <div class="img-new"><a href="Default.aspx?module=ProductDetail&id=<%#Eval("ProductId") %>"><img src='/Upload/<%#Eval("ProductImage") %>' alt="<%#Eval("ProductName") %>" width="160" /></a></div>
            <div style="padding: 7px; color: white; font-weight: bold; height:32px;"><a href="Default.aspx?module=ProductDetail&id=<%#Eval("ProductId") %>">
                                        <%#CatChuoi(Eval("ProductName"),35) %></a>
                                    <br>
                                    <%#Common.Util.DecimalObjectToString(Eval("ProductPrice"))%> vnđ</div>
            </li>
            </ItemTemplate>
            </asp:Repeater>
           
            </ul>
            </div>
            <div id="linkrightwrapcontent" class="xz" style="position: relative; float: right; right: 208px;;">
            <div class="divF"><div class="fb-like-box" data-href="http://www.facebook.com/pages/Th%C3%A0nh-Nam/510841235595140" data-width="240" data-height="258" data-show-faces="true" data-stream="false" data-show-border="false" data-header="true"></div></div>
            </div>
               <div style="clear: both;">
        </div>
        </div>

