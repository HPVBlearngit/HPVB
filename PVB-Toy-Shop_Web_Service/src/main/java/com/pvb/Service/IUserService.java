package com.pvb.Service;

import com.pvb.dto.user.ResponseDto;
import com.pvb.dto.user.SignInDto;
import com.pvb.dto.user.SignInResponseDto;
import com.pvb.dto.user.SignUpDto;

public interface IUserService {
	public ResponseDto signUp(SignUpDto signUpDto);
	public SignInResponseDto signIn	(SignInDto signInDto);
}
