<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thể thao 365 - Báo điện tử Thể Thao 365</title>
        <link rel="stylesheet" href="/Styles/DangNhap.css">
        <link href="/Styles/chung.css" rel="stylesheet" type="text/css"/>
        <link href="/fonts/themify-icons/themify-icons.css" rel="stylesheet">
    </head>
    <body>
        <div class="lopBao">
            <%@include file="DauTrang.jsp" %>
            <div class="noiDung">
                <div class="bao">
                    <h1>Đăng nhập</h1>
                    <div style="color: red; font-size: 16px">${ERROR}</div>
                    <div style="color: green; font-size: 16px">${OK}</div>
                    <form action="/dang-nhap" method="post" id="formDangNhap">
                        <p>Tên đăng nhập</p>
                        <input type="text" name="tenDangNhap" id="tenDangNhap" placeholder="Nhập tên đăng nhập">
                        <p>Mật khẩu</p>
                        <input type="password" name="matKhau" id="matKhau" placeholder="Nhập mật khẩu">
                        <input type="button" value="Đăng nhập" id="btnDangNhap" onclick="dangnhap()">
                        <p><a href="/forgot-password">Bạn quên mật khẩu?</a></p>
                    </form>
                </div>
            </div>
            <%@include file="CuoiTrang.jsp" %>
        </div>
        <script>
            function dangnhap() {
                var tenDangNhap = document.getElementById('tenDangNhap').value;
                var matKhau = document.getElementById('matKhau').value;
                if (!tenDangNhap || !matKhau) {
                    window.alert("Vui lòng nhập đủ tên đăng nhập và mật khẩu");
                } else {
                    document.getElementById('formDangNhap').submit();
                }
            }
        </script>
    </body>

</html>
