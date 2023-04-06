<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thể thao 365 - Báo điện tử Thể Thao 365</title>
        <link rel="stylesheet" href="/Styles/QuanLy.css">
        <link href="/Styles/chung.css" rel="stylesheet" type="text/css"/>
        <link href="/fonts/themify-icons/themify-icons.css" rel="stylesheet">
    </head>
    <body>
        <div class="lopBao">
            <%@include file="DauTrang.jsp" %>
            <div class="noiDung">
                <div class="bao">
                    <div class="trai">
                        <ul>
                            <li class="ql"><a href="/quan-ly-tin">Quản lý tin tức</a></li>
                            <li><a href="/y-kien-ban-doc">Ý kiến bạn đọc</a></li>
                        </ul>
                    </div>
                    <div class="phai">
                        <div class="tieuDe">
                            <p>Quản lý tin tức</p>
                        </div>
                        <div class="dau">
                            <div class="them">
                                <button onclick="window.location = '/tin-tuc/them'">Thêm tin mới</button>
                            </div>
                            <div class="tim">
                                <input type="text" name="search" id="search">
                                <button onclick="timTin()">Tìm kiếm</button>
                            </div>
                        </div>
                        <div id="ndTin">
                        </div>
                    </div>
                </div>
                <%@include file="CuoiTrang.jsp" %>
            </div>
            <script>
                var requestOptions = {
                    method: 'GET',
                    redirect: 'follow'
                };
                var s = '<table border="1"><thead><tr><th>ID</th><th>Ngày đăng</th><th>Hình ảnh</th><th>Tiêu đề</th><th>Loại tin</th><th>Tóm tắt</th><th>Hành động</th></tr></thead><tbody>'
                fetch("/api/tintuc", requestOptions)
                        .then(response => response.json())
                        .then(data => {
                            var htmls = data.map(function (d) {
                                return '<tr><td>' + d.id + '</td><td>' + format(d.ngayTao) + '</td><td style="width: 10%;"><img src="' + d.hinh + '" alt="Ảnh"></td><td >' + d.tieuDe + '</td><td >' + d.theLoai.ten + '</td><td >' + d.tomTat + '</td><td><a href="/tin-tuc/sua/' + d.id + '">Sửa</a><a href="/tin-tuc/xoa/' + d.id + '">Xoá</a></td></tr>';
                            })
                            console.log(htmls);
                            s += htmls.join(' ');
                            s += '</tbody></table>'
                            document.getElementById("ndTin").innerHTML = s;
                        })
                        .catch(error => console.log('error', error));

                function timTin() {
                    var text = document.getElementById('search').value;
                    if (text) {
                        s = '<table border="1"><thead><tr><th>ID</th><th>Ngày đăng</th><th>Hình ảnh</th><th>Tiêu đề</th><th>Loại tin</th><th>Tóm tắt</th><th>Hành động</th></tr></thead><tbody>'
                        fetch("/api/tintuc/tim-kiem/" + text, requestOptions)
                                .then(response => response.json())
                                .then(data => {
                                    var htmls = data.map(function (d) {
                                        return '<tr><td>' + d.id + '</td><td>' + format(d.ngayTao) + '</td><td style="width: 10%;"><img src="' + d.hinh + '" alt="Ảnh"></td><td >' + d.tieuDe + '</td><td >' + d.theLoai.ten + '</td><td >' + d.tomTat + '</td><td><a href="/tin-tuc/sua/' + d.id + '">Sửa</a><a href="/tin-tuc/xoa/' + d.id + '">Xoá</a></td></tr>';
                                    })
                                    console.log(htmls);
                                    s += htmls.join(' ');
                                    s += '</tbody></table>'
                                    document.getElementById("ndTin").innerHTML = s;
                                })
                                .catch(error => console.log('error', error));
                    }
                }
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
