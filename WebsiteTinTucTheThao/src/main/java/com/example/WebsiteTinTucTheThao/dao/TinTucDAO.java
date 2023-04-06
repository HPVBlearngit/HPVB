
package com.example.WebsiteTinTucTheThao.dao;

import com.example.WebsiteTinTucTheThao.model.TinTucModel;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface TinTucDAO extends CrudRepository<TinTucModel, Integer>{
    
    @Query(value = "select * from tin_tuc where tin_tuc.the_loai_id = ?1 order by tin_tuc.id desc", nativeQuery = true)
    List<TinTucModel> getAllTinTucTheoTheLoai(Integer theLoai_id);
    
    @Query(value = "select top (10) * from tin_tuc order by tin_tuc.id desc", nativeQuery = true)
    List<TinTucModel> get10TinTucMoi();
    
    @Query(value = "select * from tin_tuc where tin_tuc.the_loai_id = ?1 order by tin_tuc.id desc limit 1", nativeQuery = true)
    TinTucModel getTop1TinTucTheoTheLoai(Integer theLoai_id);
    
    @Query(value = "select * from tin_tuc where tin_tuc.the_loai_id = ?1 order by tin_tuc.id desc limit 3", nativeQuery = true)
    List<TinTucModel> get3TinTucTheoTheLoai(Integer theLoai_id);
    
    @Query(value = "select * from tin_tuc where tin_tuc.tieu_de like ?1", nativeQuery = true)
    List<TinTucModel> getTinTucTheoTieuDe(String s);
}
