package com.pvb.Service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pvb.Service.IBrandService;
import com.pvb.Service.impl.ServiceResult.Status;
import com.pvb.entity.BrandEntity;
import com.pvb.exception.ResourceNotFoundException;
import com.pvb.repository.BrandRepository;

@Service
public class BrandService implements IBrandService {

	@Autowired
	private BrandRepository BrandRepo;

	@Override
	public List<BrandEntity> findAll() {
		return BrandRepo.findAll();
	}

	@Override
	public BrandEntity findById(long id) {
		Optional<BrandEntity> result = BrandRepo.findById(id);
		if (result.isPresent()) {
			return result.get();
		} else {
			throw new ResourceNotFoundException("Brand not found with id: " + id);
		}

	}

	@Override
	public BrandEntity createBrand(BrandEntity Brand) {
		return BrandRepo.save(Brand);
	}

	@Override
	public BrandEntity updateBrand(BrandEntity Brand, long id) {
		BrandEntity oldBrand = BrandRepo.findById(id).orElseThrow(() -> new ResourceNotFoundException("Brand not found with id: " + id));
		oldBrand.setBrand(Brand.getBrand());	
		return BrandRepo.save(oldBrand);
	}

	@Override
	public ServiceResult deleteBrand(long id) {
		ServiceResult result = new ServiceResult();
		BrandEntity brandEntity = BrandRepo.findById(id).orElse(null);
		if (brandEntity == null) {
			result.setStatus(Status.FAILED);
			result.setMessage("Brand Not Found");
		} else {
			BrandRepo.delete(brandEntity);
			result.setMessage("success");
		}
		return result;

	}

}
