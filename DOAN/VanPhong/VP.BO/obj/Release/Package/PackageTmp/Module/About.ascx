<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="About.ascx.cs" Inherits="Musicviet.Module.About" %>
<%@ Import Namespace="Common" %>
<div class="boxgiua_wrap">
<asp:Repeater runat="server" ID="rptAbountDetail">
    <ItemTemplate>
    <div class="header_layer_1">
        <div class="header_layer_2">
            <h1 class="header"><span><label>Giới thiệu</label></span></h1>
        </div>
    </div>
    <div class="box_content_layer_l">
        <div class="box_content_layer_2">
        <div class="boxgiua">
            <div class="boxgiua_lop1">
                <div class="boxgiua_lop2">
                   <%#Eval("AbountContent")%>
                   <div style=" margin-left:10px; ">
                    <table border="0" cellspacing="0" cellpadding="0">
                     <tr>
                       <td style="padding-left:10px;">
                        <iframe width="150" src="//www.facebook.com/plugins/like.php?href=<%#Config.WebsiteAppPath %>/Gioi-thieu.htm&amp;width&amp;layout=button_count&amp;action=like&amp;show_faces=true&amp;share=true&amp;height=21" scrolling="no" frameborder="0" style="border:none; overflow:hidden; height:21px;" allowTransparency="true"></iframe>
                       </td>
                 
                       <td style="padding:0px 10px"><div id="fb-root"></div>
                        <script>(function (d, s, id) {
                                var js, fjs = d.getElementsByTagName(s)[0];
                                if (d.getElementById(id)) return;
                                js = d.createElement(s); js.id = id;
                                js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
                                fjs.parentNode.insertBefore(js, fjs);
                            } (document, 'script', 'facebook-jssdk'));</script>
                       <div class="fb-send" data-href="<%#Config.WebsiteAppPath %>/Gioi-thieu.htm" data-colorscheme="light"></div>
                     </td>
                      <td>
                           <script type="text/javascript" src="https://apis.google.com/js/plusone.js"></script>
                          <g:plusone></g:plusone>	
                      </td>
                     </tr>
                    </table>
                    <br />

                   </div>

                  <div style="clear:both;height:1px;overflow:hidden">&nbsp;</div>
               
                  <div id="fb-root"></div>

                   <script>                       (function (d, s, id) {
                           var js, fjs = d.getElementsByTagName(s)[0];
                           if (d.getElementById(id)) return;
                           js = d.createElement(s); js.id = id;
                           js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
                           fjs.parentNode.insertBefore(js, fjs);
                       } (document, 'script', 'facebook-jssdk'));
                   </script>
                  <div class="fb-comments" data-href="<%#Config.WebsiteAppPath %>/Gioi-thieu.htm" data-num-posts="20"  data-width="820" ></div>

                  <script src="https://apis.google.com/js/plusone.js"> </script>
                   <div class="g-comments"
                     data-href="<%#Config.WebsiteAppPath %>/Gioi-thieu.htm"
                     data-width="820"
                     data-first_party_property="BLOGGER"
                     data-view_type="FILTERED_POSTMOD">
                  </div>
              </div>
          </div>
        </div>
    </div>
    </div>
   </ItemTemplate>
</asp:Repeater>
</div>