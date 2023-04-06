<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="dauTrang">
    <div class="logo">
        <div class="chu">
            <a href="/">THETHAO365</a>
        </div>
    </div>
    <div class="menu">
        <div class="taiKhoan">
            <i class="ti-user"></i>
            <ul>    
                <c:if test="${empty sessionScope.TAIKHOANID}">
                    <li><a href="/dang-nhap">Đăng nhập</a></li>
                    <li><a href="/dang-ky">Đăng ký</a></li>
                </c:if>
                <c:if test="${not empty sessionScope.TAIKHOANID}">
                    <li><a href="/nguoi-dung">Tài khoản</a></li>
                    <li><a href="/yeu-thich">Yêu thích</a></li>
                    <li><a href="/dang-xuat">Đăng xuất</a></li>
                </c:if>
            </ul>
        </div>
        <div class="timKiem">
            <i class="ti-search"></i>
            <div class="thanhTim">
                <input type="text" id="inpSearch" placeholder="Tìm kiếm" onkeydown="search()">
                <a onclick="timkiem()" style="cursor:pointer"><i class="ti-search"></i></a>
            </div>
        </div>
        <ul>
            <li><a href="/">Trang chủ</a></li>
            <c:if test="${sessionScope.LOAITK == 0}">
                <li><a href="/quan-ly-tin">Quản lý</a></li>
            </c:if>
            <li><a href="/1">Bóng đá</a></li>
            <li><a href="/2">Bóng chuyền</a></li>
            <li><a href="/3">Bóng rổ</a></li>
            <li><a href="/4">Esports</a></li>
        </ul>
    </div>
</div>
<script>
    function timkiem() {
        var input = document.getElementById('inpSearch').value;
        if (input)
            window.location = '/tim-kiem/' + input;
    }
    function search() {
        if (event.keyCode == 13) {
            timkiem();
        }
    }
</script>

