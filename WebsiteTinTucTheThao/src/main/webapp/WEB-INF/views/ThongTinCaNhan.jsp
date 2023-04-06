<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thể thao 365 - Báo điện tử Thể Thao 365</title>
        <link rel="stylesheet" href="/Styles/ThongTinCaNhan.css">
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
                        <div class="tieuDe">
                            <p>Thông tin cá nhân</p>
                        </div>
                        <div style="color: green; font-size: 16px">${OK}</div>
                        <div id="info">
                        </div>
                        <div class="tieuDe">
                            <p>Thông tin tài khoản</p>
                        </div>
                        <p>Tên tài khoản: ${sessionScope.TENDANGNHAP}</p>
                        <p><a href="/doi-mat-khau">Đổi mật khẩu</a></p>
                    </div>
                </div>
            </div>
            <%@include file="CuoiTrang.jsp" %>
        </div>
        <script>
            var userid = document.getElementById("userid").value;
            console.log(userid);
            fetch('/api/tai-khoan/' + userid)
                    .then(response => response.json())
                    .then(data => {
                        html = '<p>Họ và Tên: ' + data.hoTen + '</p><p>Ngày sinh: ' + format(data.ngaySinh) + '</p><p>Giới tính: ' + ((data.gioiTinh) ? "Nam" : "Nữ") + '</p><p>Số điện thoại: ' + data.soDT + '</p><p>Email: ' + data.email + '</p><p><a href="/nguoi-dung/cap-nhat">Chỉnh sửa thông tin</a></p>';
                        console.log(html);
                        document.getElementById('info').innerHTML = html;
                    })

            function format(date) {
                date = new Date(date);
                var day = ('0' + date.getDate()).slice(-2);
                var month = ('0' + (date.getMonth() + 1)).slice(-2);
                var year = date.getFullYear();
                return day + '/' + month + '/' + year;
            }
        </script>
    </body>

</html>
