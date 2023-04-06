
package com.example.WebsiteTinTucTheThao.service;

import com.example.WebsiteTinTucTheThao.dao.NguoiDungDAO;
import com.example.WebsiteTinTucTheThao.model.NguoiDungModel;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class NguoiDungServiceImpl implements NguoiDungService{
    @Autowired
    NguoiDungDAO nguoiDungDAO;

    @Override
    public NguoiDungModel save(NguoiDungModel entity) {
        return nguoiDungDAO.save(entity);
    }

    @Override
    public List<NguoiDungModel> saveAll(List<NguoiDungModel> entities) {
        return (List<NguoiDungModel>)nguoiDungDAO.saveAll(entities);
    }

    @Override
    public Optional<NguoiDungModel> findById(Integer id) {
        return nguoiDungDAO.findById(id);
    }

    @Override
    public boolean existsById(Integer id) {
        return nguoiDungDAO.existsById(id);
    }

    @Override
    public List<NguoiDungModel> findAll() {
        return (List<NguoiDungModel>)nguoiDungDAO.findAll();
    }

    @Override
    public List<NguoiDungModel> findAllById(List<Integer> ids) {
        return (List<NguoiDungModel>)nguoiDungDAO.findAllById(ids);
    }

    @Override
    public long count() {
        return nguoiDungDAO.count();
    }

    @Override
    public void deleteById(Integer id) {
        nguoiDungDAO.deleteById(id);
    }

    @Override
    public void delete(NguoiDungModel entity) {
        nguoiDungDAO.delete(entity);
    }

    @Override
    public void deleteAllById(List<Integer> ids) {
        nguoiDungDAO.deleteAllById(ids);
    }

    @Override
    public void deleteAll(List<NguoiDungModel> entities) {
        nguoiDungDAO.deleteAll(entities);
    }

    @Override
    public void deleteAll() {
        nguoiDungDAO.deleteAll();
    }
    
    
}
