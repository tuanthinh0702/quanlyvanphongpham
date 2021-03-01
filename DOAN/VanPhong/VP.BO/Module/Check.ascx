<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Check.ascx.cs" Inherits="Musicviet.Module.Check" %>
 <style type="text/css">
     .auto-style1 {
         width: 315px;
     }
 </style>
 <script language="javascript" type="text/javascript">
     document.getElementById("idbody").className = "sub-page";
</script>
<%@ Import Namespace="Common" %>
<div id="wrapper" class="mainContent">
    <div id="promotionBanner" class="category-promotion"></div>
    <div id="siteMap" class="site-map">
        <asp:DataList runat="server" ID="dtlSitemap" RepeatDirection="Horizontal">
            <ItemTemplate>
                 <a href="<%#Eval("link") %>"><%#Eval("Title")%></a>
            </ItemTemplate>
            <SeparatorTemplate><span>&raquo;</span></SeparatorTemplate>
        </asp:DataList>
    </div>
    <div class="main-container clearfix">
        <div class="side-bar">
            <h3>Danh mục</h3>
           <ul id="categoryMenu" class="module-filter other-page">
                <li><a href="/Tin-Tuc.htm" title="Tin tức">Tin tức</a></li>
                <asp:Repeater runat="server" ID="rptnewscategory">
                    <ItemTemplate>
                        <li class=""><a href="<%#GenerateURL(Eval("Title"),Eval("NewsID")) %>" title="<%#Eval("Title") %>"><%#Eval("Title")%></a></li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
        <div id="pageContent" class="primary-content">
         <div class="article-wrap"><h2>Thông tin đăng nhập</h2>
             <div class="article-content">
                 <br />
                 <br />
                 <table style="height: 250px; margin-bottom: 6px; width:100%;">
                      <tr>
                            <td class="auto-style1">
                                <asp:Button ID="Button1" runat="server" Text="Đăng nhập" OnClick="Button1_Click" Height="34px" Width="206px" />
                            </td>
                            <td>
                                <asp:Button ID="Button2" runat="server" Text="Đăng ký" OnClick="Button2_Click" Height="34px" Width="234px" />
                            </td>
                     </tr> 
              </table>
          </div>
       </div>
      </div>
    </div>
</div>