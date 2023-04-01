package com.pvb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.pvb.entity.BrandEntity;


@Repository
public interface BrandRepository extends JpaRepository<BrandEntity, Long> {
	BrandEntity findByBrand(String brand);
}
