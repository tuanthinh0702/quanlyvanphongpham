<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sidebar.ascx.cs" Inherits="IPAY.AGENT.Controls.Sidebar" %>
<nav>
    <ul id="accordion" class="sf-menu mobile-hide row clearfix">
       <li>
            <div><span>Trang chủ</span></div>
            <ul style="width: 100%">
                <li><a href="Home.aspx?module=home">Trang chủ</a></li>
            </ul>
        </li>
         <li>
            <div><span>KH/Order</span></div>
            <ul style="width: 100%">
                 <li><a href="Home.aspx?module=OrderItemMgr">Danh sách đơn hàng /KH</a></li>
            </ul>
        </li>
          <li>
            <div><span>Sản phẩm</span></div>
            <ul style="width: 100%">
                 <li><a href="Home.aspx?module=OrderItemMgr">Danh sách khách hàng</a></li>
                 <li><a href="Home.aspx?module=ProductMgr">Quản lý sản phẩm</a></li>
                 <li><a href="Home.aspx?module=AddPro">Thêm mới sản phẩm</a></li>
                 <li><a href="Home.aspx?module=CatePro">Quản lý mục sản phẩm</a></li>
                 <li><a href="Home.aspx?module=AddNational">Nhà sản xuất(cung cấp)</a></li>
                 <li><a href="Home.aspx?module=AddMade">Xuất sứ sản phẩm</a></li>
                 <li><a href="Home.aspx?module=AddColor">Mầu sắc sản phẩm</a></li>
                 <li><a href="Home.aspx?module=AddUnit">Đơn vị sản phẩm</a></li>
                 <li><a href="Home.aspx?module=AddSize">Kích thước(cỡ)</a></li>
            </ul>
        </li>
        <li>
            <div><span>Liên Kết(top product)</span></div>
            <ul style="width: 100%">
                <li><a href="Home.aspx?module=LinktMgr">Quản lý top </a></li>
                <li><a href="Home.aspx?module=Link">Thêm mới top</a></li>
           </ul>
        </li>
        <li>
            <div><span>Tin tức</span></div>
            <ul style="width: 100%">
                <li><a href="Home.aspx?module=NewsMgr">Quản lý tin tức</a></li>
                 <li><a href="Home.aspx?module=AddNews">Thêm mới tin tức</a></li>
                 <li><a href="Home.aspx?module=Cate">Quản lý mục tin tức</a></li>
                  
            </ul>
        </li>
         <li>
            <div><span>Dịch vụ khác</span></div>
            <ul style="width: 100%">
                <li><a href="Home.aspx?module=CateOtherMgrList">Quản lý dịch vụ</a></li>
               <%--  <li><a href="Home.aspx?module=AddNewsOther">Thêm mới dịch vụ</a></li>--%>
                 <li><a href="Home.aspx?module=CateOther">Quản lý mục dịch vụ</a></li>
                  
            </ul>
        </li>
         <%-- <li>
            <div><span>Chăm sóc KH</span></div>
            <ul style="width: 100%">
                <li><a href="Home.aspx?module=NewsMgrCustomer">Quản lý CSKH</a></li>
                 <li><a href="Home.aspx?module=AddNewsCustomer">Thêm mới CSKH</a></li>
                 <li><a href="Home.aspx?module=CateCustomer">Quản lý mục CSKH</a></li>
                  
            </ul>
        </li>--%>
        <li>
            <div><span>Slider</span></div>
            <ul style="width: 100%">
                <li><a href="Home.aspx?module=SliderMgr">Quản lý Slider</a></li>
                   <li><a href="Home.aspx?module=Slider">Thêm mới Slider</a></li>
            </ul>
        </li>
           <li>
            <div><span>Cài Đặt</span></div>
            <ul style="width: 100%">
                <li><a href="Home.aspx?module=About&id=3">Giới thiệu</a></li>
                <li><a href="Home.aspx?module=SettingMgr">Cài đặt chung</a></li>
                <li><a href="Home.aspx?module=Support">Thông tin hỗ trợ</a></li>
                <li><a href="Home.aspx?module=Header&id=1">Thông tin logo</a></li>
                <li><a href="Home.aspx?module=Footer&id=2">Thông tin footer</a></li>
                   <%--<li><a href="Home.aspx?module=AddModule">Thêm Module</a></li>--%>
            </ul>
        </li>
    </ul>
</nav>
