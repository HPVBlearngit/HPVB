package com.pvb.Service;

import java.util.List;

import com.pvb.Service.impl.ServiceResult;
import com.pvb.entity.RoleEntity;

public interface IRoleService {
	List<RoleEntity> findAll();
	RoleEntity findById(long id);
	RoleEntity createRole(RoleEntity Role);
	RoleEntity updateRole(RoleEntity Role, long id);
	ServiceResult deleteRole(long id);
	
}
