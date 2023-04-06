<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thể thao 365 - Báo điện tử Thể Thao 365</title>
        <link rel="stylesheet" href="/Styles/ThemTinTuc.css">
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
                        <form action="${ACTION}" method="post">
                            <input type="hidden" name="id" id="id" value="${TINTUC.getId()}">
                            Tiêu đề tin tức
                            <input type="text" name="tieuDe" id="tieuDe" value="${TINTUC.getTieuDe()}">
                            Loại tin tức
                            <select name="loai" id="loai">
                                <option value="1">Bóng đá</option>
                                <option value="2">Bóng chuyền</option>
                                <option value="3">Bóng rổ</option>
                                <option value="4">Esports</option>
                            </select>
                            Tóm tắt
                            <textarea name="tomTat" id="tomTat" >${TINTUC.getTomTat()}</textarea>
                            Hình ảnh
                            <input type="text" name="hinh" id="hinh" value="${TINTUC.getHinh()}">
                            Nội dung
                            <textarea name="noiDungT" id="noiDungT">${TINTUC.getNoiDung()}</textarea>
                            <button>Lưu tin tức</button>
                        </form>
                    </div>
                </div>
                <%@include file="CuoiTrang.jsp" %>
            </div>
    </body>

</html>
