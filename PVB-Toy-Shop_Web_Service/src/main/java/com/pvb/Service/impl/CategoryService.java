package com.pvb.Service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pvb.Service.ICategoryService;
import com.pvb.Service.impl.ServiceResult.Status;
import com.pvb.entity.CategoryEntity;
import com.pvb.exception.ResourceNotFoundException;
import com.pvb.repository.CategoryRepository;

@Service
public class CategoryService implements ICategoryService {

	@Autowired
	private CategoryRepository categoryRepo;

	@Override
	public List<CategoryEntity> findAll() {
		return categoryRepo.findAll();
	}

	@Override
	public CategoryEntity findById(long id) {
		Optional<CategoryEntity> result = categoryRepo.findById(id);
		if (result.isPresent()) {
			return result.get();
		} else {
			throw new ResourceNotFoundException("Category not found with id: " + id);
		}

	}

	@Override
	public CategoryEntity createCategory(CategoryEntity category) {
		return categoryRepo.save(category);
	}

	@Override
	public CategoryEntity updateCategory(CategoryEntity category, long id) {
		CategoryEntity oldCategory = categoryRepo.findById(id).orElseThrow(() -> new ResourceNotFoundException("Category not found with id: " + id));
		oldCategory.setCategory(category.getCategory());
		oldCategory.setDescription(category.getDescription());	
		return categoryRepo.save(oldCategory);
	}

	@Override
	public ServiceResult deleteCategory(long id) {
		ServiceResult result = new ServiceResult();
		CategoryEntity categoryEntity = categoryRepo.findById(id).orElse(null);
		if (categoryEntity == null) {
			result.setStatus(Status.FAILED);
			result.setMessage("Category Not Found");
		} else {
			categoryRepo.delete(categoryEntity);
			result.setMessage("success");
		}
		return result;

	}

}
