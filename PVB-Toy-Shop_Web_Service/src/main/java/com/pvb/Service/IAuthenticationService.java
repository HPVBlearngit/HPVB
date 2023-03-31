package com.pvb.Service;

import com.pvb.entity.AuthenticationTokenEntity;

public interface IAuthenticationService {

	void saveConfirmationToken(AuthenticationTokenEntity authenticationTokenEntity);
}
