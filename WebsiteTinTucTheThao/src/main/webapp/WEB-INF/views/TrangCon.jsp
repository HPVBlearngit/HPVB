<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thể thao 365 - Báo điện tử Thể Thao 365</title>
        <link rel="stylesheet" href="/Styles/TrangCon.css">
        <link href="/Styles/chung.css" rel="stylesheet" type="text/css"/>
        <link href="/fonts/themify-icons/themify-icons.css" rel="stylesheet">
    </head>
    <body>
        <div class="lopBao">
            <%@include file="DauTrang.jsp" %>
            <div class="noiDung">
                <input type="hidden" id="theLoai" value="${IDTheLoai}">
                <div class="trai" id="ndTrai">
                </div>
                <div class="phai">
                    <div class="tieuDe"><p>Tin mới nhất</p></div>
                    <div id='ndPhai'></div>
                </div>
            </div>
            <%@include file="CuoiTrang.jsp" %>
        </div>
        <script>
            var theloai = document.getElementById('theLoai').value;
            if (theloai == 0) {
                var url = location.href.split('/');
                var giaTri = url[url.length - 1];
                fetch('/api/tintuc/tim-kiem/' + giaTri)
                        .then(response => response.json())
                        .then(data => {
                            var htmls = data.map(function (d) {
                                return '<div class="bao"><img src="' + d.hinh + '" alt="Ảnh"><div class="chiTiet"><div class="tieuDe"><a href="/tintuc/' + d.id + '">' + d.tieuDe + '</a></div><div class="thoiGian">' + format(d.ngayTao) + '</div><div class="moTaNgan">' + d.tomTat + '</div></div></div>';
                            })
                            html = htmls.join(' ');
                            document.getElementById('ndTrai').innerHTML = html;
                        })
            } else {
                fetch('/api/tintuc/' + theloai)
                        .then(response => response.json())
                        .then(data => {
                            var htmls = data.map(function (d) {
                                return '<div class="bao"><img src="' + d.hinh + '" alt="Ảnh"><div class="chiTiet"><div class="tieuDe"><a href="/tintuc/' + d.id + '">' + d.tieuDe + '</a></div><div class="thoiGian">' + format(d.ngayTao) + '</div><div class="moTaNgan">' + d.tomTat + '</div></div></div>';
                            })
                            html = htmls.join(' ');
                            document.getElementById('ndTrai').innerHTML = html;
                        })
            }
            fetch('/api/tintuc/top10')
                    .then(response => response.json())
                    .then(data => {
                        var htmls = data.map(function (d) {
                            return '<div class="TDTin"><a href="/tintuc/' + d.id + '">' + d.tieuDe + '</a></div>';
                        })
                        html = htmls.join(' ');
                        document.getElementById('ndPhai').innerHTML = html;
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
