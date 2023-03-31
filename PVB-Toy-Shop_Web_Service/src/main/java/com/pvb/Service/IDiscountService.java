package com.pvb.Service;

import java.util.List;

import com.pvb.Service.impl.ServiceResult;
import com.pvb.entity.DiscountEntity;

public interface IDiscountService {
	List<DiscountEntity> findAll();
	DiscountEntity findById(long id);
	DiscountEntity createDiscount(DiscountEntity Discount);
	DiscountEntity updateDiscount(DiscountEntity Discount, long id);
	ServiceResult deleteDiscount(long id);
	
}
