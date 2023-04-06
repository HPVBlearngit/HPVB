
package com.example.WebsiteTinTucTheThao.controller;

import com.example.WebsiteTinTucTheThao.model.NguoiDungModel;
import com.example.WebsiteTinTucTheThao.model.TaiKhoanModel;
import com.example.WebsiteTinTucTheThao.model.TheLoaiModel;
import com.example.WebsiteTinTucTheThao.model.TinTucModel;
import com.example.WebsiteTinTucTheThao.model.YKienBanDocModel;
import com.example.WebsiteTinTucTheThao.service.NguoiDungService;
import com.example.WebsiteTinTucTheThao.service.TaiKhoanService;
import com.example.WebsiteTinTucTheThao.service.TheLoaiService;
import com.example.WebsiteTinTucTheThao.service.TinTucService;
import com.example.WebsiteTinTucTheThao.service.YKienBanDocService;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class HomeController {

    @Autowired
    TaiKhoanService taiKhoanService;
    @Autowired
    NguoiDungService nguoiDungService;
    @Autowired
    YKienBanDocService yKienBanDocService;
    @Autowired
    TinTucService tinTucService;
    @Autowired
    TheLoaiService theLoaiService;
    
    @GetMapping("")
    public String hienThiTrangChu() {
        return "TrangChu";
    }

    @GetMapping("{id}")
    public String hienThiTrangCon(Model model, @PathVariable Integer id) {
        model.addAttribute("IDTheLoai", id);
        return "TrangCon";
    }

    @GetMapping("tintuc/{id}")
    public String hienThiTrangTin(Model model, @PathVariable Integer id) {
        model.addAttribute("IDTIN", id);
        return "TrangTin";
    }

    @GetMapping("tim-kiem/{giatri}")
    public String hienThiTimKiem(Model model) {
        model.addAttribute("IDTIN", 0);
        return "TrangCon";
    }

    @GetMapping("/dang-nhap")
    public String hienThiDangNhap() {
        return "DangNhap";
    }

    @PostMapping("/dang-nhap")
    public String dangNhap(@RequestParam("tenDangNhap") String tenDangNhap,
            @RequestParam("matKhau") String matKhau,
            Model model,
            HttpSession session) throws NoSuchAlgorithmException {
        TaiKhoanModel taiKhoan = taiKhoanService.getTaiKhoanTheoTenDangNhap(tenDangNhap);
        if (taiKhoan == null) {
            model.addAttribute("ERROR", "Tài khoản không tồn tại");
            return "DangNhap";
        } else if (!taiKhoan.getMatKhau().equals(MaHoa.chuyenDoiChuoi(matKhau))) {
            model.addAttribute("ERROR", "Mật khẩu không chính xác");
            return "DangNhap";
        } else {
            session.setAttribute("TAIKHOANID", taiKhoan.getId());
            session.setAttribute("TENDANGNHAP", taiKhoan.getTenDangNhap());
            session.setAttribute("NGUOIDUNGID", taiKhoan.getNguoiDung().getId());
            session.setAttribute("LOAITK", taiKhoan.getLoaiTK());
            model.addAttribute("OK", "Xin chào " + taiKhoan.getNguoiDung().getHoTen() + "!");
        }
        return "TrangChu";
    }

    @GetMapping("/dang-xuat")
    public String dangXuat(HttpSession session) {
        session.removeAttribute("TAIKHOANID");
        session.removeAttribute("TENDANGNHAP");
        session.removeAttribute("NGUOIDUNGID");
        session.removeAttribute("LOAITK");
        return "DangNhap";
    }

    @GetMapping("/dang-ky")
    public String hienThiDangKy() {
        return "DangKy";
    }

    @PostMapping("/dang-ky")
    public String dangKy(@RequestParam("tenDangNhap") String tenDangNhap,
            @RequestParam("matKhau") String matKhau,
            @RequestParam("hoTen") String hoTen,
            @RequestParam("ngaySinh") String ngaySinh,
            @RequestParam("gioiTinh") String gioiTinh,
            @RequestParam("dienThoai") String dienThoai,
            @RequestParam("email") String email,
            Model model) throws ParseException, NoSuchAlgorithmException {
        TaiKhoanModel tk = taiKhoanService.getTaiKhoanTheoTenDangNhap(tenDangNhap);
        if(tk != null){
            model.addAttribute("ERROR", "Tài khoản đã tồn tại");
            return "DangKy";
        }
        boolean gt = true;
        if (gioiTinh.equals("0")) {
            gt = false;
        }
        Date date = new SimpleDateFormat("yyyy-mm-dd").parse(ngaySinh);
        NguoiDungModel nguoiDung = new NguoiDungModel(null, hoTen, gt, date, email, dienThoai);
        nguoiDungService.save(nguoiDung);
        tk = new TaiKhoanModel();
        tk.setMatKhau(MaHoa.chuyenDoiChuoi(matKhau));
        tk.setTenDangNhap(tenDangNhap);
        tk.setNguoiDung(nguoiDung);
        taiKhoanService.save(tk);
        model.addAttribute("OK", "Đăng ký tài khoản thành công");
        return "DangNhap";
    }
    
    @GetMapping("/nguoi-dung")
    public String hienThiThongTinCaNhan(){
        return "ThongTinCaNhan";
    }
    
    @GetMapping("/nguoi-dung/cap-nhat")
    public String hienThiCapNhatThongTinCaNhan(HttpSession session,
            Model model){
        Integer id = (Integer)session.getAttribute("NGUOIDUNGID");
        NguoiDungModel nguoiDung = nguoiDungService.findById(id).get();
        model.addAttribute("NGUOIDUNG", nguoiDung);
        return "CapNhatThongTinCaNhan";
    }
    
    @PostMapping("/nguoi-dung/cap-nhat")
    public String CapNhatThongTinCaNhan(HttpSession session,
            Model model,
            @RequestParam("hoTen") String hoTen,
            @RequestParam("ngaySinh") String ngaySinh,
            @RequestParam("gioiTinh") String gioiTinh,
            @RequestParam("dienThoai") String dienThoai,
            @RequestParam("email") String email) throws ParseException{
        Integer id = (Integer)session.getAttribute("NGUOIDUNGID");
        NguoiDungModel nguoiDung = nguoiDungService.findById(id).get();
        nguoiDung.setEmail(email);
        nguoiDung.setGioiTinh(gioiTinh.equals("1")?true:false);
        nguoiDung.setHoTen(hoTen);
        Date date = new SimpleDateFormat("yyyy-mm-dd").parse(ngaySinh);
        nguoiDung.setNgaySinh(date);
        nguoiDung.setSoDT(dienThoai);
        nguoiDungService.save(nguoiDung);
        model.addAttribute("OK", "Cập nhật thông tin thành công");
        return "ThongTinCaNhan";
    }
    
    @GetMapping("/doi-mat-khau")
    public String HienThiDoiMatKhau(){
        return "DoiMatKhau";
    }
    
    @PostMapping("/doi-mat-khau")
    public String doiMatKhau(@RequestParam("MK") String matKhau,
            @RequestParam("MKcu") String matKhauCu,
            Model model, HttpSession session) throws NoSuchAlgorithmException{
        Integer id = (Integer)session.getAttribute("TAIKHOANID");
        TaiKhoanModel taiKhoan = taiKhoanService.findById(id).get();
        if(!taiKhoan.getMatKhau().equals(MaHoa.chuyenDoiChuoi(matKhauCu))){
            model.addAttribute("ERROR", "Mật khẩu cũ không chính xác");
            return "DoiMatKhau";
        }
        taiKhoan.setMatKhau(MaHoa.chuyenDoiChuoi(matKhau));
        taiKhoanService.save(taiKhoan);
        session.removeAttribute("TAIKHOANID");
        session.removeAttribute("TENDANGNHAP");
        session.removeAttribute("NGUOIDUNGID");
        session.removeAttribute("LOAITK");
        model.addAttribute("OK", "Đổi mật khẩu thành công");
        return "DangNhap";
    }
    
    @GetMapping("/quan-ly-tin")
    public String hienThiQuanLy(){
        return "QuanLy";
    }
    
    @GetMapping("/tin-tuc/them")
    public String hienThiThemTinTuc(Model model){
        model.addAttribute("ACTION", "/tin-tuc/them");
        return "ThemTinTuc";
    }
    
    @PostMapping("/tin-tuc/them")
    public String luuTinTuc(@RequestParam("tieuDe") String tieuDe,
            @RequestParam("loai") Integer loai,
            @RequestParam("tomTat") String tomTat,
            @RequestParam("hinh") String hinh,
            @RequestParam("noiDungT") String noiDung,
            HttpSession session){
        TinTucModel t = new TinTucModel();
        t.setHinh(hinh);
        t.setNoiDung(noiDung);
        t.setTieuDe(tieuDe);
        t.setTomTat(tomTat);
        TheLoaiModel tl = theLoaiService.findById(loai).get();
        t.setTheLoai(tl);
        TaiKhoanModel tk = taiKhoanService.findById((Integer)session.getAttribute("TAIKHOANID")).get();
        t.setTaiKhoan(tk);
        tinTucService.save(t);
        return "QuanLy";
    }
    
    @GetMapping("/tin-tuc/sua/{id}")
    public String hienThiSuaTinTuc(Model model, @PathVariable Integer id){
        TinTucModel tt = tinTucService.findById(id).get();
        model.addAttribute("TINTUC", tt);
        model.addAttribute("ACTION", "/tin-tuc/sua");
        return "ThemTinTuc";
    }
    
    @PostMapping("/tin-tuc/sua")
    public String suaTinTuc(@RequestParam("id") Integer id,
            @RequestParam("tieuDe") String tieuDe,
            @RequestParam("loai") Integer loai,
            @RequestParam("tomTat") String tomTat,
            @RequestParam("hinh") String hinh,
            @RequestParam("noiDungT") String noiDung,
            HttpSession session){
        TinTucModel t = tinTucService.findById(id).get();
        t.setHinh(hinh);
        t.setNoiDung(noiDung);
        t.setTieuDe(tieuDe);
        t.setTomTat(tomTat);
        TheLoaiModel tl = theLoaiService.findById(loai).get();
        t.setTheLoai(tl);
        TaiKhoanModel tk = taiKhoanService.findById((Integer)session.getAttribute("TAIKHOANID")).get();
        t.setTaiKhoan(tk);
        tinTucService.save(t);
        return "QuanLy";
    }
    
    @GetMapping("/tin-tuc/xoa/{id}")
    public String xoaTinTuc(@PathVariable Integer id){
        tinTucService.deleteById(id);
        return "QuanLy";
    }
    
    @GetMapping("/y-kien-ban-doc")
    public String hienThiXemYKienBanDoc(){
        return "XemYKienBanDoc";
    }
    
    @GetMapping("/yeu-thich")
    public String hienThiYeuThich(){
        return "YeuThich";
    }
}
