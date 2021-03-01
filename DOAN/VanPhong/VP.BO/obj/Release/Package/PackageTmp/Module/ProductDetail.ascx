<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductDetail.ascx.cs"
    Inherits="Musicviet.Module.ProductDetail" %>
 <script language="javascript" type="text/javascript">
     document.getElementById("idbody").className = "sub-page";
</script>
<%@ Import Namespace="Common" %>
<div id="wrapper" class="mainContent">
    <div id="promotionBanner" class="category-promotion"></div>
    <div id="siteMap" class="site-map">
        <asp:DataList runat="server" ID="dtlsitemap" RepeatDirection="Horizontal">
              <ItemTemplate>
                <a href="<%#Eval("link") %>" title="<%#Eval("CategoryName")%>"><%#CatChuoi(Eval("CategoryName"),5)%></a>  
               </ItemTemplate>
            <SeparatorTemplate><span>&raquo;</span></SeparatorTemplate>
        </asp:DataList>
    </div>
    <div class="main-container">
        <div id="dProductInfor" class="product-information clearfix">
            <asp:Repeater runat="server" ID="rptproductdetail" 
                onitemdatabound="rptproductdetail_ItemDataBound">
                <ItemTemplate>
                     <div class="product-image">
                       <a href="<%#Config.WebsiteAppPath%><%=imagePath%><%#Eval("ProductImage") %>" class="main-image cloud-zoom" id='zoom1' rel='showTitle: false,titleOpacity:0.5,lensOpacity:0.5,smoothMove: 5,adjustX: 20, adjustY: 0, tintOpacity:0.6,zoomWidth:310,zoomHeight:282'>
                           <img src="<%#Config.WebsiteAppPath%><%=imagePath%><%#Eval("ProductImage") %>" alt="<%#Eval("ProductName") %>" width="310" height="282" />
                       </a>
                       <div class="img-small" id='ulListThumbPhoto'>
                           <asp:Repeater runat="server" ID="rptimgmore">
                               <ItemTemplate>
                                  <a class='sm-zoom' href="<%#Config.WebsiteAppPath%><%=imagePath%><%#Eval("ImagePath") %>" data-lightbox="roadtrip">
                                     <img src="<%#Config.WebsiteAppPath%><%=imagePath%><%#Eval("ImagePath") %>" alt="<%#Eval("ProductName") %>" width="48" height="44" />
                                  </a> 
                               </ItemTemplate>
                           </asp:Repeater>
                       </div>
                     </div>
                     <div class="product-detail">
                      <div class="pro-block pro-title">
                        <h1><a href="<%#Config.WebsiteAppPath%><%#GenerateURL(Eval("ProductName"),Eval("ProductID")) %>" title="<%#Eval("ProductName") %>"><%#Eval("ProductName") %></a></h1>
                     </div>
                     <div class="pro-block pro-price">
                        <%#GetpriceDetail(Eval("ProductPrice"), Eval("Discount"))%>
                        <%#BinPercentDetail(Eval("ProductPrice"), Eval("Discount"))%>
                       <span class="company-phone"><%=hotline%></span>
                    </div>
                    <div class="pro-block pro-summary"><%#Eval("SubProductName")%></div>
                    <div class="pro-block pro-social">
                     <div class="fb-like" data-href="<%#Config.WebsiteAppPath%><%#GenerateURL(Eval("ProductName"),Eval("ProductID")) %>" data-layout="standard" data-action="like" data-show-faces="true" data-share="true"></div>
                    </div>
                  </div>
                </ItemTemplate>
            </asp:Repeater>
           
        </div>

        <div class="product-main clearfix">
            <div id="dProductIntro" class="product-intro">
                <ul class="pro-tab clearfix" id="tabProDetail">
                    <li class="active">
                        <a href="javascript:void(0);">Thông tin sản phẩm</a>
                    </li>
                </ul>

                <div class="intro-content">
                    <%=detail%>
                </div>
                
              <%--   product other--%>

                <div class="listPro detail-related">
                    <div class="titlePro"><h4>Sản phẩm liên quan</h4></div>
                    <div class="listItems clearfix">
                        <asp:Repeater runat="server" ID="rptproductother">
                            <ItemTemplate>
                                   <div class="proItem">
                                          <a href="<%#GenerateURL(Eval("ProductName"),Eval("ProductID"))%>" title='<%#Eval("ProductName")%>' class="proImg">
                                                <img src="<%=imagePath %><%#Eval("ProductImage") %>" width="165" height="150" alt="<%#Eval("ProductName")%>"/>
                                           </a>
                                           <h2>
                                             <a href="<%#GenerateURL(Eval("ProductName"),Eval("ProductID"))%>" title='<%#Eval("ProductName")%>'><%#CatChuoi(Eval("ProductName"),4)%></a>
                                           </h2>
                                              <%#Getprice(Eval("ProductPrice"),Eval("Discount"))%>
                                           <div class="proBtn">
                                           <a href="<%#GenerateURL(Eval("ProductName"),Eval("ProductID"))%>" title='<%#Eval("ProductName")%>' class="btn viewpro">Xem</a>
                                          </div>
                                            <%#BinPercent(Eval("ProductPrice"), Eval("Discount"))%>  <span class='iconProHot'></span>
                                          </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    
                    </div>
                </div>

            </div>
            
          <%--  product top -hot--%>

            <div id="dListHotPro" class="product-hot">
                <h4>BÁN CHẠY NHẤT</h4>
                <div class="listItems clearfix">
                    <asp:Repeater runat="server" ID="rptproducttop">
                      <ItemTemplate>
                       <div class="proItem clearfix">
                        <a href="<%#GenerateURL(Eval("ProductName"),Eval("ProductID"))%>" title='<%#Eval("ProductName")%>' class="proImg">
                            <img src="<%=imagePath %><%#Eval("ProductImage") %>" width="165" height="150" alt="<%#Eval("ProductName")%>"/>
                        </a>
                        <h2>
                            <a href="<%#GenerateURL(Eval("ProductName"),Eval("ProductID"))%>" title='<%#Eval("ProductName")%>'><%#CatChuoi(Eval("ProductName"),4)%></a>
                        </h2>
                         <%#Getprice(Eval("ProductPrice"),Eval("Discount"))%>
                        <div class="proBtn">
                            <a href="<%#GenerateURL(Eval("ProductName"),Eval("ProductID"))%>" title='<%#Eval("ProductName")%>' class="btn viewpro">Xem</a>
                        </div>
                          <%#BinPercent(Eval("ProductPrice"), Eval("Discount"))%>  <span class='iconProHot'></span>
                        </div>
                       </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>

        </div>
    </div>
</div>