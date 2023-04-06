<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thể thao 365 - Báo điện tử Thể Thao 365</title>
        <link rel="stylesheet" href="/Styles/TrangTin.css">
        <link href="/Styles/chung.css" rel="stylesheet" type="text/css"/>
        <link href="/fonts/themify-icons/themify-icons.css" rel="stylesheet">
    </head>
    <body>
        <div class="lopBao">
            <%@include file="DauTrang.jsp" %>
            <div class="noiDung">
                <input type="hidden" id="tin" value="${IDTIN}">
                <div class="trai">
                    <div id="ndTrai"></div>
                    <div id="tim" onclick="chuyenTim()">
                    </div>
                </div>
                <div class="phai">
                    <div class="tieuDe"><p>Tin mới nhất</p></div>
                    <div id='ndPhai'></div>

                </div>
            </div>
            <%@include file="CuoiTrang.jsp" %>
        </div>
        <script>
            var tin = document.getElementById('tin').value;
            fetch('/api/tintuc/tin/' + tin)
                    .then(response => response.json())
                    .then(d => {
                        var html = '<div class="bao"><div class="tieuDe">' + d.tieuDe + '</div><div class="thoiGian">' + format(d.ngayTao) + '</div><div class="moTaN">' + d.tomTat + '</div><img src="' + d.hinh + '" alt="Ảnh"><div class="chiTiet"><p>' + d.noiDung + '</p></div></div>';
                        document.getElementById('ndTrai').innerHTML = html;
                    })
            fetch('/api/tintuc/top10')
                    .then(response => response.json())
                    .then(data => {
                        var htmls = data.map(function (d) {
                            return '<div class="TDTin"><a href="/tintuc/' + d.id + '">' + d.tieuDe + '</a></div>';
                        })
                        html = htmls.join(' ');
                        document.getElementById('ndPhai').innerHTML = html;
                    })

            yeuthich(0);
            function chuyenTim() {
                yeuthich(1);
            }

            function yeuthich(a) {
                fetch('/api/yeu-thich/' + tin + '/' + a)
                        .then(response => response.text())
                        .then(result => {
                            if (result == 'NO') {
                                document.getElementById("tim").innerHTML = '<div class="yeuThich" style="color: black; font-weight: bold"><i class="ti-heart"> Yêu thích</i></div>'
                            } else {
                                document.getElementById("tim").innerHTML = '<div class="yeuThich" style="color: red; font-weight: bold"><i class="ti-heart"> Yêu thích</i></div>'
                            }
                        })
                        .catch(error => console.log('error', error));
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
