package com.pvb.Service;

import java.util.List;

import com.pvb.Service.impl.ServiceResult;
import com.pvb.entity.CategoryEntity;

public interface ICategoryService {
	List<CategoryEntity> findAll();
	CategoryEntity findById(long id);
	CategoryEntity createCategory(CategoryEntity category);
	CategoryEntity updateCategory(CategoryEntity category, long id);
	ServiceResult deleteCategory(long id);
	
}
