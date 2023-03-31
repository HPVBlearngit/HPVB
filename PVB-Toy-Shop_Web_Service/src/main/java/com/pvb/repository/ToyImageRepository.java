package com.pvb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.pvb.entity.ToyImageEntity;

@Repository
public interface ToyImageRepository extends JpaRepository<ToyImageEntity, Integer>{
	
}
