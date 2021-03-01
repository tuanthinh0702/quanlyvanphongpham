<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Setting.ascx.cs" Inherits="Musicviet.Administrators.Modules.Setting" %>
<div class="container" id="actualbody">
    <div class="row">
        <div class="widget clearfix">
            <h2>
                Cài đặt hệ thống
            </h2>
            <div class="widget_inside">
                <div class="col_12">
                    <div style="width: 100%; text-align: center">
                         <asp:Label ID="lblError" runat="server" ForeColor="Red" EnableViewState="False" />
                    </div>
                    <table style="width: 100%;">
                        <tr>
                            <td class="style6">
                                Mã cài đặt</td>
                            <td class="style3">
                                <asp:TextBox ID="txtCode" 
                                    runat="server" Height="25px" Width="320px" ReadOnly="True"></asp:TextBox>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="txtCode" ErrorMessage="*" ForeColor="Red" 
                                    ValidationGroup="ad"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                           <asp:Panel ID="UpdatePanel1" runat="server">
                            <td class="style6"> Giá trị cài đặt</td>
                               <td class="style3">
                                  <asp:TextBox ID="txtValue" 
                                    runat="server" Height="25px" Width="320px" MaxLength="150"></asp:TextBox>
                                  &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="txtValue" ErrorMessage="*" ForeColor="Red" 
                                    ValidationGroup="ad"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                &nbsp;
                               </td>
                          </asp:Panel>
                            <asp:Panel ID="UpdatePanel2" runat="server">
                            <td class="style6"> Giá trị cài đặt</td>
                               <td class="style3">
                                  <asp:TextBox ID="txtValue1" 
                                    runat="server" Height="100px" Width="320px" TextMode="MultiLine" MaxLength="150"></asp:TextBox>
                                  &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                    ControlToValidate="txtValue1" ErrorMessage="*" ForeColor="Red" 
                                    ValidationGroup="ad"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                &nbsp;
                               </td>
                          </asp:Panel>
                        </tr>
                        <tr>
                            <td class="style6">
                                Mô tả</td>
                            <td class="style3">
                                <asp:TextBox ID="txtDes" 
                                    runat="server" Height="25px" Width="320px"></asp:TextBox>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="txtDes" ErrorMessage="*" ForeColor="Red" 
                                    ValidationGroup="ad"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style8">
                                </td>
                            <td class="style5">
                                 <asp:Button ID="btnSave" runat="server" Text="Lưu lại" OnClick="btnSave_Click" 
                                     Width="80px" ValidationGroup="ad">
                    </asp:Button> </td>
                            <td class="style2">
                                </td>
                        </tr>
                        <tr>
                            <td class="style6">
                                &nbsp;</td>
                            <td class="style3">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>