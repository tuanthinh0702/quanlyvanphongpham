<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SeverDetail.ascx.cs" Inherits="Musicviet.Module.SeverDetail" %>
<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
 <%@ Register Src="~/Control/LinkContent.ascx" TagName="LinkContent" TagPrefix="uc5" %>
 <%@ Register Src="../Control/LinkFacebooks.ascx" TagName="LinkFacebooks" TagPrefix="uc6" %>
 <%@ Register Src="../Control/ProductRight.ascx" TagName="ProductRight" TagPrefix="uc7" %>
 <%@ Register Src="../Control/NewsRight.ascx" TagName="NewsRight" TagPrefix="uc8" %>
 <%@ Register Src="../Control/NewsCategoryR.ascx"  TagName="NewsCategoryR" TagPrefix="uc9"%>
 <%@ Register Src="../Control/ProductCategoryR.ascx" TagName="ProductCategoryR" TagPrefix="uc10" %>
  <div id="contentleft">
   <div id="contentleftwrapcontent">
    <div class="textnews">
        <span>Sản phẩm >> nhạc cụ âm thanh 
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
    <ul>
        <asp:Repeater ID="rptCate" runat="server" onitemdatabound="rptCate_ItemDataBound">
            <ItemTemplate>
         <asp:HiddenField runat="server" ID="hdCateId" Value='<%#Eval("CategoryID") %>'/>
                 <asp:Repeater ID="rptProduct" runat="server">
                     <ItemTemplate>
                <li>
                     <div class="productwrapcontent">
                        <div class="detailproduct">
                            <a href="#">
                                <img src='/Upload/<%#Eval("ProductImage") %>' alt="<%#Eval("ProductName") %>" width="160" />
                                <br />
                                <span><%#Eval("ProductName") %></span></a>
                            <div class="btnbuttom">
                              <a href="Default.aspx?module=ProductDetail&id=<%#Eval("ProductId") %>"><input type="button" class="btnDetails" value="Chi Tiết" /></a> &nbsp;&nbsp;<a href="Default.aspx?module=Cart&id=<%#Eval("ProductId") %>"><input type="button" class="btnbuy" value="Đặt hàng"/></a></div>
                        </div>
                    </div>
                   
                </li>
            </ItemTemplate>
        </asp:Repeater>
            </ItemTemplate>
        </asp:Repeater>
       
        <li class="details" style="width:100%; height: 15px;">
            <div>
                <span>
                    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Trang trước</asp:LinkButton> &nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">Trang sau</asp:LinkButton></span>
            </div>
        </li>
    </ul>
    </div>
    <uc5:LinkContent  ID="LinkContent1" runat="server" />
 </div>
<!--endcontentleftwrapcontent-->
<div id="contentrighttwrapcontent">
    <table>
        <tr><td> <uc10:ProductCategoryR ID="ProductCategoryR1" runat="server"/></td></tr>
        <tr><td>   <uc7:ProductRight ID="ProductRight1" runat="server"/></td></tr>
        <tr><td> <uc8:NewsRight ID="NewsRight1" runat="server"/></td></tr>
    </table>
     
</div>
