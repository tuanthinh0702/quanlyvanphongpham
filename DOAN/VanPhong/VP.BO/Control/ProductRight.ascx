<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductRight.ascx.cs" Inherits="Musicviet.Control.ProductRight" %>
     <div class="facebooksnews"  style="height: 272px!important;overflow: hidden; float: right; position: relative;" >
                <div class="textringt"><span>Sản phẩm tiêu biểu</span></div>
                <div class="contentnews">
                    <div class=randomPost1>
                        <ul id="postItem">
                        <asp:DataList ID="dtlselectproductright" runat="server">
                           <ItemTemplate>
                              <li class="post-1" style="border-bottom:none;width:214px;"> <a href="<%#GenerateURL(Eval("ProductName"),Eval("ProductId")) %>"><img style=" float:left; "  height="47px" border="0" width="67px" src='/Upload/<%#Eval("ProductImage") %>' alt="<%#Eval("ProductName")%>"><p><%#CatChuoi(Eval("ProductName"), 10)%></p> </a></li>
                           </ItemTemplate>
                        </asp:DataList>
                        </ul>
                    </div>
                </div>
            </div><!--endproductnew-->