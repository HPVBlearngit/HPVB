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

import com.pvb.Service.impl.ServiceResult;
import com.pvb.Service.impl.ToyService;
import com.pvb.dto.product.ToyDto;
import com.pvb.entity.ToyEntity;

@RestController
@RequestMapping("/pvb/toy")
public class ToyAPI {

	@Autowired
	private ToyService toyService;
	@Autowired
	private ModelMapper mapper;
	
	@GetMapping()
	public List<ToyDto> getAll() {
		return toyService.findAll().stream().map(toy -> mapper.map(toy, ToyDto.class))
				.collect(Collectors.toList());
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<ToyDto> findById(@PathVariable("id") Long id){
		ToyEntity toyEntity = toyService.findById(id);

		// convert entity to DTO
		ToyDto toyResponse = mapper.map(toyEntity, ToyDto.class);

		return ResponseEntity.ok().body(toyResponse);
	}
	
	@GetMapping("/toyByCategory/{categoryId}")
	public List<ToyDto> findByCategoryId(@PathVariable("categoryId") Long categoryId){
		return toyService.findByCategoryId(categoryId).stream().map(toy -> mapper.map(toy, ToyDto.class))
				.collect(Collectors.toList());
	}
	
	@PostMapping
	public ResponseEntity<ToyDto> createToy(@RequestBody ToyDto toyDto) {

		// convert DTO to entity
		ToyEntity toyRequest = mapper.map(toyDto, ToyEntity.class);

		ToyEntity toyEntity = toyService.CreateToy(toyRequest);

		// convert entity to DTO
		ToyDto toyResponse = mapper.map(toyEntity, ToyDto.class);

		return new ResponseEntity<ToyDto>(toyResponse, HttpStatus.CREATED);
	}

	
	@PutMapping("/{id}")
	public ResponseEntity<ToyDto> updateBrand(@PathVariable long id, @RequestBody ToyDto toyDto) {

		ToyEntity toyRequest = mapper.map(toyDto, ToyEntity.class);

		ToyEntity toyEntity = toyService.updateToy(toyRequest, id);

		// convert entity to DTO
		ToyDto toyResponse = mapper.map(toyEntity, ToyDto.class);

		return ResponseEntity.ok().body(toyResponse);
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<ServiceResult> deleteToy(@PathVariable long id) {
		return new ResponseEntity<ServiceResult>(toyService.deleteToy(id), HttpStatus.OK);
	}
	


}
