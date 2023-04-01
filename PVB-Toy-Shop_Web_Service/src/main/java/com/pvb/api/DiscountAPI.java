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

import com.pvb.Service.IDiscountService;
import com.pvb.Service.impl.ServiceResult;
import com.pvb.dto.product.DiscountDto;
import com.pvb.entity.DiscountEntity;

@RestController
@RequestMapping("/pvb/discount")
public class DiscountAPI {
	@Autowired
	private IDiscountService DiscountService;

	@Autowired
	private ModelMapper mapper;

	@GetMapping
	public List<DiscountDto> getAllDiscountDtos() {
		return DiscountService.findAll().stream().map(Discount -> mapper.map(Discount, DiscountDto.class))
				.collect(Collectors.toList());
	}

	@GetMapping("/{id}")
	public ResponseEntity<DiscountDto> getDiscountDtoById(@PathVariable(name = "id") Long id) {
		DiscountEntity DiscountEntity = DiscountService.findById(id);

		// convert entity to DTO
		DiscountDto DiscountResponse = mapper.map(DiscountEntity, DiscountDto.class);

		return ResponseEntity.ok().body(DiscountResponse);
	}

	@PostMapping
	public ResponseEntity<DiscountDto> createDiscount(@RequestBody DiscountDto DiscountDto) {

		// convert DTO to entity
		
		
		DiscountEntity DiscountRequest = mapper.map(DiscountDto, DiscountEntity.class);

		DiscountEntity DiscountEntity = DiscountService.createDiscount(DiscountRequest);

		// convert entity to DTO
		DiscountDto DiscountResponse = mapper.map(DiscountEntity, DiscountDto.class);

		return new ResponseEntity<DiscountDto>(DiscountResponse, HttpStatus.CREATED);
	}

	// change the request for DTO
	// change the response for DTO
	@PutMapping("/{id}")
	public ResponseEntity<DiscountDto> updateDiscount(@PathVariable long id, @RequestBody DiscountDto DiscountDto) {

		// convert DTO to entity
		;
		DiscountEntity DiscountRequest = mapper.map(DiscountDto, DiscountEntity.class);

		DiscountEntity DiscountEntity = DiscountService.updateDiscount(DiscountRequest, id);

		// convert entity to DTO
		DiscountDto DiscountResponse = mapper.map(DiscountEntity, DiscountDto.class);

		return ResponseEntity.ok().body(DiscountResponse);
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<ServiceResult> deleteDiscount(@PathVariable long id) {
		return new ResponseEntity<ServiceResult>(DiscountService.deleteDiscount(id), HttpStatus.OK);
	}

}
