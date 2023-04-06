
package com.example.WebsiteTinTucTheThao.controller;

import com.example.WebsiteTinTucTheThao.model.TaiKhoanModel;
import com.example.WebsiteTinTucTheThao.model.TheLoaiModel;
import com.example.WebsiteTinTucTheThao.model.TinTucDTO;
import com.example.WebsiteTinTucTheThao.model.TinTucModel;
import com.example.WebsiteTinTucTheThao.service.TaiKhoanService;
import com.example.WebsiteTinTucTheThao.service.TheLoaiService;
import com.example.WebsiteTinTucTheThao.service.TinTucService;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api/tintuc")
public class TinTucController {
    @Autowired
    TinTucService tinTucService;
    @Autowired
    TheLoaiService theLoaiService;
    @Autowired
    TaiKhoanService taiKhoanService;
    
    @GetMapping("")
    public List<TinTucDTO> getAllTinTuc(){
        List<TinTucModel> listTinTuc = tinTucService.findAll();
        List<TinTucDTO> l = new ArrayList<>();
        for(TinTucModel t: listTinTuc){
            l.add(TinTucDTO.convertToTinTucDTO(t));
        }
        return l;
    }
    
    @GetMapping("{id}")
    public List<TinTucDTO> getTinTucTheoTheLoai(@PathVariable Integer id){
        List<TinTucModel> listTinTuc = tinTucService.getAllTinTucTheoTheLoai(id);
        List<TinTucDTO> l = new ArrayList<>();
        for(TinTucModel t: listTinTuc){
            l.add(TinTucDTO.convertToTinTucDTO(t));
        }
        return l;
    }
    
    @GetMapping("/top1/{id}")
    public TinTucDTO getTop1TinTucTheoTheLoai(@PathVariable Integer id){
        TinTucModel tinTuc = tinTucService.getTop1TinTucTheoTheLoai(id);
        return TinTucDTO.convertToTinTucDTO(tinTuc);
    }
    
    @GetMapping("/top3/{id}")
    public List<TinTucDTO> get3TinTucTheoTheLoai(@PathVariable Integer id){
        List<TinTucModel> listTinTuc = tinTucService.get3TinTucTheoTheLoai(id);
        List<TinTucDTO> l = new ArrayList<>();
        for(TinTucModel t: listTinTuc){
            l.add(TinTucDTO.convertToTinTucDTO(t));
        }
        return l;
    }
    
    @GetMapping("top10")
    public List<TinTucDTO> get10TinTucMoi(){
        List<TinTucModel> listTinTuc = tinTucService.get10TinTucMoi();
        List<TinTucDTO> l = new ArrayList<>();
        for(TinTucModel t: listTinTuc){
            l.add(TinTucDTO.convertToTinTucDTO(t));
        }
        return l;
    }
    
    @GetMapping("tin/{id}")
    public TinTucDTO getTinTucTheoId(@PathVariable Integer id){
        TinTucModel tinTuc = tinTucService.findById(id).get();
        return TinTucDTO.convertToTinTucDTO(tinTuc);
    }
    
    @GetMapping("tim-kiem/{giaTri}")
    public List<TinTucDTO> getTinTucTheoTieuDe(@PathVariable String giaTri){
        List<TinTucModel> listTinTuc = tinTucService.getTinTucTheoTieuDe("%"+giaTri+"%");
        List<TinTucDTO> l = new ArrayList<>();
        for(TinTucModel t: listTinTuc){
            l.add(TinTucDTO.convertToTinTucDTO(t));
        }
        return l;
    }
}
