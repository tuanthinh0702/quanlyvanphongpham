<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Support.ascx.cs" Inherits="Musicviet.Administrators.Modules.Support" %>
<%@ Register TagPrefix="ajaxc" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=4.1.60623.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>
<div class="container" id="actualbody">
    <div class="row">
        <div class="widget clearfix">
            <h2>
                Cài đặt hỗ trợ trực tuyến
            </h2>
            <div class="widget_inside">
                <div class="col_12">
                      <div style="text-align:center;">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
            <ContentTemplate>
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red" EnableViewState="False" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
                  <table cellpadding="2" cellspacing="2" border="0">
        <tr valign="top">
            <td>
                <asp:UpdatePanel ID="udpAtributeList" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <asp:Panel ID="pnAtributeList" runat="server" GroupingText="Danh sách nhà cung cấp" Width="450px" ScrollBars="Auto">
                            <asp:datagrid id="dg" 
                                Width="100%"
                                runat="server" 
                                CellPadding="2"
                                CellSpacing="0" 
                                AutoGenerateColumns="False"
                                AllowSorting="True" 
                                AllowPaging="true"
                                PageSize="20"
                                PagerStyle-Mode="NumericPages"
                                OnPageIndexChanged="dg_OnPageIndexChanged"
		                        OnItemCommand="dg_ItemCommand" CssClass="dataTable" >
                                <Columns>
			                       <asp:TemplateColumn HeaderText="STT" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate><%# Container.ItemIndex + 1 %></ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateColumn>
			                       <asp:BoundColumn DataField="Title" HeaderText="Tiêu đề"></asp:BoundColumn> 	
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkEdit" runat="server"
                                                CommandName="Edit" Text="Edit" 
                                                CommandArgument='<%# Eval("ID") %>'></asp:LinkButton>
                                        </ItemTemplate>                      
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn>                    
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkDelete" runat="server"
                                                CommandName="Del" Text="Delete" 
                                                CommandArgument='<%# Eval("ID") %>'></asp:LinkButton>
                                                <ajaxc:ConfirmButtonExtender ID="cbeDeleteConfirm" runat="server" 
                                                TargetControlID="lnkDelete" ConfirmText='Bạn đã chắc chắn xóa?' />
                                        </ItemTemplate>    
                                    </asp:TemplateColumn>			    
			                     </Columns>
		                    </asp:datagrid>
	                        <div style="padding-top:5px;"><asp:Button ID="btnNew" runat="server" Text="Thêm mới" CssClass="frmbutton" onclick="btnNew_Click" Width="80px"/></div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td>
                <asp:UpdatePanel ID="udpAtributeDetail" runat="server" UpdateMode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="dg" EventName="EditCommand" />
                        <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="btnNew" EventName="Click" />
                      </Triggers>
                    <ContentTemplate>
                        <asp:Panel ID="EditPanel" runat="server" Enabled="false" 
                            GroupingText="Thêm mới/cập nhật hỗ trợ trực tuyến">
                            <table cellpadding="3" cellspacing="0">                
                               <tr>
                                    <td>Tiêu đề:</td>
                                    <td>
                                        <asp:TextBox ID="txtTitle" runat="server" Text="" Width="150px"></asp:TextBox>
                                       </td>                                    
                                </tr>
                                <tr>
                                    <td>Nickname:</td>
                                    <td>
                                        <asp:TextBox ID="txtNicknam" runat="server" Text="" Width="150px"></asp:TextBox>
                                        </td>
                                </tr>
                             <tr>
                                    <td>Số điện thoại:</td>
                                    <td>
                                        <asp:TextBox ID="txtPhone" runat="server" Width="150px"></asp:TextBox>                       
                                    </td>
                                </tr>
                                 <%--   <tr>
                                    <td>Cổng thanh toán:</td>
                                    <td>
                                        <asp:DropDownList id="ddlPayGate" runat="server" width="154px">
                                            <asp:ListItem Value="onepay">OnePay</asp:ListItem>
                                            <asp:ListItem Value="banknet">BankNet</asp:ListItem>
                                            <asp:ListItem Value="nganluong">Ngân Lượng</asp:ListItem>
                                        </asp:DropDownList>                        
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">Logo:</td>
                                    <td valign="top">
                                        <asp:Label ID="lblError" runat="server" ForeColor="red" />
                                        <table cellpadding="0" cellspacing="0" border="0">
                                            <tr>
                                                <td width="50px" valign="top">Hình 1:</td>
                                                <td><asp:Image ID="imgProduct1" runat="server" />&nbsp;<asp:label ID="lblImg1" runat="server" Font-Italic="true" ForeColor="#FF8000"></asp:label></td>
                                            </tr>
                                            <tr>
                                                <td width="50px">&nbsp;</td>
                                                <td><asp:FileUpload ID="upImg1" runat="server" EnableViewState= "true" /><asp:linkbutton id="lbtnImg1" runat="server" OnClick="lbtnImg1_Click">[Upload]</asp:linkbutton></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">Phí giao dịch:</td>
                                    <td>
                                        Cố định <asp:TextBox ID="txtTransValue" runat="server" Width="70px"></asp:TextBox>
                                        Tỉ lệ <asp:TextBox ID="txtTransRate" runat="server" Width="70px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">Khuyến mại:</td>
                                    <td>
                                        Cố định <asp:TextBox ID="txtCouponValue" runat="server" Width="70px"></asp:TextBox>
                                        Tỉ lệ <asp:TextBox ID="txtCouponRate" runat="server" Width="70px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">Trạng thái:</td>
                                    <td>
                                        <asp:CheckBox ID="chkStatus" runat="server" Text="Giao dịch" />
                                    </td>
                                </tr>--%>
                                 <tr>
                                     <td>
                                         Kiểu:</td>
                                     <td>
                                         <asp:DropDownList ID="DropDownList1" runat="server">
                                             <asp:ListItem Value="1">Yahoo</asp:ListItem>
                                             <asp:ListItem Value="2">Skype</asp:ListItem>
                                         </asp:DropDownList>
                                     </td>
                                </tr>
                                 <tr>
			                        <td colspan="2">
			                            <asp:Button id="btnSave"  runat="server" Text="Lưu lại" onclick="btnSave_Click" Width="80px" />&nbsp;&nbsp;
                                        <asp:Button id="btnCancel"  runat="server" Text="Hủy bỏ" onclick="btnCancel_Click" Width="80px" />
			                        </td>
		                        </tr> 
                            </table>  
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
                </div>
            </div>
        </div>
    </div>
</div>