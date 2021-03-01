<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OrderItemMgr.ascx.cs" Inherits="Musicviet.Administrators.Modules.OrderItemMgr" %>
<div class="container" id="actualbody">
    <div class="row">
        <div class="widget clearfix">
            <h2>
                Danh sách khách hàng/ đơn hàng
            </h2>
            <div class="widget_inside">
                <div class="col_12">
                     <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                        <ContentTemplate>
                             <table cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td>
                                Mã&nbsp; đơn hàng
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="txtTransCode"></asp:TextBox>
                            </td>
                            <td>Tên&nbsp; khách hàng </td>
                            <td><asp:TextBox runat="server" ID="txtName"></asp:TextBox></td>
                            <td>Trang thái</td>
                            <td>&nbsp; <asp:DropDownList ID="DropDownList1" runat="server" CssClass="okeser"> 
                                          <asp:ListItem Value="-1">Chọn trạng thái</asp:ListItem>  
                                          <asp:ListItem Value="0">Chờ xử lý</asp:ListItem>  
                                          <asp:ListItem  Value="1">Đang giao hàng</asp:ListItem>   
                                          <asp:ListItem Value="2">Thành công</asp:ListItem>  
                                          <asp:ListItem  Value="3">Hủy</asp:ListItem>                                  
                                    </asp:DropDownList>
                            </td>
                            <td></td>
                            <td>&nbsp;</td>
                                        
                                        <td></td>
                            </tr>
                            <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp; 
                                <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" 
                                    Text="Tìm kiếm" />
                                </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;
                            &nbsp;
                            </td>
                            <td>
                               
                                Số bản ghi</td>
                            <td>
                                 &nbsp;
                                 <asp:DropDownList ID="drpShow" runat="server" AutoPostBack="True" 
                                     onselectedindexchanged="drpShow_SelectedIndexChanged" Width="50px">
                                     <asp:ListItem Value="10">20</asp:ListItem>
                                     <asp:ListItem Value="20">50</asp:ListItem>
                                     <asp:ListItem Selected="True" Value="50">10</asp:ListItem>
                                     <asp:ListItem Value="150">150</asp:ListItem>
                                     <asp:ListItem Value="200">200</asp:ListItem>
                                     <asp:ListItem Value="1">Toàn bộ</asp:ListItem>
                                 </asp:DropDownList>
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                &nbsp;</td>
                           
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                    <div style="text-align: center; width: 100%">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
            <ContentTemplate>
                <asp:Label ID="lblError" runat="server" ForeColor="Red" EnableViewState="False" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div style="padding: 2px 5px 2px 5px; text-align: center;">
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="false">
            <ProgressTemplate>
                <img src="/Images/ajax-loader.gif" style="vertical-align: middle;" />
                <asp:Label ID="lblLoading" runat="server" Text="Đang tải dữ liệu..." />
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>
    <p> <asp:Button ID="btnDel" runat="server" Text="Xóa" OnClick="btnDel_Click" OnClientClick="return confirm('Bạn có thực sự muốn xóa bản ghi này không ');" /></p>
                 <asp:UpdatePanel runat="server" ID="pnDadsta" UpdateMode="Conditional">
                    <ContentTemplate>
                        <%--Danh sách bản lịch sử đã nạp--%>
                        <div class="col_12">
                    <asp:Panel runat="server" ID="pnData" Visible="True">
                                <asp:GridView runat="server" ID="grData" GridLines="None" AutoGenerateColumns="False"
                                     CssClass="dataTable"
                                    Width="100%" EmptyDataText="No Data" AllowPaging="True" 
                                    OnPageIndexChanging="grData_PageIndexChanging" 
                                    PageSize='<%# Int32.Parse(drpShow.SelectedValue) %>'>
                                    <Columns>
                                        <asp:TemplateField HeaderText="STT">
                                            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                            <ItemTemplate>
                                                <%#Container.DataItemIndex + 1%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                Mã đơn hàng
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <%#Eval("OrderNo")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField>
                                            <HeaderTemplate>
                                                Tên khách hàng
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <%# Eval("FullName")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                               Số điện thoại
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                            <%#Eval("Mobile")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                               Địa chỉ
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                            <%#Eval("Adresss")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                       <asp:TemplateField>
                                            <HeaderTemplate>
                                              Email
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                            <%#Eval("Email")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField>
                                            <HeaderTemplate>
                                              Tổng tiền
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                            <%#String.Format("{0:0,0 vnđ}", Eval("Total"))%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                          <asp:TemplateField>
                                            <HeaderTemplate>
                                              Trạng thái 
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                               <%#Getstatus(int.Parse(Eval("Status").ToString())) %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField>
                                            <HeaderTemplate>
                                              Ngày đặt hàng
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                               <%#DateTime.Parse(Eval("OrderDate").ToString()).ToString("dd/MM/yyyy")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                              Xác nhận trạng thái
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                              <a href="Home.aspx?module=Vew&id=<%#Eval("OrderNo") %>" title="Xem trang thái"><img src="Images/edit.gif" /></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                           <ItemTemplate>
                                               <input type="checkbox" id="cbxDel" runat="server" value='' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                               </Columns>
                                    <PagerStyle CssClass="pagerClass" />
                                </asp:GridView>
                            </asp:Panel>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger runat="server" ControlID="btnSearch" EventName="Click"/>
                        <asp:AsyncPostBackTrigger runat="server" ControlID="drpShow" EventName="SelectedIndexChanged"/>
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</div>
<iframe width="174" height="189" name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
    src='DatePicker/ipopeng.htm'
    scrolling="no" frameborder="0" style="visibility: visible; z-index: 999; position: absolute;
    top: -500px; left: -500px;"></iframe>