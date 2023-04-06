
package com.example.WebsiteTinTucTheThao.service;

import com.example.WebsiteTinTucTheThao.model.TinTucModel;
import java.util.List;
import java.util.Optional;


public interface TinTucService {

    long count();

    void delete(TinTucModel entity);

    void deleteAll();

    void deleteAll(List<TinTucModel> entities);

    void deleteAllById(List<Integer> ids);

    void deleteById(Integer id);

    boolean existsById(Integer id);

    List<TinTucModel> findAll();

    List<TinTucModel> findAllById(List<Integer> ids);

    Optional<TinTucModel> findById(Integer id);

    TinTucModel save(TinTucModel entity);

    List<TinTucModel> saveAll(List<TinTucModel> entities);

    List<TinTucModel> get3TinTucTheoTheLoai(Integer theLoai_id);

    List<TinTucModel> getAllTinTucTheoTheLoai(Integer theLoai_id);

    TinTucModel getTop1TinTucTheoTheLoai(Integer theLoai_id);

    List<TinTucModel> get10TinTucMoi();

    List<TinTucModel> getTinTucTheoTieuDe(String s);
    
}
