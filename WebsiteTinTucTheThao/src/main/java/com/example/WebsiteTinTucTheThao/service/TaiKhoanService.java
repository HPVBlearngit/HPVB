
package com.example.WebsiteTinTucTheThao.service;

import com.example.WebsiteTinTucTheThao.model.TaiKhoanModel;
import java.util.List;
import java.util.Optional;

public interface TaiKhoanService {

    long count();

    void delete(TaiKhoanModel entity);

    void deleteAll();

    void deleteAll(List<TaiKhoanModel> entities);

    void deleteAllById(List<Integer> ids);

    void deleteById(Integer id);

    boolean existsById(Integer id);

    List<TaiKhoanModel> findAll();

    List<TaiKhoanModel> findAllById(List<Integer> ids);

    Optional<TaiKhoanModel> findById(Integer id);

    TaiKhoanModel save(TaiKhoanModel entity);

    List<TaiKhoanModel> saveAll(List<TaiKhoanModel> entities);

    TaiKhoanModel getTaiKhoanTheoTenDangNhap(String tenDangNhap);
    
}
