package com.pvb.Service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pvb.Service.IRoleService;
import com.pvb.Service.impl.ServiceResult.Status;
import com.pvb.entity.RoleEntity;
import com.pvb.exception.ResourceNotFoundException;
import com.pvb.repository.RoleRepository;

@Service
public class RoleService implements IRoleService {

	@Autowired
	private RoleRepository RoleRepo;

	@Override
	public List<RoleEntity> findAll() {
		return RoleRepo.findAll();
	}

	@Override
	public RoleEntity findById(long id) {
		Optional<RoleEntity> result = RoleRepo.findById(id);
		if (result.isPresent()) {
			return result.get();
		} else {
			throw new ResourceNotFoundException("Role not found with id: " + id);
		}

	}

	@Override
	public RoleEntity createRole(RoleEntity Role) {
		return RoleRepo.save(Role);
	}

	@Override
	public RoleEntity updateRole(RoleEntity Role, long id) {
		RoleEntity oldRole = RoleRepo.findById(id).orElseThrow(() -> new ResourceNotFoundException("Role not found with id: " + id));
		oldRole.setRole(Role.getRole());	
		return RoleRepo.save(oldRole);
	}

	@Override
	public ServiceResult deleteRole(long id) {
		ServiceResult result = new ServiceResult();
		RoleEntity RoleEntity = RoleRepo.findById(id).orElse(null);
		if (RoleEntity == null) {
			result.setStatus(Status.FAILED);
			result.setMessage("Role Not Found");
		} else {
			RoleRepo.delete(RoleEntity);
			result.setMessage("success");
		}
		return result;

	}

}
