<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Contentbotton.ascx.cs" Inherits="Musicviet.Control.Contentbotton" %>
<!--contentbotton-->
<div style="clear:both">
    <div>
   <div class="box_tin_danhmuc_2" ><div class="box_wrap box_wrap_1208" ><div class="header_layer_1"><div class="header_layer_2"><p class="header_box"><span><label>CHĂM SÓC KHÁCH HÀNG
    </label></span></p></div></div>
        <div class="box_content_layer_l">
            <div class="box_content_layer_2">
            <div class="box">
                <div class="box_lop1">
                <table  width="100%"  cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="box_lop2" >
                            <ul class="tin_ngang tin_ngang_050 tin_ngang_phai_050">
                                <asp:Repeater runat="server" ID="rptnewscustom">
                                    <ItemTemplate>
                                   <li>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td valign="top" width="1"><a class="tin_ngang_anh" href="#"></a></td>
                                            <td valign="top" class="thong_tin_phai_050"><a class="tin_ngang_tieude" href="<%#GenerateNewsURL(Eval("NewsID"),Eval("Title")) %>"><%#Eval("Title")%></a> </td>
                                        </tr>
                                    </table>
                                </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                              </ul>
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
</div>
<!--end content-botton-->
