<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddModule.ascx.cs" Inherits="Musicviet.Administrators.Modules.AddModule" %>
<%@ Register TagPrefix="ajaxc" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=4.1.60623.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>
<div class="container" id="actualbody">
    <div class="row">
        <div class="widget clearfix">
            <h2>
                Cập nhật/ Thêm mới module</h2>
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
                        <asp:Panel ID="pnAtributeList" runat="server" GroupingText="Danh sách module" Width="450px" ScrollBars="Auto">
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
			                       <asp:BoundColumn DataField="NameModule" HeaderText="Tên Module"></asp:BoundColumn> 	
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
                            GroupingText="Thêm mới/cập nhật module">
                            <table cellpadding="3" cellspacing="0">                
                               <tr>
                                    <td>Tên module:</td>
                                    <td>
                                        <asp:TextBox ID="txtTitle" runat="server" Text="" Width="150px"></asp:TextBox>
                                       </td>                                    
                                </tr>
                                <tr>
                                    <td>Kiểu hiển thị:</td>
                                    <td>
                                        <asp:DropDownList ID="ddlType" runat="server">
                                             <asp:ListItem Value="1">Sản phẩm</asp:ListItem>
                                            <%-- <asp:ListItem Value="2">Tin tức</asp:ListItem>--%>
                                         </asp:DropDownList>
                                        </td>
                                </tr>
                             <%--<tr>
                                    <td>Phương thức:</td>
                                    <td>
                                        <asp:DropDownList ID="ddlTarget" runat="server">
                                             <asp:ListItem Value="1">Trang hiện tại</asp:ListItem>
                                             <asp:ListItem Value="2">Trang mới</asp:ListItem>
                                         </asp:DropDownList>
                                    </td>
                                </tr>--%>
                                
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