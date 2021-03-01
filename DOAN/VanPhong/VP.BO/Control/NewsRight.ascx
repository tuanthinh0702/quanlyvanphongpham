<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewsRight.ascx.cs" Inherits="Musicviet.Control.NewsRight" %>
    <div id="abc" class="facebooksnews" style=" float: right; position: relative;">
                <div class="textringt"><span>Tin trong ngày</span></div>
                <div class="contentnews">
                    <ul>
                     <asp:DataList ID="dtlTopNews" runat="server">
                     <ItemTemplate>
                        <li style="width:214px;"><a href="<%#GenerateURL(Eval("Title"),Eval("NewsID")) %>"><img style=" float:left; " src='/Upload/<%#Eval("ImagePath") %>'  alt="img tin tuc" width="52px" height="52px"> <p><%#CatChuoi(Eval("Title"), 10)%></p></a></li>
                     </ItemTemplate>
                     </asp:DataList>
                    </ul>
                </div>
            </div><!--endfacebook news-->