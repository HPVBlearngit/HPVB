package com.pvb.Service.impl;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Objects;

import javax.transaction.Transactional;
import javax.xml.bind.DatatypeConverter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pvb.Service.IUserService;
import com.pvb.dto.user.ResponseDto;
import com.pvb.dto.user.SignInDto;
import com.pvb.dto.user.SignInResponseDto;
import com.pvb.dto.user.SignUpDto;
import com.pvb.entity.AuthenticationTokenEntity;
import com.pvb.entity.RoleEntity;
import com.pvb.entity.UserEntity;
import com.pvb.exception.AuthenticationFailException;
import com.pvb.exception.CustomException;
import com.pvb.repository.UserRepository;

@Service
public class UserService implements IUserService {

	@Autowired
	private UserRepository userReposiroty;

	@Autowired
	private RoleService roleService;

	@Autowired
	private AuthenticationService authenticationService;

	private String avatar = "https://thumbs.dreamstime.com/z/businessman-icon-image-male-avatar-profile-vector-glasses-beard-hairstyle-179728610.jpg";

	@Override
	@Transactional
	public ResponseDto signUp(SignUpDto signUpDto) {
		// check if user already present
		
		if (Objects.nonNull(userReposiroty.findByEmail(signUpDto.getEmail()))) {
			throw new CustomException("email already taken");
		} 
		
		
		
		// hash password
		String encryptedPassword = signUpDto.getPassword();
		try {
			encryptedPassword = hashPassword(signUpDto.getPassword());
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			throw new CustomException(e.getMessage());

		}
		RoleEntity role = roleService.findById(1);
		UserEntity user = new UserEntity(signUpDto.getEmail(), encryptedPassword, signUpDto.getFirstName(),
				signUpDto.getLastName(), signUpDto.getPhone(), signUpDto.getAddress(), role, avatar);
		// save user
		userReposiroty.save(user);
		// create token
		final AuthenticationTokenEntity authenticationTokenEntity = new AuthenticationTokenEntity(user);
		authenticationService.saveConfirmationToken(authenticationTokenEntity);
		ResponseDto responseDto = new ResponseDto("Success", "Dummy response");
		return responseDto;

	}

	private String hashPassword(String password) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(password.getBytes());
		byte[] digest = md.digest();
		String hash = DatatypeConverter.printHexBinary(digest).toUpperCase();
		return hash;
	}

	@Override
	public SignInResponseDto signIn(SignInDto signInDto) {
		//find user
		UserEntity user = userReposiroty.findByEmail(signInDto.getEmail());
		if(Objects.isNull(user)) {
			throw new AuthenticationFailException("user is not valid");
		}
		//hash password
		try {
			if(!user.getPassword().equals(hashPassword(signInDto.getPassword()))) {
				throw new AuthenticationFailException("wrong password");
			}
		}catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		//if password match
		AuthenticationTokenEntity token = authenticationService.getToken(user);
		//retrive token
		if(Objects.isNull(token)) {
			throw new CustomException("token is not present");
			
		}
		return new SignInResponseDto("sucess", token.getToken());
		
	}

}
