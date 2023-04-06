<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thể thao 365 - Báo điện tử Thể Thao 365</title>
        <link rel="stylesheet" href="/Styles/TrangChu.css">
        <link href="/Styles/chung.css" rel="stylesheet" type="text/css"/>
        <link href="/fonts/themify-icons/themify-icons.css" rel="stylesheet">
    </head>
    <body>
        <div class="lopBao">
            <%@include file="DauTrang.jsp" %>
            <h2>${OK}</h2>
            <div class="noiDung">
                <div class="lopBao">
                    <div class="tieude"><p><a href="/1">Bóng đá</a></p></div>
                    <div class="trai" id="traiBD">
                    </div>
                    <div class="phai" id="phaiBD">
                    </div>
                </div>
                <div class="lopBao">
                    <div class="tieude"><p><a href="/2">Bóng chuyền</a></p></div>
                    <div class="trai" id="traiBC">
                    </div>
                    <div class="phai" id="phaiBC">
                    </div>
                </div>
                <div class="lopBao">
                    <div class="tieude"><p><a href="/3">Bóng rổ</a></p></div>
                    <div class="trai" id="traiBR">
                    </div>
                    <div class="phai" id="phaiBR">
                    </div>
                </div>
                <div class="lopBao">
                    <div class="tieude"><p><a href="/4">Esports</a></p></div>
                    <div class="trai" id="traiE">
                    </div>
                    <div class="phai" id="phaiE">
                    </div>
                </div>
            </div>
            <%@include file="CuoiTrang.jsp" %>
        </div>
        <script>

            fetch('/api/tintuc/top1/1')
                    .then(response => response.json())
                    .then(data => {
                        html = '<img src="' + data.hinh + '" alt="Ảnh"><div class="tieuDe"><a href="/tintuc/' + data.id + '">' + data.tieuDe + '</a></div><div class="thoiGian">' + format(data.ngayTao) + '</div><div class="moTaNgan">' + data.tomTat + '</div>'
                        document.getElementById('traiBD').innerHTML = html;
                    })
            fetch('/api/tintuc/top3/1')
                    .then(response => response.json())
                    .then(data => {
                        var htmls = data.map(function (d) {
                            return '<div class="bao"><img src="' + d.hinh + '" alt="Ảnh"><div class="noiDung"><div class="tieuDe"><a href="/tintuc/' + d.id + '">' + d.tieuDe + '</a></div><div class="thoiGian">' + format(d.ngayTao) + '</div><div class="moTaNgan">' + d.tomTat + '</div></div></div>';
                        })
                        html = htmls.join(' ');
                        document.getElementById('phaiBD').innerHTML = html;
                    })
            fetch('/api/tintuc/top1/2')
                    .then(response => response.json())
                    .then(data => {
                        html = '<img src="' + data.hinh + '" alt="Ảnh"><div class="tieuDe"><a href="/tintuc/' + data.id + '">' + data.tieuDe + '</a></div><div class="thoiGian">' + format(data.ngayTao) + '</div><div class="moTaNgan">' + data.tomTat + '</div>'
                        document.getElementById('traiBC').innerHTML = html;
                    })
            fetch('/api/tintuc/top3/2')
                    .then(response => response.json())
                    .then(data => {
                        var htmls = data.map(function (d) {
                            return '<div class="bao"><img src="' + d.hinh + '" alt="Ảnh"><div class="noiDung"><div class="tieuDe"><a href="/tintuc/' + d.id + '">' + d.tieuDe + '</a></div><div class="thoiGian">' + format(d.ngayTao) + '</div><div class="moTaNgan">' + d.tomTat + '</div></div></div>';
                        })
                        html = htmls.join(' ');
                        document.getElementById('phaiBC').innerHTML = html;
                    })
            fetch('/api/tintuc/top1/3')
                    .then(response => response.json())
                    .then(data => {
                        html = '<img src="' + data.hinh + '" alt="Ảnh"><div class="tieuDe"><a href="/tintuc/' + data.id + '">' + data.tieuDe + '</a></div><div class="thoiGian">' + format(data.ngayTao) + '</div><div class="moTaNgan">' + data.tomTat + '</div>'
                        document.getElementById('traiBR').innerHTML = html;
                    })
            fetch('/api/tintuc/top3/3')
                    .then(response => response.json())
                    .then(data => {
                        var htmls = data.map(function (d) {
                            return '<div class="bao"><img src="' + d.hinh + '" alt="Ảnh"><div class="noiDung"><div class="tieuDe"><a href="/tintuc/' + d.id + '">' + d.tieuDe + '</a></div><div class="thoiGian">' + format(d.ngayTao) + '</div><div class="moTaNgan">' + d.tomTat + '</div></div></div>';
                        })
                        html = htmls.join(' ');
                        document.getElementById('phaiBR').innerHTML = html;
                    })
            fetch('/api/tintuc/top1/4')
                    .then(response => response.json())
                    .then(data => {
                        html = '<img src="' + data.hinh + '" alt="Ảnh"><div class="tieuDe"><a href="/tintuc/' + data.id + '">' + data.tieuDe + '</a></div><div class="thoiGian">' + format(data.ngayTao) + '</div><div class="moTaNgan">' + data.tomTat + '</div>'
                        document.getElementById('traiE').innerHTML = html;
                    })
            fetch('/api/tintuc/top3/4')
                    .then(response => response.json())
                    .then(data => {
                        var htmls = data.map(function (d) {
                            return '<div class="bao"><img src="' + d.hinh + '" alt="Ảnh"><div class="noiDung"><div class="tieuDe"><a href="/tintuc/' + d.id + '">' + d.tieuDe + '</a></div><div class="thoiGian">' + format(d.ngayTao) + '</div><div class="moTaNgan">' + d.tomTat + '</div></div></div>';
                        })
                        html = htmls.join(' ');
                        document.getElementById('phaiE').innerHTML = html;
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
