<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LinkContent.ascx.cs" Inherits="Musicviet.Control.LinkContent" %>
<%--sam pham gia gia nhieu nhat--%>
<div id="topPromotePro" class="proPromote">
    <asp:Repeater runat="server" ID="rptlinkcontent" >
       <ItemTemplate>
              <a href="<%#Eval("Link")%>" title="<%#Eval("HtmlBoxName")%>">
                   <img src="<%=imagePath %><%#Eval("LinkImage") %>" alt="<%#Eval("HtmlBoxName")%>" width="315" height="120" />
               </a>
       </ItemTemplate>
    </asp:Repeater>
</div>
    