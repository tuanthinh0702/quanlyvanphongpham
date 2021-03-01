<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Slidercontent.ascx.cs" Inherits="Musicviet.Control.Slidercontent" %>

<div>
    <div class="sanpham_ngaunhien" >
    <div class="box_wrap box_wrap_1208" >
        <div class="header_layer_1">
             <div class="header_layer_2">
                   <p class="header_box">
                       <span><label>Có thể bạn quan tâm<strong class="nut_navi_ngang"><button class="prev_ngaunhien"><i class="fa fa-backward"></i></button><button class="next_ngaunhien"><i class="fa fa-forward"></i></button></strong></label></span>
                   </p>
             </div>
          </div>
    <div class="box_content_layer_l">
        <div class="box_content_layer_2">
        <div class="box">
            <div class="box_lop1">
              <table  width="100%"  cellspacing="0" cellpadding="0">
                <tr>
                    <td class="box_lop2" >
                        <div class="chay_ngang_ngaunhien">
                            <ul class="sanpham_chay_ngang ngang_200 ngang_duoi_200">
                              <asp:Repeater runat="server" ID="rptSlidercontent">
                                  <ItemTemplate>
                                       <li >
                                           <a id="product_wrap_<%#Eval("ProductID")%>"  title="<%#Eval("ProductName") %>" href="<%#GenerateURL(Eval("ProductID"),Eval("ProductName")) %>"   onMouseOver="ShowTooltip(<%#Eval("ProductID")%>,332335,0,0,'',2); return false" onMouseOut="HideTooltip();" >
                                            <img alt="<%#Eval("ProductName") %>" class="anh_sanpham_danhsach"  src="<%=imagePath%><%#Eval("ProductImage")%>" width="150px" height="200px" />
                                           </a>
                                           <div>
                                              <a  class="ten_sanpham_ngang"   id="product_wrap_<%#Eval("ProductID") %>"  title="<%#Eval("ProductName") %>" href="<%#GenerateURL(Eval("ProductID"),Eval("ProductName")) %>"   onMouseOver="ShowTooltip(<%#Eval("ProductID")%>,332335,0,0,'',2); return false" onMouseOut="HideTooltip();" ><%#CatChuoi(Eval("ProductName"),7) %></a>
                                                <div class="giavnd_cot"><%#Getprice(Eval("ProductPrice"), Eval("Discount"))%></div>
                                            </div>
                                        </li>
                                  </ItemTemplate>
                              </asp:Repeater>
                            </ul>
                        </div>
                        <script language="javascript">
                            $(function() {
                                $(".chay_ngang_ngaunhien").jCarouselLite({
                                    btnNext: ".next_ngaunhien",
                 
                                    btnPrev: ".prev_ngaunhien",
                                    visible: 4,
                                    scroll: 3,
                                    speed: 800,
                                    auto: 10000,
                                });
                            });
                        </script>
                        <br class="clear1px" />
                    </td>
                </tr>
            </table>
        </div>
        </div>
    </div>
  </div>
 </div>
</div>
</div>