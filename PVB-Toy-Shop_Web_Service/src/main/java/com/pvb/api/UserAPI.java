package com.pvb.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.pvb.Service.impl.UserService;
import com.pvb.dto.user.ResponseDto;
import com.pvb.dto.user.SignInDto;
import com.pvb.dto.user.SignInResponseDto;
import com.pvb.dto.user.SignUpDto;

@RestController
@RequestMapping("/pvb/user")

public class UserAPI {

	@Autowired
	private UserService userService;



	@PostMapping("/signup")
	public ResponseDto signUp(@RequestBody SignUpDto signUpDto) {
		return userService.signUp(signUpDto);
	}
	
	@PostMapping("/signin")
	public SignInResponseDto signIn(@RequestBody SignInDto signInDto) {

		return userService.signIn(signInDto);
		
	}


}
