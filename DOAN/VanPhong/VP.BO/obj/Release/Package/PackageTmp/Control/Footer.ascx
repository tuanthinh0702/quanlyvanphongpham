<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Footer.ascx.cs" Inherits="Musicviet.Footer" %>
<footer id="footer" class="mainContent">
    <div class="headerNav">
        <ul class="navLinks clearfix">
            <li> <a href="/Trang-chu.htm">Trang chủ</a></li>
            <li><a href="/Tin-Tuc.htm" title="tin tức">Tin tức</a></li>
            <asp:Repeater runat="server" ID="rptSever">
              <ItemTemplate>
                  <li><a href="<%#GenerateServerURL(Eval("NewsID"),Eval("Title")) %>" title="<%#Eval("Title") %>"><%#Eval("Title")%></a></li>
              </ItemTemplate>  
            </asp:Repeater>
        </ul>
    </div>
     <div class="siteInfo clearfix">
              <ul class="footerInner favCate">
                  <li class="inforTitle">Những danh mục và nhãn hàng được yêu thích</li>
                  <li>
                      <asp:Repeater runat="server" ID="rptcateproduct">
                          <ItemTemplate>
                               <a href="<%#GenerateURL(Eval("CategoryID"),Eval("CategoryName")) %>" title="<%#Eval("CategoryName") %>"><%#Eval("CategoryName")%></a>
                          </ItemTemplate>
                      </asp:Repeater>
                  </li>
             </ul>
    </div>
    <div class="comInfo clearfix">
              <div class="comIntro">
                  <p class="comName"><asp:Literal runat="server" ID="lblFooter"></asp:Literal></p>
              </div>
              <div class="downfile" style="margin-top: 0px;">
                  <span>Liên kết Facebook</span>
                 <iframe src="//www.facebook.com/plugins/likebox.php?href=https%3A%2F%2Fwww.facebook.com%2F<%=face%>&amp;width&amp;height=258&amp;colorscheme=light&amp;show_faces=true&amp;header=false&amp;stream=false&amp;show_border=false" scrolling="no" frameborder="0" style="border:none; overflow:hidden; height:240px; width:195px; " allowTransparency="true"></iframe>
              </div>
              <div class="copyright">
                  <p>Copyright 2014</p><p><a href="http://www.cpay.com.vn/" title="Công ty cổ phần thanh toán điện tử cpay">cpay.com.vn</a></p>
              </div>
    </div>
</footer>