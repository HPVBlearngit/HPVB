
package com.example.WebsiteTinTucTheThao.service;

import com.example.WebsiteTinTucTheThao.dao.TaiKhoanDAO;
import com.example.WebsiteTinTucTheThao.model.TaiKhoanModel;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class TaiKhoanServiceImpl implements TaiKhoanService{
    @Autowired
    TaiKhoanDAO taiKhoanDAO;

    @Override
    public TaiKhoanModel save(TaiKhoanModel entity) {
        return taiKhoanDAO.save(entity);
    }

    @Override
    public List<TaiKhoanModel> saveAll(List<TaiKhoanModel> entities) {
        return (List<TaiKhoanModel>)taiKhoanDAO.saveAll(entities);
    }

    @Override
    public Optional<TaiKhoanModel> findById(Integer id) {
        return taiKhoanDAO.findById(id);
    }

    @Override
    public boolean existsById(Integer id) {
        return taiKhoanDAO.existsById(id);
    }

    @Override
    public List<TaiKhoanModel> findAll() {
        return (List<TaiKhoanModel>)taiKhoanDAO.findAll();
    }

    @Override
    public List<TaiKhoanModel> findAllById(List<Integer> ids) {
        return (List<TaiKhoanModel>)taiKhoanDAO.findAllById(ids);
    }

    @Override
    public long count() {
        return taiKhoanDAO.count();
    }

    @Override
    public void deleteById(Integer id) {
        taiKhoanDAO.deleteById(id);
    }

    @Override
    public void delete(TaiKhoanModel entity) {
        taiKhoanDAO.delete(entity);
    }

    @Override
    public void deleteAllById(List<Integer> ids) {
        taiKhoanDAO.deleteAllById(ids);
    }

    @Override
    public void deleteAll(List<TaiKhoanModel> entities) {
        taiKhoanDAO.deleteAll(entities);
    }

    @Override
    public void deleteAll() {
        taiKhoanDAO.deleteAll();
    }

    @Override
    public TaiKhoanModel getTaiKhoanTheoTenDangNhap(String tenDangNhap) {
        return taiKhoanDAO.getTaiKhoanTheoTenDangNhap(tenDangNhap);
    }
    
}
