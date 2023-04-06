
package com.example.WebsiteTinTucTheThao.dao;

import com.example.WebsiteTinTucTheThao.model.TheLoaiModel;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface TheLoaiDAO extends CrudRepository<TheLoaiModel, Integer>{
    
}
