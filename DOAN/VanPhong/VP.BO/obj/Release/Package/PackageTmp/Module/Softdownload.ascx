<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Softdownload.ascx.cs" Inherits="Musicviet.Module.Softdownload" %>
<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
 <%@ Register Src="~/Control/LinkContent.ascx" TagName="LinkContent" TagPrefix="uc5" %>
 <%@ Register Src="../Control/LinkFacebooks.ascx" TagName="LinkFacebooks" TagPrefix="uc6" %>
 <%@ Register Src="../Control/ProductRight.ascx" TagName="ProductRight" TagPrefix="uc7" %>
 <%@ Register Src="../Control/NewsRight.ascx" TagName="NewsRight" TagPrefix="uc8" %>
 <%@ Register Src="~/Control/SoftDownloadCategory.ascx" TagName="SoftDownloadCategory"  TagPrefix="uc11"%>
<div id="contentleft">
      <div id="contentleftwrapcontent">
            <div class="textnews"><span>Sản phẩm » Phần mềm âm nhạc  </span>
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
            <asp:DataList ID="dtlallSoftdow" runat="server">
              <ItemTemplate>
                 <li style="margin: 0">
                    <div class="news" style="border-bottom:1px dotted #CCCCCC ">
                        <div class="detailnews" style="border:0px; margin-left: 3px; width: 645px; overflow: hidden;">
                            <a href="<%#GenerateURL(Eval("Title"),Eval("NewsID")) %>"><img src='/Upload/<%#Eval("ImagePath") %>' alt="news1"/>
                                <span><%#CatChuoi(Eval("Title"), 10)%></span></a>
                            <br/>
                            <br/>
                             <span>
                                   <%#CatChuoi(Eval("Summary"),50)%>
                             </span>
                            <div class="btnbuttom" style="float:right; margin-top:20px;">
                           <a href="<%#GenerateURL(Eval("Title"),Eval("NewsID")) %>"><input type="button" class="btnbuy" value="Chi Tiết"/></a>&nbsp;&nbsp;&nbsp;&nbsp;
                             <a href="<%#!string.IsNullOrEmpty(Eval("IconPath").ToString())?"/Upload/"+Eval("IconPath"):"#" %>"><input type="button" class="btnbuy" value="Tải về"/></a>
                        </div>
                    </div>
                </li>
              </ItemTemplate>
            </asp:DataList>
                <li class="details">
                         <div style="padding-left: 15px;">
                         <cc1:CollectionPager ID="clpNews" FirstText="Đầu" LastText="Cuối" BackText="« Trước &amp;nbsp;"
                            BackNextLinkSeparator="" BackNextLocation="Split" PageNumbersDisplay="Numbers"
                            ShowFirstLast="True" NextText=" &amp;nbsp; Sau »" LabelText="" runat="server"
                            ResultsLocation="None">
                          </cc1:CollectionPager>
                        </div>
                        <div style="padding: 5px;">
                            <asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                        </div>
                     </li>
            </ul>
        </div><!--endcontentleftwrapcontent-->
          <uc5:LinkContent  ID="LinkContent1" runat="server" />
        </div>
<div id="contentrighttwrapcontent">
    <table>
        <tr><td> <uc11:SoftDownloadCategory ID="SoftDownloadCategory" runat="server"/></td></tr>
        <tr><td> <uc7:ProductRight ID="ProductRight1" runat="server"/></td></tr>
        <tr><td> <uc8:NewsRight ID="NewsRight1" runat="server"/></td></tr>
    </table>
         
         
         
</div>