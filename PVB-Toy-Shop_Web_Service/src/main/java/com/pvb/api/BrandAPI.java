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

import com.pvb.Service.IBrandService;
import com.pvb.Service.impl.ServiceResult;
import com.pvb.dto.product.BrandDto;
import com.pvb.entity.BrandEntity;

@RestController
@RequestMapping("/pvb/brand")
public class BrandAPI {
	@Autowired
	private IBrandService BrandService;

	@Autowired
	private ModelMapper mapper;

	@GetMapping
	public List<BrandDto> getAllBrandDtos() {
		return BrandService.findAll().stream().map(Brand -> mapper.map(Brand, BrandDto.class))
				.collect(Collectors.toList());
	}

	@GetMapping("/{id}")
	public ResponseEntity<BrandDto> getBrandDtoById(@PathVariable(name = "id") Long id) {
		BrandEntity BrandEntity = BrandService.findById(id);

		// convert entity to DTO
		BrandDto BrandResponse = mapper.map(BrandEntity, BrandDto.class);

		return ResponseEntity.ok().body(BrandResponse);
	}

	@PostMapping
	public ResponseEntity<BrandDto> createBrand(@RequestBody BrandDto BrandDto) {

		// convert DTO to entity
		BrandEntity BrandRequest = mapper.map(BrandDto, BrandEntity.class);

		BrandEntity BrandEntity = BrandService.createBrand(BrandRequest);

		// convert entity to DTO
		BrandDto BrandResponse = mapper.map(BrandEntity, BrandDto.class);

		return new ResponseEntity<BrandDto>(BrandResponse, HttpStatus.CREATED);
	}

	// change the request for DTO
	// change the response for DTO
	@PutMapping("/{id}")
	public ResponseEntity<BrandDto> updateBrand(@PathVariable long id, @RequestBody BrandDto BrandDto) {

		// convert DTO to entity
		BrandEntity BrandRequest = mapper.map(BrandDto, BrandEntity.class);

		BrandEntity BrandEntity = BrandService.updateBrand(BrandRequest, id);

		// convert entity to DTO
		BrandDto BrandResponse = mapper.map(BrandEntity, BrandDto.class);

		return ResponseEntity.ok().body(BrandResponse);
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<ServiceResult> deleteBrand(@PathVariable long id) {
		return new ResponseEntity<ServiceResult>(BrandService.deleteBrand(id), HttpStatus.OK);
	}

}
