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

import com.pvb.Service.impl.RoleService;
import com.pvb.Service.impl.ServiceResult;
import com.pvb.dto.user.RoleDto;
import com.pvb.entity.RoleEntity;

@RestController
@RequestMapping("/pvb/role")
public class RoleAPI {
	@Autowired
	private RoleService RoleService;

	@Autowired
	private ModelMapper mapper;

	@GetMapping
	public List<RoleDto> getAllRoleDtos() {
		return RoleService.findAll().stream().map(Role -> mapper.map(Role, RoleDto.class))
				.collect(Collectors.toList());
	}

	@GetMapping("/{id}")
	public ResponseEntity<RoleDto> getRoleDtoById(@PathVariable(name = "id") Long id) {
		RoleEntity RoleEntity = RoleService.findById(id);

		// convert entity to DTO
		RoleDto RoleResponse = mapper.map(RoleEntity, RoleDto.class);

		return ResponseEntity.ok().body(RoleResponse);
	}

	@PostMapping
	public ResponseEntity<RoleDto> createRole(@RequestBody RoleDto RoleDto) {

		// convert DTO to entity
		RoleEntity RoleRequest = mapper.map(RoleDto, RoleEntity.class);

		RoleEntity RoleEntity = RoleService.createRole(RoleRequest);

		// convert entity to DTO
		RoleDto RoleResponse = mapper.map(RoleEntity, RoleDto.class);

		return new ResponseEntity<RoleDto>(RoleResponse, HttpStatus.CREATED);
	}

	// change the request for DTO
	// change the response for DTO
	@PutMapping("/{id}")
	public ResponseEntity<RoleDto> updateRole(@PathVariable long id, @RequestBody RoleDto RoleDto) {

		// convert DTO to entity
		RoleEntity RoleRequest = mapper.map(RoleDto, RoleEntity.class);

		RoleEntity RoleEntity = RoleService.updateRole(RoleRequest, id);

		// convert entity to DTO
		RoleDto RoleResponse = mapper.map(RoleEntity, RoleDto.class);

		return ResponseEntity.ok().body(RoleResponse);
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<ServiceResult> deleteRole(@PathVariable long id) {
		return new ResponseEntity<ServiceResult>(RoleService.deleteRole(id), HttpStatus.OK);
	}

}
