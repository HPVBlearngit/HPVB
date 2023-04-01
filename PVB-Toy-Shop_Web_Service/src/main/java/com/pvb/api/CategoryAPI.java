package com.pvb.api;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.pvb.Service.ICategoryService;
import com.pvb.Service.impl.ServiceResult;
import com.pvb.dto.product.CategoryDto;
import com.pvb.entity.CategoryEntity;

@RestController
@RequestMapping("/pvb/category")
public class CategoryAPI {
	@Autowired
	private ICategoryService categoryService;

	@Autowired
	private ModelMapper mapper;

	@GetMapping
	public List<CategoryDto> getAllCategoryDtos() {
		return categoryService.findAll().stream().map(category -> mapper.map(category, CategoryDto.class))
				.collect(Collectors.toList());
	}

	@GetMapping("/{id}")
	public ResponseEntity<CategoryDto> getCategoryDtoById(@PathVariable(name = "id") Long id) {
		CategoryEntity categoryEntity = categoryService.findById(id);

		// convert entity to DTO
		CategoryDto categoryResponse = mapper.map(categoryEntity, CategoryDto.class);

		return ResponseEntity.ok().body(categoryResponse);
	}

	@PostMapping
	public ResponseEntity<CategoryDto> createCategory(@RequestBody CategoryDto CategoryDto) {

		// convert DTO to entity
		CategoryEntity categoryRequest = mapper.map(CategoryDto, CategoryEntity.class);

		CategoryEntity categoryEntity = categoryService.createCategory(categoryRequest);

		// convert entity to DTO
		CategoryDto CategoryResponse = mapper.map(categoryEntity, CategoryDto.class);

		return new ResponseEntity<CategoryDto>(CategoryResponse, HttpStatus.CREATED);
	}

	// change the request for DTO
	// change the response for DTO
	@PutMapping("/{id}")
	public ResponseEntity<CategoryDto> updateCategory(@PathVariable long id, @RequestBody CategoryDto CategoryDto) {

		// convert DTO to entity
		CategoryEntity categoryRequest = mapper.map(CategoryDto, CategoryEntity.class);

		CategoryEntity categoryEntity = categoryService.updateCategory(categoryRequest, id);

		// convert entity to DTO
		CategoryDto CategoryResponse = mapper.map(categoryEntity, CategoryDto.class);

		return ResponseEntity.ok().body(CategoryResponse);
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<ServiceResult> deleteCategory(@PathVariable long id) {
		return new ResponseEntity<ServiceResult>(categoryService.deleteCategory(id), HttpStatus.OK);
	}

}
