<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="cuoiTrang">
    <table>
        <tr>
            <td>
                <div class="chu">
                    <a href="#"><i class="ti-basketball"></i>THETHAO365</a>
                    <h3>Báo điện tử Thể Thao 365 - Cùng nhịp đập thể thao</h3>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="trai">
                    <div class="tieuDe">Liên hệ</div>
                    <p>Mọi thông tin chi tiết xin liên hệ</p>
                    <i class="ti-email"></i>
                    <i class="ti-facebook"></i>
                    <i class="ti-youtube"></i>
                    <i class="ti-twitter-alt"></i>
                </div>
                <div class="phai">
                    <div class="tieuDe">Phản hồi</div>
                    <p>Họ và Tên</p>
                    <input type="text" name="hoTen" id="hoTen">
                    <p>Email</p>
                    <input type="email" name="email" id="email">
                    <p>Nội dung</p>
                    <textarea name="noiDung" id="noiDung"></textarea>
                    <a onclick="gui()">Gửi</a>
                </div>
            </td>
        </tr>
    </table>
</div>
<script>
    function gui() {
        var hoTen = document.getElementById("hoTen").value;
        var email = document.getElementById("email").value;
        var noiDung = document.getElementById("noiDung").value;
        if (!hoTen || !email || !noiDung)
            window.alert("Vui lòng nhập đủ thông tin vào khung phản hồi");
        else {
            var myHeaders = new Headers();
            myHeaders.append("Content-Type", "application/json");

            var raw = JSON.stringify({
                "hoTen": hoTen,
                "email": email,
                "noiDung": noiDung
            });

            var requestOptions = {
                method: 'POST',
                headers: myHeaders,
                body: raw,
                redirect: 'follow'
            };

            fetch("/api/y-kien", requestOptions)
                    .then(response => response.text())
                    .then(result => {
                        if (result == 'OK')
                            window.alert("Gửi phản hồi thành công. Cảm ơn bạn đã đóng góp ý kiến với chúng tôi!");
                    })
                    .catch(error => console.log('error', error));
        }
    }
</script>
