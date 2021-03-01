<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewsCategoryR.ascx.cs" Inherits="Musicviet.Control.NewsCategoryR" %>
     <div class="facebooksnews" style="margin-top: 20px;">
            <div class="textringt" style="width: 212px;"><span>Tin tức</span></div>
                    <div style=" clear:both;"></div>
                        <ul style="margin-bottom: 15px;">
                           <asp:Repeater ID="dtlcategoryNews" runat="server">
                             <ItemTemplate>
                                <li style=" border-bottom: none;height:10px;"><a href="<%#GenerateURL(Eval("CategoryName"),Eval("CategoryID")) %>"><span>&nbsp;&nbsp;&nbsp; <%#CatChuoi(Eval("CategoryName"),10)%></span> </a></li>
                             </ItemTemplate>
                           </asp:Repeater>
                    </ul>
            </div><!--endfacebook news-->