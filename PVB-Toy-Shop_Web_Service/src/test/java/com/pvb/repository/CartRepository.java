package com.pvb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.pvb.entity.CartEntity;
import com.pvb.entity.ToyEntity;
import com.pvb.entity.UserEntity;


@Repository
public interface CartRepository extends JpaRepository<CartEntity, Long> {
	List<CartEntity> findAllByUserOrderByCreateDateDesc(UserEntity user);
	
}
