
package com.example.WebsiteTinTucTheThao.controller;

import com.example.WebsiteTinTucTheThao.model.TinTucModel;
import com.example.WebsiteTinTucTheThao.service.TinTucService;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api/yeu-thich")
public class YeuThichController {

    @Autowired
    TinTucService tinTucService;

    @GetMapping("/{id}/{value}")
    public String luuYeuThich(HttpSession session, @PathVariable Integer id, @PathVariable Integer value) {
        List<TinTucModel> list = (List<TinTucModel>) session.getAttribute("YEUTHICH");
        if (list == null) {
            list = new ArrayList<>();
        }
        if (value == 0) {
            for (TinTucModel t : list) {
                if (t.getId() == id) {
                    return "YES";
                }
            }
            return "NO";
        } else {
            session.removeAttribute("YEUTHICH");
            for (TinTucModel t : list) {
                if (t.getId() == id) {
                    list.remove(t);
                    session.setAttribute("YEUTHICH", list);
                    return "NO";
                }
            }
            TinTucModel tinTuc = tinTucService.findById(id).get();
            list.add(tinTuc);
            session.setAttribute("YEUTHICH", list);
            return "YES";
        }
    }
}
