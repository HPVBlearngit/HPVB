package com.pvb.Service;

import java.util.List;

import com.pvb.Service.impl.ServiceResult;
import com.pvb.entity.ToyEntity;

public interface IToyService {
	ToyEntity CreateToy(ToyEntity toy);
	List<ToyEntity> findAll();
	ToyEntity findById(long id);
	ToyEntity updateToy(ToyEntity toy, Long id);
	List<ToyEntity> findByCategoryId(Long categoryId);
	ServiceResult deleteToy(long id);

}
