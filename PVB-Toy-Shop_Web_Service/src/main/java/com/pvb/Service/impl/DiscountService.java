package com.pvb.Service.impl;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pvb.Service.IDiscountService;
import com.pvb.Service.impl.ServiceResult.Status;
import com.pvb.entity.DiscountEntity;
import com.pvb.exception.ResourceNotFoundException;
import com.pvb.repository.DiscountRepository;

@Service
public class DiscountService implements IDiscountService {

	@Autowired
	private DiscountRepository DiscountRepo;

	@Override
	public List<DiscountEntity> findAll() {
		return DiscountRepo.findAll();
	}

	@Override
	public DiscountEntity findById(long id) {
		Optional<DiscountEntity> result = DiscountRepo.findById(id);
		if (result.isPresent()) {
			return result.get();
		} else {
			throw new ResourceNotFoundException("Discount not found with id: " + id);
		}

	}

	@Override
	public DiscountEntity createDiscount(DiscountEntity Discount) {
		
		Date createAt = new Date();
		Discount.setCreateAt(createAt);	
		return DiscountRepo.save(Discount);
	}

	@Override
	public DiscountEntity updateDiscount(DiscountEntity Discount, long id) {
		DiscountEntity oldDiscount = DiscountRepo.findById(id).orElseThrow(() -> new ResourceNotFoundException("Discount not found with id: " + id));
		Date modifiedAt = new Date();
		Discount.setModifiedAt(modifiedAt);
		oldDiscount.setName(Discount.getName());
		oldDiscount.setDescription(Discount.getDescription());
		oldDiscount.setPercent(Discount.getPercent());
		oldDiscount.setModifiedAt(Discount.getModifiedAt());
		return DiscountRepo.save(oldDiscount);
	}

	@Override
	public ServiceResult deleteDiscount(long id) {
		ServiceResult result = new ServiceResult();
		DiscountEntity discountEntity = DiscountRepo.findById(id).orElse(null);
		if (discountEntity == null) {
			result.setStatus(Status.FAILED);
			result.setMessage("Discount Not Found");
		} else {
			DiscountRepo.delete(discountEntity);
			result.setMessage("success");
		}
		return result;

	}

}
