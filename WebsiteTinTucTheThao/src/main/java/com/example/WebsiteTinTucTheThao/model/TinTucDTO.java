/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.WebsiteTinTucTheThao.model;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class TinTucDTO {
    private Integer id;
    private String tieuDe;
    private String tomTat;
    private String noiDung;
    private Date ngayTao;
    private String hinh;
    private String nguoiViet;
    private TheLoaiModel theLoai;
    
    public static TinTucDTO convertToTinTucDTO(TinTucModel tinTuc){
        TinTucDTO tt = new TinTucDTO();
        tt.setId(tinTuc.getId());
        tt.setTieuDe(tinTuc.getTieuDe());
        tt.setTomTat(tinTuc.getTomTat());
        tt.setNoiDung(tinTuc.getNoiDung());
        tt.setNgayTao(tinTuc.getNgayTao());
        tt.setHinh(tinTuc.getHinh());
        tt.setNguoiViet(tinTuc.getTaiKhoan().getNguoiDung().getHoTen());
        tt.setTheLoai(tinTuc.getTheLoai());
        return tt;
    }
}
