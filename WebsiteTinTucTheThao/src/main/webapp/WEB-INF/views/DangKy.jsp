<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thể thao 365 - Báo điện tử Thể Thao 365</title>
        <link rel="stylesheet" href="/Styles/DangKy.css">
        <link href="/Styles/chung.css" rel="stylesheet" type="text/css"/>
        <link href="/fonts/themify-icons/themify-icons.css" rel="stylesheet">
    </head>
    <body>
        <div class="lopBao">
            <%@include file="DauTrang.jsp" %>
            <h2>${OK}</h2>
            <div class="noiDung">
                <div class="bao">
                    <h1>Đăng Ký</h1>
                    <div style="color: red; font-size: 16px">${ERROR}</div>
                    <form action="/dang-ky" method="post" id="formDangKy" >
                        <div class="tieuDe">Thông tin cá nhân</div>
                        <p>Họ và Tên</p>
                        <input type="text" name="hoTen" id="hoTen" placeholder="Nhập Họ và Tên" >
                        <p>Ngày sinh</p>
                        <input type="date" name="ngaySinh" id="ngaySinh" >
                        <p>Giới tính</p>
                        <input type="radio" id="gioiTinh" name="gioiTinh" value="1" checked="checked">Nam
                        <input type="radio" id="gioiTinh" name="gioiTinh" value="0">Nữ
                        <p>Số điện thoại</p>
                        <input type="number" id="dienThoai" name="dienThoai" placeholder="Nhập số điện thoại" >
                        <p>Email</p>
                        <input type="email" name="email" id="email" placeholder="Nhập email" >
                        <div class="tieuDe">Thông tin tài khoản</div>
                        <p>Tên đăng nhập</p>
                        <input type="text" name="tenDangNhap" id="tenDangNhap" placeholder="Nhập tên đăng nhập">
                        <p>Mật khẩu</p>
                        <input type="password" name="matKhau" id="matKhau" placeholder="Nhập mật khẩu">
                        <p>Nhập lại mật khẩu</p>
                        <input type="password" name="re_matKhau" id="re_matKhau" placeholder="Nhập lại mật khẩu">
                        <input type="button" value="Đăng ký" id="btnDangKy" onclick="dangky()">
                    </form>
                </div>
            </div>
            <%@include file="CuoiTrang.jsp" %>
        </div>
        <script>
            function dangky() {
                var hoTen = document.getElementById("hoTen").value;
                var ngaySinh = document.getElementById("ngaySinh").value;
                var gioiTinh = document.getElementById("gioiTinh").value;
                var dienThoai = document.getElementById("dienThoai").value;
                var email = document.getElementById("email").value;
                var tenDangNhap = document.getElementById("tenDangNhap").value;
                var matKhau = document.getElementById("matKhau").value;
                var re_matKhau = document.getElementById("re_matKhau").value;
                if (hoTen == '' || ngaySinh == '' || gioiTinh == '' || dienThoai == '' || email == '' || tenDangNhap == '' || matKhau == '' || re_matKhau == '')
                    window.alert("Vui lòng nhập đủ tất cả các trường dữ liệu");
                else if (matKhau != re_matKhau)
                    window.alert("Mật khẩu không trùng khớp");
                else {
                    document.getElementById('formDangKy').submit();
                }
            }

        </script>
    </body>

</html>
