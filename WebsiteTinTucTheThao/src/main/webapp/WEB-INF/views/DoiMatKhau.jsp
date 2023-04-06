<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thể thao 365 - Báo điện tử Thể Thao 365</title>
        <link rel="stylesheet" href="/Styles/DoiMatKhau.css">
        <link href="/Styles/chung.css" rel="stylesheet" type="text/css"/>
        <link href="/fonts/themify-icons/themify-icons.css" rel="stylesheet">
    </head>
    <body>
        <div class="lopBao">
            <%@include file="DauTrang.jsp" %>
            <div class="noiDung">
                <div class="bao">
                    <input type="hidden" id="userid" value="${sessionScope.NGUOIDUNGID}">
                    <div class="trai">
                        <ul>
                            <li class="ttcn"><a href="/nguoi-dung" >Thông tin cá nhân</a></li>
                        </ul>
                    </div>
                    <div class="phai">
                        <form action="/doi-mat-khau" method="post" id="formDoiMatKhau">
                            <div class="bao">
                                <div class="tieuDe"><p>Đổi mật khẩu</p></div>
                                <p style="color: red; font-size: 12px">${ERROR}</p>
                                <p>Mật khẩu cũ</p>
                                <input type="password" name="MKcu" id="MKcu">
                                <p>Mật khẩu mới</p>
                                <input type="password" name="MK" id="MK">
                                <p>Nhập lại mật khẩu mới</p>
                                <input type="password" name="reMK" id="reMK">
                                <a onclick="doiMK()">Lưu mật khẩu</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <%@include file="CuoiTrang.jsp" %>
        </div>
        <script>
            function doiMK(){
                var MK = document.getElementById("MK").value;
                var reMK = document.getElementById("reMK").value;
                var MKcu = document.getElementById("MKcu").value;
                if (!MK || !reMK || !MKcu) {
                    window.alert("Vui lòng nhập đủ tất cả các trường");
                } else if(MK != reMK)
                    window.alert("Mật khẩu mới không trùng khớp");
                else{
                    document.getElementById('formDoiMatKhau').submit();
                }
            }
        </script>
    </body>

</html>
