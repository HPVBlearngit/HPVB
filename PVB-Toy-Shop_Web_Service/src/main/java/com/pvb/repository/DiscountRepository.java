package com.pvb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.pvb.entity.DiscountEntity;


@Repository
public interface DiscountRepository extends JpaRepository<DiscountEntity, Long> {
	
}
