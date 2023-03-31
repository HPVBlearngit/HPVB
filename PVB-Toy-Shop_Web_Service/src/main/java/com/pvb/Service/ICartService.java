package com.pvb.Service;

import com.pvb.dto.cart.AddToCartDto;
import com.pvb.dto.cart.CartDto;
import com.pvb.dto.cart.CartItemsDto;
import com.pvb.entity.UserEntity;

public interface ICartService {
	
	void addToCart(AddToCartDto addToCartDto, UserEntity user);
	CartDto listCartItems(UserEntity user);
	void deleteCartItems(long cartItemId, UserEntity user);
	void updateCart(UserEntity user, long cartItemId, AddToCartDto addToCartDto);
}
