package com.pvb.Service.impl;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pvb.Service.IAuthenticationService;
import com.pvb.entity.AuthenticationTokenEntity;
import com.pvb.entity.UserEntity;
import com.pvb.exception.AuthenticationFailException;
import com.pvb.repository.TokenRepository;

@Service
public class AuthenticationService implements IAuthenticationService {

	@Autowired
	TokenRepository tokenRepository;

	@Override
	public void saveConfirmationToken(AuthenticationTokenEntity authenticationTokenEntity) {
		tokenRepository.save(authenticationTokenEntity);

	}

	public AuthenticationTokenEntity getToken(UserEntity user) {
		return tokenRepository.findByUser(user);
	}

	public UserEntity getUser(String token) {
		AuthenticationTokenEntity authenticationToken = tokenRepository.findByToken(token);
		if(Objects.isNull(token)) {
			return null;
		}
		return authenticationToken.getUser();
	}

	public void authenticate(String token) {
		if (Objects.isNull(token)) {
			throw new AuthenticationFailException("Token not present");
		}
		
		if(Objects.isNull(getUser(token))) {
			throw new AuthenticationFailException("Token not valid");
		}
	}

}
