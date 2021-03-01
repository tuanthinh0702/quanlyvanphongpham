<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContentLeft.ascx.cs" Inherits="Musicviet.Module.ContentLeft" %>

<!--contentleft-->
<div id="cot_trai">
<div id="cot_trai_inner_div">
 <div>
  <div class="box_menu_trai menu_trai_sanpham m_1" >
    
    <div class="box_wrap box_wrap_1208" >
      <asp:Repeater runat="server" ID="rptCate" onitemdatabound="rptCate_ItemDataBound">
          <ItemTemplate>
              <div class="header_layer_1">
               <div class="header_layer_2">
                   <p class="header_box">
                       <span><label><a href="<%# GenerateURL(Eval("CategoryName"),Eval("CategoryID")) %>"><%#Eval("CategoryName")%></a></label></span>
                   </p>
                </div> 
             </div>
             <asp:Repeater runat="server" ID="rptCatemenu">
                  <ItemTemplate>
                     <div class="box_content_layer_l">
                         <div class="box_content_layer_2">
                           <div class="box">
                             <div class="box_lop1">
                                 <table  width="100%"  cellspacing="0" cellpadding="0">
                                     <tr>
                                       <td class="box_lop2" >
                                            <div class="module_id_176">
                                                <div class="menu_trai">
                                                   <div class="menu_trai_lop1">
                                                     <div class="menu_trai_lop2">
                                                         <div class="lvl1_menutrai "><a  href="<%# GenerateURL(Eval("CategoryName"),Eval("CategoryID"))%>"><%#Eval("CategoryName")%></a></div>
                                                         <div class="lvl1_menutrai_sp"></div>
                                                       </div>
                                                   </div>
                                                </div>
                                             </div>
                                            <style type="text/css">
                                                     .module_id_176 ul{padding:0px;margin:0px;text-align:left}
                                                     .module_id_176 li{padding:0px 0px 0px 0px;margin:0px; }
                                                     .module_id_176 .lvl1_menutrai_sp{background:none;;height:0px;border-top:0px;border-bottom:0px;}
                                                     .lvl1_menutrai,.lvl1_menutrai_sp{background:none}
                                                     .lvl2_menutrai,.lvl2_menutrai_sp{background:none}
                                                     .lvl3_menutrai,.lvl3_menutrai_sp{background:none}

                                            </style>
                                       </td>
                                    </tr>
                                 </table>
                              </div>
                           </div>
                        </div>
                    </div>
                  </ItemTemplate>
             </asp:Repeater>
             
           <div class="footer_layer_l">
                     <div class="footer_layer_2">
                       <div class="box_chan"><span><label></label></span></div>
                     </div>
                  </div>
          </ItemTemplate>
      </asp:Repeater> 
    </div>
 </div>
 <div class="box_binhluan_moinhat" >
    <div class="box_wrap box_wrap_1208" >
     <div class="header_layer_1">
           <div class="supporttitle"><span>Hỗ trợ trực tuyến</span> </div>
           <div class="supportcontent">
               <asp:Repeater runat="server" ID="rptSupporrt">
                    <ItemTemplate>
                     <div class="supportcontenttitle"><p><%#Eval("Title")%></p></div>
                     <div class="supportcontentcontent"><div class="supportcontentcontentleft"><%#GetSupport(Int32.Parse(Eval("Type").ToString().Trim()), Eval("Yahoo").ToString())%></div><div class="supportcontentcontentright"><%#Eval("Phone")%></div></div>                   </ItemTemplate>
               </asp:Repeater>
          </div>
    </div>
   </div>
   </div>
  <div class="box_binhluan_moinhat" >
    <div class="box_wrap box_wrap_1208" >
   <div class="header_layer_1">
     <asp:Repeater runat="server" ID="rptCateNews" 
           onitemdatabound="rptCateNews_ItemDataBound" >
        <ItemTemplate>
          
             <div class="header_layer_2">
                <p class="header_box"><span><label><a href="<%#GenerateNewsCateURL(Eval("CategoryID"),Eval("CategoryName")) %>"><%#Eval("CategoryName")%></a></label></span></p>
             </div>    
             <div class="box_content_layer_l">
             <div class="box_content_layer_2">
             <div class="box"><div class="box_lop1">
               <table  width="100%"  cellspacing="0" cellpadding="0">
                <tr>
                    <td class="box_lop2" >
                         <asp:Repeater runat="server" ID="prtNews">
                           <ItemTemplate>
                              <div class="div_lap ">
                              <div  style="float:left">
                                 <table class="bang_pic_phanhoi_moi"   border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td valign="middle"  align="center"><a href="<%#GenerateNewsURL(Eval("NewsID"),Eval("Title")) %>"><img src="<%=imagePath%><%#Eval("ImagePath")%>" title="<%#Eval("Title")%>" height="50px" width="50px"/></a></td>
                                    </tr>
                                </table>
                              </div>
                              <h4 class="tieu_de" style="margin-bottom:4px"><a href="<%#GenerateNewsURL(Eval("NewsID"),Eval("Title")) %>"><%# CatChuoi(Eval("Title"),6)%></a> </h4>
                                 <%#CatChuoi(Eval("Summary"),11)%>
                              </div>
                              <br class="clear1px" />
                           </ItemTemplate>
                         </asp:Repeater>
                        <div class="">&nbsp;</div><a href="#">Xem toàn bộ</a>
                    </td>
                </tr>
              </table>
            </div>
            </div>
            </div>
            </div>

            <div class="footer_layer_l">
                <div class="footer_layer_2">
                    <div class="box_chan">
                        <span><label></label></span>
                    </div>
                </div>
            </div> 
        </ItemTemplate>
     </asp:Repeater>            
  </div>
  </div>
  </div>
  <div class="box_binhluan_moinhat" >
    <div class="box_wrap box_wrap_1208" >
     <div class="header_layer_1">
        <div class="title_left"> <span>Facebook</span> </div>
           <div class="content_content_left">
               <iframe src="//www.facebook.com/plugins/likebox.php?href=https%3A%2F%2Fwww.facebook.com%2Fthucphamqueantoan&amp;width&amp;height=258&amp;colorscheme=light&amp;show_faces=true&amp;header=false&amp;stream=false&amp;show_border=false" scrolling="no" frameborder="0" style="border:none; overflow:hidden; height:260px; width:197px; " allowTransparency="true"></iframe>
            </div>
    </div>
   </div>
   </div>
 </div>
</div>
</div>
<!--endcontent--left-->