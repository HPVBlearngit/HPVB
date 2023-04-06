
package com.example.WebsiteTinTucTheThao.service;

import com.example.WebsiteTinTucTheThao.dao.YKienBanDocDAO;
import com.example.WebsiteTinTucTheThao.model.YKienBanDocModel;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class YKienBanDocServiceImpl implements YKienBanDocService{
    @Autowired
    YKienBanDocDAO yKienBanDocDAO;

    @Override
    public YKienBanDocModel save(YKienBanDocModel entity) {
        return yKienBanDocDAO.save(entity);
    }

    @Override
    public List<YKienBanDocModel> saveAll(List<YKienBanDocModel> entities) {
        return (List<YKienBanDocModel>)yKienBanDocDAO.saveAll(entities);
    }

    @Override
    public Optional<YKienBanDocModel> findById(Integer id) {
        return yKienBanDocDAO.findById(id);
    }

    @Override
    public boolean existsById(Integer id) {
        return yKienBanDocDAO.existsById(id);
    }

    @Override
    public List<YKienBanDocModel> findAll() {
        return (List<YKienBanDocModel>)yKienBanDocDAO.findAll();
    }

    @Override
    public List<YKienBanDocModel> findAllById(List<Integer> ids) {
        return (List<YKienBanDocModel>)yKienBanDocDAO.findAllById(ids);
    }

    @Override
    public long count() {
        return yKienBanDocDAO.count();
    }

    @Override
    public void deleteById(Integer id) {
        yKienBanDocDAO.deleteById(id);
    }

    @Override
    public void delete(YKienBanDocModel entity) {
        yKienBanDocDAO.delete(entity);
    }

    @Override
    public void deleteAllById(List<Integer> ids) {
        yKienBanDocDAO.deleteAllById(ids);
    }

    @Override
    public void deleteAll(List<YKienBanDocModel> entities) {
        yKienBanDocDAO.deleteAll(entities);
    }

    @Override
    public void deleteAll() {
        yKienBanDocDAO.deleteAll();
    }
    
}
