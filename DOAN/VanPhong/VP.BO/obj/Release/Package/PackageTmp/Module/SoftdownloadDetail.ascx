<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SoftdownloadDetail.ascx.cs" Inherits="Musicviet.Module.SoftdownloadDetail" %>
<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
<%@ Register Src="~/Control/LinkContent.ascx" TagName="LinkContent" TagPrefix="uc5" %>
<%@ Register Src="../Control/LinkFacebooks.ascx" TagName="LinkFacebooks" TagPrefix="uc6" %>
<%@ Register Src="../Control/ProductRight.ascx" TagName="ProductRight" TagPrefix="uc7" %>
<%@ Register Src="../Control/NewsRight.ascx" TagName="NewsRight" TagPrefix="uc8" %>
<%@ Register Src="~/Control/SoftDownloadCategory.ascx" TagName="SoftDownloadCategory"  TagPrefix="uc11"%>
 <div id="contentleft">
     <script>
    function changeCommentsUrl() {
             document.write("<div class='fb-comments' data-href='" + window.location.href + "' data-width='665' data-num-posts='10'></div>");
         }
</script>
   <div id="contentleftwrapcontent">
            <div class="textnews"><span>Sản phẩm » Phần mềm âm nhạc   </span>
             <div id="shares">
                        <a rel="nofollow" style="text-decoration: none;" href="http://www.yahoo.com/" onclick="window.open('http://bookmarks.yahoo.com/myresults/bookmarklet?t='+document.title+'&amp;d='+document.Description+'&amp;tag=&amp;u='+location.href);return false;"
                            title="Chia sẻ với Yahoo">
                            <img border="0" style="padding-bottom: 1px;" src="../img/ico_yahoo.png" name="Yahoo"
                                id="Yahoo">
                        </a><a rel="nofollow" style="text-decoration: none;" href="http://www.google.com/"
                            onclick="window.open('http://www.google.com/bookmarks/mark?op=add&amp;hl=vi&amp;bkmk='+encodeURIComponent(location.href)+'&amp;annotation='+encodeURIComponent(document.Description)+'&amp;labels=&amp;title='+encodeURIComponent(document.title));return false;"
                            title="Chia sẻ với Google Plus">
                            <img border="0" style="padding-bottom: 1px;" src="../img/ico_google.png" name="Google"
                                id="Google">
                        </a><a rel="nofollow" style="text-decoration: none;" href="http://www.myspace.com/"
                            onclick="window.open('http://www.myspace.com/Modules/PostTo/Pages/?u='+encodeURIComponent(location.href)+'&amp;annotation='+encodeURIComponent(document.Description)+'&amp;labels=&amp;title='+encodeURIComponent(document.title));return false;"
                            title="Chia sẻ với Myspace">
                            <img border="0" style="padding-bottom: 1px;" src="../img/ico_space.png" name="MySpace"
                                id="MySpace">
                        </a><a rel="nofollow" style="text-decoration: none;" href="http://www.twitter.com/"
                            onclick="window.open('http://twitter.com/home?status='+encodeURIComponent(location.href)+'&amp;t='+encodeURIComponent(document.title));return false;"
                            title="Chia sẻ với Twitter">
                            <img border="0" style="padding-bottom: 1px;" src="../img/ico_twitter.png" name="Twitter"
                                id="Twitter">
                        </a><a rel="nofollow" style="text-decoration: none;" href="http://www.facebook.com/"
                            onclick="window.open('http://www.facebook.com/sharer.php?u='+encodeURIComponent(location.href)+'&amp;t='+encodeURIComponent(document.title));return false;"
                            title="Chia sẻ với Facebook">
                            <img border="0" style="padding-bottom: 1px;" src="../img/ico_facebook.png" name="Facebook"
                                id="Facebook">
                        </a>
                    </div>
            </div>
            <div id="contentdetailsproduct" style="width:100%;">
                <div class="contenttitlenews" style="width:98%;">
                <asp:Repeater ID="rptNewsDetail" runat="server">
                  <ItemTemplate>
                    <div class="titlenews"><a href="#"><span><%#CatChuoi(Eval("Title"), 10)%> </span></a></div>
                    <div class="contendetailnews" >
                        <div id="context">
                             <%#Eval("Summary")%>
                          <br />
                          <%#Eval("Detail")%>
                        <div class="btnbuttom" style="float:right; margin-top:20px; "><input type="button" class="btnbuy" value="Quay lại"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btnbuy" value="Tải về"/></div>
                        </div>
                       
                    </div>
                  </ItemTemplate>
                </asp:Repeater>
                </div>
                <div style="clear: both;"></div>
                <div class="detailsp">
                    <div class="textdetailsp">Ý kiến bạn đọc</div>
                     <div style="margin-left: 5px; margin-top: 10px;">
                           <script> changeCommentsUrl();</script>
                        </div>
                  </div>
            </div>
            <div class="textdetailspxl">Phần mền liên quan </div>
            <ul style="padding-bottom: 20px;">
               <asp:DataList ID="dtlOther" runat="server">
                <ItemTemplate>
                   <li class="linewsxl">
                     <div class="contendetailnews">
                       <a href="<%#GenerateURL(Eval("Title"),Eval("NewsID")) %>">&rsaquo;&rsaquo;  &nbsp;&nbsp; <%#CatChuoi(Eval("Title"), 10)%></a>
                     </div>
                  </li>
                </ItemTemplate>
              </asp:DataList>    
            </ul>

        </div><!--endcontentleftwrapcontent-->
          <uc5:LinkContent  ID="LinkContent1" runat="server" />
 </div>
 <div id="contentrighttwrapcontent">
     <table>
         <tr>
             <td>  <uc11:SoftDownloadCategory ID="SoftDownloadCategory" runat="server"/></td>
         </tr>
         <tr><td> <uc7:ProductRight ID="ProductRight1" runat="server"/></td></tr>
         <tr><td> <uc8:NewsRight ID="NewsRight1" runat="server"/></td></tr>
     </table>
        
         
         
</div>
