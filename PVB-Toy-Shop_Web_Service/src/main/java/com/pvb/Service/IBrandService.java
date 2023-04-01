package com.pvb.Service;

import java.util.List;

import com.pvb.Service.impl.ServiceResult;
import com.pvb.entity.BrandEntity;

public interface IBrandService {
	List<BrandEntity> findAll();
	BrandEntity findById(long id);
	BrandEntity createBrand(BrandEntity Brand);
	BrandEntity updateBrand(BrandEntity Brand, long id);
	ServiceResult deleteBrand(long id);
	
}
