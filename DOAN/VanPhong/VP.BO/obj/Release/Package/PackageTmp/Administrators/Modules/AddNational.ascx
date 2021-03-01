<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddNational.ascx.cs" Inherits="Musicviet.Administrators.Modules.AddNational" %>
<%@ Register TagPrefix="ajaxc" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=4.1.60623.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>
<div class="container" id="actualbody">
    <div class="row">
        <div class="widget clearfix">
            <h2>
                Cài đặt hệ thống
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
			                       <asp:BoundColumn DataField="NationalName" HeaderText="Tên nhà sản xuất"></asp:BoundColumn> 	
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkEdit" runat="server"
                                                CommandName="Edit" Text="Edit" 
                                                CommandArgument='<%# Eval("NationalID") %>'></asp:LinkButton>
                                        </ItemTemplate>                      
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn>                    
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkDelete" runat="server"
                                                CommandName="Del" Text="Delete" 
                                                CommandArgument='<%# Eval("NationalID") %>'></asp:LinkButton>
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
                            GroupingText="Thêm mới/cập nhật nhà cung cấp" Width="390px">
                            <table cellpadding="3" cellspacing="0">                
                               <tr>
                                    <td>Tên nhà sản xuất:</td>
                                    <td>
                                        <asp:TextBox ID="txtName" runat="server" Text="" Width="150px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="descriptionValidator" runat="server" ControlToValidate="txtName" ErrorMessage="*" EnableClientScript="false" SetFocusOnError="True" /> 
                                    </td>                                    
                                </tr>
                                <tr>
                                    <td>Địa chỉ:</td>
                                    <td>
                                        <asp:TextBox ID="txtadd" runat="server" Text="" Width="150px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtadd" ErrorMessage="*" EnableClientScript="false" SetFocusOnError="True" /> 
                                    </td>                                    
                                </tr>
                                 <tr>
                                    <td>Số điện thoại:</td>
                                    <td>
                                        <asp:TextBox ID="txtphone" runat="server" Text="" Width="150px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtphone" ErrorMessage="*" EnableClientScript="false" SetFocusOnError="True" /> 
                                    </td>                                    
                                </tr>
                                 <tr>
                                   <td class="style2">Hình mô tả:</td>
                                   <td>
                                       <asp:Image ID="img1" runat="server" Width="25px" Height="25" />&nbsp;
                                       <asp:Label ID="lblImg1" runat="server" Font-Italic="true" ForeColor="#ffffff" Text="<%=imageName %>"></asp:Label>
                                   </td>
                                </tr>
                                <tr>
                                <td class="style2"> &nbsp;</td>
                                  <td>
                                       <asp:FileUpload ID="upImg1" runat="server" EnableViewState="true" 
                                           Width="183px" />
                                       <asp:Button ID="btnUpload" runat="server" Text="[Upload]" Width="61px" 
                                           onclick="btnUpload_Click"/>
                                  </td>
                               </tr>
                                <tr>
                                    <td>Thứ tự:</td>
                                    <td>
                                        <asp:TextBox ID="txtOrder" runat="server" Text="" Width="150px" MaxLength="5"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOrder" ErrorMessage="*" EnableClientScript="false" SetFocusOnError="True" /> 
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