<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thể thao 365 - Báo điện tử Thể Thao 365</title>
        <link rel="stylesheet" href="/Styles/CapNhatThongTinCaNhan.css">
        <link href="/Styles/chung.css" rel="stylesheet" type="text/css"/>
        <link href="/fonts/themify-icons/themify-icons.css" rel="stylesheet">
    </head>
    <body>
        <div class="lopBao">
            <%@include file="DauTrang.jsp" %>
            <div class="noiDung">
                <div class="bao">
                    <input type="hidden" id="userid">
                    <div class="trai">
                        <ul>
                            <li class="ttcn"><a href="/nguoi-dung" >Thông tin cá nhân</a></li>
                        </ul>
                    </div>
                    <div class="phai">
                        <div class="bao">
                            <div class="tieuDe"><p>Chỉnh sửa thông tin cá nhân</p></div>
                            <input type="hidden" id="ngay" value="${NGUOIDUNG.getNgaySinh()}">
                            <form action="/nguoi-dung/cap-nhat" method="post" id="formLuu">
                                <p>Họ và Tên</p>
                                <input type="text" name="hoTen" id="hoTen" placeholder="Nhập Họ và Tên" value="${NGUOIDUNG.getHoTen()}">
                                <p>Ngày sinh</p>
                                <input type="date" name="ngaySinh" id="ngaySinh" value="">
                                <p>Giới tính</p>
                                <c:if test="${NGUOIDUNG.getGioiTinh()}">
                                    <input type="radio" id="gioiTinh" name="gioiTinh" value="1" checked="checked">Nam
                                    <input type="radio" id="gioiTinh" name="gioiTinh" value="0">Nữ
                                </c:if>
                                <c:if test="${!NGUOIDUNG.getGioiTinh()}">
                                    <input type="radio" id="gioiTinh" name="gioiTinh" value="1">Nam
                                    <input type="radio" id="gioiTinh" name="gioiTinh" value="0" checked="checked">Nữ
                                </c:if>
                                <p>Số điện thoại</p>
                                <input type="number" id="dienThoai" name="dienThoai" placeholder="Nhập số điện thoại" value="${NGUOIDUNG.getSoDT()}">
                                <p>Email</p>
                                <input type="email" name="email" id="email" placeholder="Nhập email" value="${NGUOIDUNG.getEmail()}">
                                <button onclick="luu()">Lưu thông tin</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file="CuoiTrang.jsp" %>
        </div>
        <script>
            function luu() {
                var hoTen = document.getElementById("hoTen").value;
                var ngaySinh = document.getElementById("ngaySinh").value;
                var gioiTinh = document.getElementById("gioiTinh").value;
                var dienThoai = document.getElementById("dienThoai").value;
                var email = document.getElementById("email").value;
                if (hoTen == '' || ngaySinh == '' || gioiTinh == '' || dienThoai == '' || email == '')
                    window.alert("Vui lòng nhập đủ tất cả các trường dữ liệu");
                else {
                    document.getElementById('formDangKy').submit();
                }
            }

            var ngay = format(document.getElementById('ngay').value);
            document.getElementById('ngaySinh').value = ngay;

            function format(date) {
                date = new Date(date);
                var day = ('0' + date.getDate()).slice(-2);
                var month = ('0' + (date.getMonth() + 1)).slice(-2);
                var year = date.getFullYear();
                return year + '-' + month + '-' + day;
            }
        </script>
    </body>

</html>
