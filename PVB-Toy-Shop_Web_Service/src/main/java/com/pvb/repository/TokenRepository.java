package com.pvb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.pvb.entity.AuthenticationTokenEntity;
import com.pvb.entity.UserEntity;

@Repository
public interface TokenRepository extends JpaRepository<AuthenticationTokenEntity, Long>{
	AuthenticationTokenEntity findByUser(UserEntity user);
	AuthenticationTokenEntity findByToken(String token);
}
