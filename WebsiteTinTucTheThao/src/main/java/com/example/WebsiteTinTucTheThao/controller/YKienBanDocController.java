
package com.example.WebsiteTinTucTheThao.controller;

import com.example.WebsiteTinTucTheThao.model.YKienBanDocModel;
import com.example.WebsiteTinTucTheThao.service.YKienBanDocService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/y-kien")
public class YKienBanDocController {
    
    @Autowired
    YKienBanDocService yKienBanDocService;
    
    @PostMapping("")
    public String luuYKienBanDoc(@RequestBody YKienBanDocModel yKienBanDoc){
        System.out.println(yKienBanDoc.getEmail());
        YKienBanDocModel y = new YKienBanDocModel();
        y.setEmail(yKienBanDoc.getEmail());
        y.setHoTen(yKienBanDoc.getHoTen());
        y.setNoiDung(yKienBanDoc.getNoiDung());
        yKienBanDocService.save(y);
        return "OK";
    }
    
    @GetMapping("")
    public List<YKienBanDocModel> getAllYKien(){
        List<YKienBanDocModel> list = yKienBanDocService.findAll();
        return list;
    }
}
