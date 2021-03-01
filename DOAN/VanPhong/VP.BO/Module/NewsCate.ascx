<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewsCate.ascx.cs" Inherits="Musicviet.Module.NewsCate" %>
 <%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
<script language="javascript" type="text/javascript">
    document.getElementById("idbody").className = "sub-page";
</script>
<%@ Import Namespace="Common" %>
<div id="wrapper" class="mainContent">
    <div id="promotionBanner" class="category-promotion"></div>
    <div id="siteMap" class="site-map">
       <a href="/Trang-chu.htm">Trang chủ</a><a href="/Tin-Tuc.htm">Tin tức</a>
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
                     <div class="article-wrap"><h2>Tin tức</h2>
                        <div class="article-content">
                         <ul style="list-style: none;margin-top: 10px;margin-bottom: 10px;">
                             <asp:Repeater runat="server" ID="rptCateNews">
                                 <ItemTemplate>
                                     <li class="divli">
                                          <div class="divimges"><a href="<%#GenerateURL(Eval("Title"),Eval("NewsID")) %>"><img src="<%=imagePath %><%#Eval("ImagePath")%>" alt="<%#Eval("Title")%>" width="190px"/></a></div> 
                                          <div class="divcontent">
                                             <div class="divtitle">
                                                 <a href="<%#GenerateURL(Eval("Title"),Eval("NewsID"))%>"><%#CatChuoi(Eval("Title"),6)%></a>
                                             </div>
                                             <div class="divsummay">
                                                 <%#CatChuoi(Eval("Summary"),40)%>
                                             </div>
                                          </div>
                                     </li>
                                 </ItemTemplate>
                             </asp:Repeater>
                         </ul>
                           <div class="tools-paging">
                                <cc1:CollectionPager ID="clpNews" PagingMode="PostBack" FirstText="Đầu" LastText="Cuối" BackText="« Trước &amp;nbsp;"
                                  BackNextLinkSeparator="" BackNextLocation="Split" PageNumbersDisplay="Numbers"
                                  ShowFirstLast="True" NextText=" &amp;nbsp; Sau »" LabelText="" runat="server"
                                   ResultsLocation="None" QueryStringKey="page">
                                </cc1:CollectionPager>
                            </div>

                       </div>
                    </div>
        </div>
    </div>
</div>
