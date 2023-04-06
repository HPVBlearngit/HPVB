
package com.example.WebsiteTinTucTheThao.dao;

import com.example.WebsiteTinTucTheThao.model.YKienBanDocModel;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface YKienBanDocDAO extends CrudRepository<YKienBanDocModel, Integer>{
    
}
