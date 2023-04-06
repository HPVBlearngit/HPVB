
package com.example.WebsiteTinTucTheThao.service;

import com.example.WebsiteTinTucTheThao.dao.TheLoaiDAO;
import com.example.WebsiteTinTucTheThao.model.TheLoaiModel;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class TheLoaiServiceImpl implements TheLoaiService{
    @Autowired
    TheLoaiDAO theLoaiDAO;

    @Override
    public TheLoaiModel save(TheLoaiModel entity) {
        return theLoaiDAO.save(entity);
    }

    @Override
    public List<TheLoaiModel> saveAll(List<TheLoaiModel> entities) {
        return (List<TheLoaiModel>)theLoaiDAO.saveAll(entities);
    }

    @Override
    public Optional<TheLoaiModel> findById(Integer id) {
        return theLoaiDAO.findById(id);
    }

    @Override
    public boolean existsById(Integer id) {
        return theLoaiDAO.existsById(id);
    }

    @Override
    public List<TheLoaiModel> findAll() {
        return (List<TheLoaiModel>)theLoaiDAO.findAll();
    }

    @Override
    public List<TheLoaiModel> findAllById(List<Integer> ids) {
        return (List<TheLoaiModel>)theLoaiDAO.findAllById(ids);
    }

    @Override
    public long count() {
        return theLoaiDAO.count();
    }

    @Override
    public void deleteById(Integer id) {
        theLoaiDAO.deleteById(id);
    }

    @Override
    public void delete(TheLoaiModel entity) {
        theLoaiDAO.delete(entity);
    }

    @Override
    public void deleteAllById(List<Integer> ids) {
        theLoaiDAO.deleteAllById(ids);
    }

    @Override
    public void deleteAll(List<TheLoaiModel> entities) {
        theLoaiDAO.deleteAll(entities);
    }

    @Override
    public void deleteAll() {
        theLoaiDAO.deleteAll();
    }
    
}
