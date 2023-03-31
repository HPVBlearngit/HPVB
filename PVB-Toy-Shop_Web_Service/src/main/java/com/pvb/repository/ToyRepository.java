package com.pvb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.pvb.entity.ToyEntity;

@Repository
public interface ToyRepository extends JpaRepository<ToyEntity, Long>{
	List<ToyEntity> findAllByCategoryId(Long categoryId);
}
