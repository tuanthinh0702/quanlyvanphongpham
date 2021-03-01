<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Modules.ascx.cs" Inherits="Musicviet.Module.Modules" %>
<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
 <%@ Register Src="../Control/LinkContent.ascx" TagName="LinkContent" TagPrefix="uc5" %>
 <%@ Register Src="../Control/LinkFacebooks.ascx" TagName="LinkFacebooks" TagPrefix="uc6" %>
 <%@ Register Src="../Control/ProductRight.ascx" TagName="ProductRight" TagPrefix="uc7" %>
 <%@ Register Src="../Control/NewsRight.ascx" TagName="NewsRight" TagPrefix="uc8" %>
<%@ Register Src="../Control/ProductCategoryR.ascx" TagName="ProductCategoryR" TagPrefix="uc10" %>
  <div id="contentleft">
   <div id="contentleftwrapcontent">
     <div class="textnews">
        <span>Sản phẩm 
            <asp:Literal ID="Label1" runat="server"></asp:Literal></span>
             <div id="shares">
                        <a rel="nofollow" style="text-decoration: none;" href="http://www.yahoo.com/" onclick="window.open('http://bookmarks.yahoo.com/myresults/bookmarklet?t='+document.title+'&amp;d='+document.Description+'&amp;tag=&amp;u='+location.href);return false;"
                            title="Chia sẻ với Yahoo">
                            <img border="0" style="padding-bottom: 1px;" src="img/ico_yahoo.png" name="Yahoo"
                                id="Yahoo">
                        </a><a rel="nofollow" style="text-decoration: none;" href="http://www.google.com/"
                            onclick="window.open('http://www.google.com/bookmarks/mark?op=add&amp;hl=vi&amp;bkmk='+encodeURIComponent(location.href)+'&amp;annotation='+encodeURIComponent(document.Description)+'&amp;labels=&amp;title='+encodeURIComponent(document.title));return false;"
                            title="Chia sẻ với Google Plus">
                            <img border="0" style="padding-bottom: 1px;" src="img/ico_google.png" name="Google"
                                id="Google">
                        </a><a rel="nofollow" style="text-decoration: none;" href="http://www.myspace.com/"
                            onclick="window.open('http://www.myspace.com/Modules/PostTo/Pages/?u='+encodeURIComponent(location.href)+'&amp;annotation='+encodeURIComponent(document.Description)+'&amp;labels=&amp;title='+encodeURIComponent(document.title));return false;"
                            title="Chia sẻ với Myspace">
                            <img border="0" style="padding-bottom: 1px;" src="img/ico_space.png" name="MySpace"
                                id="MySpace">
                        </a><a rel="nofollow" style="text-decoration: none;" href="http://www.twitter.com/"
                            onclick="window.open('http://twitter.com/home?status='+encodeURIComponent(location.href)+'&amp;t='+encodeURIComponent(document.title));return false;"
                            title="Chia sẻ với Twitter">
                            <img border="0" style="padding-bottom: 1px;" src="img/ico_twitter.png" name="Twitter"
                                id="Twitter">
                        </a><a rel="nofollow" style="text-decoration: none;" href="http://www.facebook.com/"
                            onclick="window.open('http://www.facebook.com/sharer.php?u='+encodeURIComponent(location.href)+'&amp;t='+encodeURIComponent(document.title));return false;"
                            title="Chia sẻ với Facebook">
                            <img border="0" style="padding-bottom: 1px;" src="img/ico_facebook.png" name="Facebook"
                                id="Facebook">
                        </a>
                    </div>
    </div>
     <ul style="margin-left: 12px; margin-bottom: 10px; margin-top: -18px; margin-left: 18px;" id="onePro" Visible="False" runat="server">
         <asp:Repeater ID="rptProductOne" runat="server">
                     <ItemTemplate>
                <li>
                     <div class="productwrapcontent" style="margin-right: 5px;">
                        <div class="detailproduct">
                            <div class="img">
                                <a href="<%#GenerateURL(Eval("ProductName"),Eval("ProductId")) %>">
                                <img src='/Upload/<%#Eval("ProductImage") %>' alt="<%#Eval("ProductName") %>" width="160" /></a>
                            </div>
                        <div style="padding: 7px; color: white; font-weight: bold"> <a href="<%#GenerateURL(Eval("ProductName"),Eval("ProductId")) %>"><%#CatChuoi(Eval("ProductName"),35) %></a> <br/>Giá : <%#Common.Util.DecimalObjectToString(Eval("ProductPrice"))%> vnđ</div>
                            <div class="btnbuttom" style="margin-left: 0px;">
                              <a href="<%#GenerateURL(Eval("ProductName"),Eval("ProductId")) %>"><input type="button" class="btnDetails" value="Chi Tiết" /></a> &nbsp;&nbsp;<a href="<%#GenerateUrlCart(Eval("ProductName"),Eval("ProductId")) %>"><input type="button" class="btnbuy" value="Đặt hàng"/></a></div>
                        </div>
                    </div>
                   
                </li>
            </ItemTemplate>
        </asp:Repeater>
     </ul>
     <div style="padding-left: 15px; float:left;">
                         <cc1:CollectionPager ID="clpNews" FirstText="Đầu" LastText="Cuối" BackText="« Trước &amp;nbsp;"
                            BackNextLinkSeparator="" BackNextLocation="Split" PageNumbersDisplay="Numbers"
                            ShowFirstLast="True" NextText=" &amp;nbsp; Sau »" LabelText="" runat="server"
                            ResultsLocation="None">
                          </cc1:CollectionPager>
                        </div>
     <div style="padding: 5px;">
                            <asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                        </div>
     <div id="sapxep" runat="server" ClientIDMode="Static" Visible="False">Sắp xếp sản phẩm - 
                            <asp:DropDownList ID="ddlSort" runat="server" 
                                onselectedindexchanged="ddlSort_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem Value="0">- Lựa chọn -</asp:ListItem>
                                <asp:ListItem Value="1">Giá tăng dần</asp:ListItem>
                                <asp:ListItem Value="2">Giá giảm dần</asp:ListItem>
                            </asp:DropDownList>
                        </div>
  </div>
    <uc5:LinkContent  ID="LinkContent1" runat="server" />
 </div>
<!--endcontentleftwrapcontent-->
<div id="contentrighttwrapcontent">
    <table>
        <tr>
              <td><uc10:ProductCategoryR ID="ProductCategoryR1" runat="server"/></td>
        </tr>
        <tr>
            <td><uc7:ProductRight ID="ProductRight1" runat="server"/></td>
        </tr>
        <tr>
          <td><uc8:NewsRight ID="NewsRight1" runat="server"/></td>
        </tr>
    </table>
        
          
          
</div>
