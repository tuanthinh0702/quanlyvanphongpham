<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Severcontent.ascx.cs" Inherits="Musicviet.Control.Severcontent" %>
      <div id="contentwrapcontent">
            <div class="newscontentwrapcontent">
                <div class="title" ><img src="../images/news.png" alt="news"> <span>Tin tức</span></div>
             <ul>
                  <asp:DataList ID="dtlCategoryNameNews" Width="100%" runat="server">
                      <ItemTemplate>
                           <li>
                             <img src="images/iconnhac.png" alt="iconnhac"><a href="<%#GenerateURL(Eval("CategoryName"),Eval("CategoryID")) %>"> <span><%#CatChuoi(Eval("CategoryName"),10)%> </span> </a>
                           </li>
                        </ItemTemplate>
                    </asp:DataList>
             </ul>
            </div><!--endnewscontentwrapcontent-->
           <div class="newscontentwrapcontent" >
                <div class="title" ><img src="../images/product.png" alt="news"> <span>sản phẩm  </span></div>
                <ul>
                    <li><img src="../images/iconnhac.png" alt="iconnhac"><a href="Phan-mem.htm"><span>Phần mền âm nhạc    </span> </a></li>
                    <%--<li><img src="../images/iconnhac.png" alt="iconnhac"><a href="Default.aspx?module=ProductOther"><span>Thiết bị công nghệ âm nhạc   </span> </a></li>--%>
                    <li><img src="../images/iconnhac.png" alt="iconnhac"><a href="San-pham.htm"><span>Nhạc cụ âm thanh  </span> </a></li>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <li><img src="../images/iconnhac.png" alt="iconnhac"><a href='<%#GenerateURLCate(Eval("NameModule"),Eval("Category")) %>'><span><%#Eval("NameModule")%> </span> </a></li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div><!--endnewscontentwrapcontent-->
            <div class="newscontentwrapcontent">
                <div class="title" ><img src="../images/service.png" alt="news"> <span>Dịch vụ</span></div>
          
             <ul>
                  <asp:DataList ID="dtlCategoryNameSever" Width="100%" runat="server">
                      <ItemTemplate>
                           <li>
                             <img src="images/iconnhac.png" alt="iconnhac"><a href="<%#GenerateURL(Eval("CategoryName"),Eval("CategoryID")) %>"> <span><%#CatChuoi(Eval("CategoryName"),10)%> </span> </a>
                           </li>
                        </ItemTemplate>
                    </asp:DataList>
             </ul>
            </div><!--endnewscontentwrapcontent-->
        </div>