<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thể thao 365 - Báo điện tử Thể Thao 365</title>
        <link rel="stylesheet" href="/Styles/YeuThich.css">
        <link href="/Styles/chung.css" rel="stylesheet" type="text/css"/>
        <link href="/fonts/themify-icons/themify-icons.css" rel="stylesheet">
    </head>
    <body>
        <div class="lopBao">
            <%@include file="DauTrang.jsp" %>
            <div class="noiDung">
                <div class="thongTin">
                    <c:forEach items="${sessionScope.YEUTHICH}" var="t">
                        <div class="bao">
                            <img src="${t.hinh}" alt="Ảnh">
                            <div class="chiTiet">
                                <div class="tieuDe"><a href="/tintuc/${t.id}">${t.tieuDe}</a></div>
                                <div class="thoiGian"><fmt:formatDate type="date" value="${t.ngayTao}" /></div>
                                <div class="moTaNgan">${t.tomTat}</div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <%@include file="CuoiTrang.jsp" %>
        </div>
        <script>

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
