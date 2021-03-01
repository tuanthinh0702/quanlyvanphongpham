<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CenterNews.ascx.cs" Inherits="Musicviet.Module.CenterNews" %>
 <%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
 <%@ Register Src="../Control/LinkContent.ascx" TagName="LinkContent" TagPrefix="uc5" %>
 <%@ Register Src="../Control/ProductRight.ascx" TagName="ProductRight" TagPrefix="uc7" %>
 <%@ Register Src="../Control/NewsRight.ascx" TagName="NewsRight" TagPrefix="uc8" %>
 <%@ Register Src="../Control/NewsCategoryR.ascx"  TagName="NewsCategoryR" TagPrefix="uc9"%>
 <div id="contentleft">
 <div id="contentleftwrapcontent">
             <div class="textnews">
                  <span>Tin tức </span>
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
             <ul id="news">
               <asp:DataList ID="dtlCat" runat="server" width="100%" >
	            <ItemTemplate>
                    <div class="div-title-musicviet">
                        <div class="div-title"><img src="./img/iconstar.png" alt="ket qua xo so" /><a href="<%#GenerateURL(Eval("CategoryName"),Eval("CategoryID")) %>"  class="nstitle" > <b><%# Eval("CategoryName")%></b></a></div>
                    </div>
                    <div class="news-box-musicviet">
                        <div class="div-titleNewBox">
                               <a href="<%#GenerateURL(CatChuoi(Eval("Title"), 50),Eval("NewsID")) %>"  class="nstitle"><b> <%# CatChuoi(Eval("Title"), 50)%></b></a>
                            </div>
                          <div class="div-desNewsbox">
                            <div class="div-img">
                                  <a href="<%#GenerateURL(CatChuoi(Eval("Title"), 50),Eval("NewsID")) %>">
                                   <img src='/Upload/<%#Eval("NewsImagePath") %>'
                                    alt="<%# CatChuoi(Eval("Title"), 50)%>" width="100px" />
                                    </a>
                            </div>
                              <div class="div-text" style="color:#ffffff;">
                                  <%# CatChuoi(Eval("Summary"), 250)%>
                               </div>
                          </div>
                          <div class="div-listNews">
                                <ul style="margin-top: 0px;">
                                 <asp:DataList ID="dtlNews" runat="server" DataSource='<%# getNews((int)Eval("CategoryID"))%>'>
                                        <ItemStyle/>
                                        <ItemTemplate>
                                                 <li style="padding-top:12px; height:30px;">
                                                    <a href="<%#GenerateURL(CatChuoi(Eval("Title"), 50),Eval("NewsID")) %>">
                                                        <img src="./img/oke.jpg" style="height:5px;width:5px; color:#ffffff;"  alt="<%# Eval("Title") %>"/>  <%# Eval("Title") %></ahref>
                                                 </li>
                                     
                                        </ItemTemplate>
                                    </asp:DataList>
                                 </ul>
                            </div>
                    </div>
	               </ItemTemplate>
		        </asp:DataList>
              </ul>
             <div style="padding: 5px; text-align: center;">
                            <asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
           </div>
        </div><!--endcontentleftwrapcontent-->
         <uc5:LinkContent  ID="LinkContent1" runat="server" />
</div>
 <div id="contentrighttwrapcontent">
     <table>
         <tr><td><uc9:NewsCategoryR ID="NewsCategoryR1" runat="server"/></td></tr>
         <tr><td> <uc7:ProductRight ID="ProductRight1" runat="server"/></td></tr>
         <tr><td>  <uc8:NewsRight ID="NewsRight1" runat="server"/></td></tr>
     </table>
          
         
        
      </div>
