package com.pvb.Service.impl;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pvb.Service.IToyService;
import com.pvb.Service.impl.ServiceResult.Status;
import com.pvb.entity.ToyEntity;
import com.pvb.exception.ResourceNotFoundException;
import com.pvb.repository.ToyRepository;

@Service
public class ToyService implements IToyService {

	@Autowired
	private ToyRepository toyRepository;


	@Override
	public ToyEntity CreateToy(ToyEntity toy) {
		toy.setCreateAt(new Date());
		return toyRepository.save(toy);
	}

	@Override
	public ToyEntity updateToy(ToyEntity toy, Long id) {
		ToyEntity oldtoy = toyRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("Toy not found with id: " + id));		
		oldtoy.setBrand(toy.getBrand());
		oldtoy.setCategory(toy.getCategory());
		oldtoy.setCreateAt(toy.getCreateAt());
		oldtoy.setDescription(toy.getDescription());
		oldtoy.setDiscount(toy.getDiscount());
		oldtoy.setModifiedAt(new Date());
		oldtoy.setName(toy.getName());
		oldtoy.setPrice(toy.getPrice());
		oldtoy.setQtyInStock(toy.getQtyInStock());
		oldtoy.setSKU(toy.getSKU());
		oldtoy.setToyImageEntities(toy.getToyImageEntities());		
		return toyRepository.save(oldtoy);
		
	}

	@Override
	public List<ToyEntity> findAll() {
		// TODO Auto-generated method stub
		return toyRepository.findAll();
	}

	@Override
	public ToyEntity findById(long id) {
		Optional<ToyEntity> result = toyRepository.findById(id);
		if (result.isPresent()) {
			return result.get();
		} else {
			throw new ResourceNotFoundException("toy not found with id: " + id);
		}
		
	}

	@Override
	public List<ToyEntity> findByCategoryId(Long categoryId) {
		return toyRepository.findAllByCategoryId(categoryId);
		
	}

	@Override
	public ServiceResult deleteToy(long id) {
		ServiceResult result = new ServiceResult();
		ToyEntity toyEntity = toyRepository.findById(id).orElse(null);
		if (toyEntity == null) {
			result.setStatus(Status.FAILED);
			result.setMessage("Toy Not Found");
		} else {
			toyRepository.delete(toyEntity);
			result.setMessage("success");
		}
		return result;
	}

}
