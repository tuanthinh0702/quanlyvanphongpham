﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewsDetail.ascx.cs" Inherits="Musicviet.Module.NewsDetail" %>
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
            <asp:Repeater runat="server" ID="rptNewsDetail">
                <ItemTemplate>
                     <div class="article-wrap"><h2><%#Eval("Title")%></h2>
                        <div class="article-content">
                           <%#Eval("Detail")%>
                       </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
           
        </div>
    </div>
</div>