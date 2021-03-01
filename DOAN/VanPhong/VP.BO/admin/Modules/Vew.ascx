<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Vew.ascx.cs" Inherits="Musicviet.Admingtc.Modules.Vew" %>

<style type="text/css">
    .auto-style1 {
        width: 217px;
    }
</style>

<div class="container" id="actualbody">
    <div class="row">
        <div class="widget clearfix">
            <h2>
                Chi tiết đơn hàng</h2>
            <div class="widget_inside">
                <div class="col_12">
                    <div style="width: 100%; text-align: center">
                         <asp:Label ID="lblError" runat="server" ForeColor="Red" EnableViewState="False" />
                    </div>
                    <asp:Panel runat ="server" ID="plkhachhang" GroupingText="Thông tin khách hàng" Width="100%" >
                         <table style="width: 100%;">
                        <tr>
                            <td class="auto-style1">
                                Tên khách hàng:</td>
                            <td class="style3">
                                <asp:Label  ID="lblfullname" runat="server"></asp:Label>
                            </td>

                        </tr>
                        <tr>
                            <td class="auto-style1">
                                Điện thoại:</td>
                            <td class="style3">
                                <asp:Label  ID="lblphone" runat="server"></asp:Label>
                            </td>

                        </tr>
                         <tr>
                            <td class="auto-style1">
                                Địa chỉ:</td>
                            <td class="style3">
                                <asp:Label  ID="lblAdersss" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                Email:</td>
                            <td class="style3">
                                <asp:Label  ID="lblemail" runat="server"></asp:Label>
                            </td>

                        </tr>
                        <tr>
                            <td class="auto-style1">
                                Trạng thái:</td>
                            <td class="style3">
                                <asp:Label  ID="lbltrangthai" runat="server" ForeColor="Red"></asp:Label>
                            </td>

                        </tr>
                   
                    </table>

                    </asp:Panel>
                       <br />
                    <br />
                <asp:Panel ID="plchitietdonhang" runat="server" GroupingText="Chi tiết đơn hàng" Width="100%">
                   <div>
                          <asp:GridView ID="grvOrder"  runat="server" GridLines="None" AutoGenerateColumns="False"
                                     CssClass="dataTable">
                            <Columns>
                                <asp:TemplateField HeaderText="STT">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex + 1%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        Tên sản phẩm
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                      <b><%# GetProductName(int.Parse(Eval("ProductID").ToString())) %></b>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField>
                                    <HeaderTemplate>
                                        Mã sản phẩm
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <b><%# GetProductCode(int.Parse(Eval("ProductID").ToString())) %></b>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        Giá
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%#Common.Util.DecimalObjectToString(Eval("Price")) %>đ
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                             </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        Số lượng
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                           <%#Eval("Quanity") %>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                             
                            </Columns>
                           
                        </asp:GridView>  
                   </div>
             <p style=" font-size: 13px; font-weight: bold; margin-top: 10px;" runat="server" id="totx">
                Tổng tiền :<asp:Label ID="lblTotal" runat="server" Text=""></asp:Label> 
                          đ</p>
                    <br />
                    <br />
              </asp:Panel>
                  <br />
                    <br />
                  <asp:Panel ID="pltrangthai" runat="server" GroupingText="Cập nhật trạng thái đơn hàng" Width="100%">
                      <br />
                      <br />
                      <table>
                               <tr>
                                    <td class="style6">
                                        Trạng thái đơn hàng:</td>
                                    <td class="style3">
                                        <asp:DropDownList ID="ddlStatus" runat="server" Width="253" >
                                        <asp:ListItem Value="0">Chờ xử lý</asp:ListItem>  
                                                  <asp:ListItem  Value="1">Đang giao hàng</asp:ListItem>   
                                                  <asp:ListItem Value="2">Thành công</asp:ListItem>  
                                                  <asp:ListItem  Value="3">Hủy</asp:ListItem>                    
                                        </asp:DropDownList>
                                      </td>
                                    <td>
                                        <asp:Button ID="btnSave" runat="server" Text="Cập nhật" OnClick="btnSave_Click" 
                                             Width="80px" ValidationGroup="ad" style="height: 26px"> </asp:Button></td>
                               </tr>

                      </table>

                    </asp:Panel>
                   
                </div>
            </div>
        </div>
    </div>
</div>
