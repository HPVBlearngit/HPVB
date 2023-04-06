
package com.example.WebsiteTinTucTheThao.service;

import com.example.WebsiteTinTucTheThao.dao.TinTucDAO;
import com.example.WebsiteTinTucTheThao.model.TinTucModel;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class TinTucServiceImpl implements TinTucService{
    @Autowired
    TinTucDAO tinTucDAO;

    @Override
    public TinTucModel save(TinTucModel entity) {
        return tinTucDAO.save(entity);
    }

    @Override
    public List<TinTucModel> saveAll(List<TinTucModel> entities) {
        return (List<TinTucModel>)tinTucDAO.saveAll(entities);
    }

    @Override
    public Optional<TinTucModel> findById(Integer id) {
        return tinTucDAO.findById(id);
    }

    @Override
    public boolean existsById(Integer id) {
        return tinTucDAO.existsById(id);
    }

    @Override
    public List<TinTucModel> findAll() {
        return (List<TinTucModel>)tinTucDAO.findAll();
    }

    @Override
    public List<TinTucModel> findAllById(List<Integer> ids) {
        return (List<TinTucModel>)tinTucDAO.findAllById(ids);
    }

    @Override
    public long count() {
        return tinTucDAO.count();
    }

    @Override
    public void deleteById(Integer id) {
        tinTucDAO.deleteById(id);
    }

    @Override
    public void delete(TinTucModel entity) {
        tinTucDAO.delete(entity);
    }

    @Override
    public void deleteAllById(List<Integer> ids) {
        tinTucDAO.deleteAllById(ids);
    }

    @Override
    public void deleteAll(List<TinTucModel> entities) {
        tinTucDAO.deleteAll(entities);
    }

    @Override
    public void deleteAll() {
        tinTucDAO.deleteAll();
    }

    @Override
    public List<TinTucModel> getAllTinTucTheoTheLoai(Integer theLoai_id) {
        return tinTucDAO.getAllTinTucTheoTheLoai(theLoai_id);
    }

    @Override
    public TinTucModel getTop1TinTucTheoTheLoai(Integer theLoai_id) {
        return tinTucDAO.getTop1TinTucTheoTheLoai(theLoai_id);
    }

    @Override
    public List<TinTucModel> get3TinTucTheoTheLoai(Integer theLoai_id) {
        return tinTucDAO.get3TinTucTheoTheLoai(theLoai_id);
    }

    @Override
    public List<TinTucModel> get10TinTucMoi() {
        return tinTucDAO.get10TinTucMoi();
    }

    @Override
    public List<TinTucModel> getTinTucTheoTieuDe(String s) {
        return tinTucDAO.getTinTucTheoTieuDe(s);
    }
}
