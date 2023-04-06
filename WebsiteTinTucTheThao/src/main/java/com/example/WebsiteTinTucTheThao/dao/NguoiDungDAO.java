
package com.example.WebsiteTinTucTheThao.dao;

import com.example.WebsiteTinTucTheThao.model.NguoiDungModel;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface NguoiDungDAO extends CrudRepository<NguoiDungModel, Integer>{
    
}
