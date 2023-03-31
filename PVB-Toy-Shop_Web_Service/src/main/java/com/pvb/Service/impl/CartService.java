package com.pvb.Service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pvb.Service.ICartService;
import com.pvb.dto.cart.AddToCartDto;
import com.pvb.dto.cart.CartDto;
import com.pvb.dto.cart.CartItemsDto;
import com.pvb.entity.BrandEntity;
import com.pvb.entity.CartEntity;
import com.pvb.entity.ToyEntity;
import com.pvb.entity.UserEntity;
import com.pvb.exception.CustomException;
import com.pvb.exception.ResourceNotFoundException;
import com.pvb.repository.CartRepository;
import com.pvb.repository.ToyRepository;

@Service
public class CartService implements ICartService {
	@Autowired
	ToyService toyService;
	@Autowired
	CartRepository cartRepository;
	@Autowired
	ToyRepository toyRepository;

	public void addToCart(AddToCartDto addToCartDto, UserEntity user) {
		ToyEntity toy = toyService.findById(addToCartDto.getToyId());
		CartEntity cart = new CartEntity();
		cart.setToy(toy);
		cart.setQuantity(addToCartDto.getQty());
		cart.setUser(user);
		cart.setCreateDate(new Date());
		cartRepository.save(cart);

	}

	public CartDto listCartItems(UserEntity user) {
		List<CartEntity> cartList = cartRepository.findAllByUserOrderByCreateDateDesc(user);
		List<CartItemsDto> cartItems = new ArrayList<>();
		double totalPrice = 0;
		
		for (CartEntity cart : cartList) {
			CartItemsDto cartItemsDto = new CartItemsDto(cart);
			if(cartItemsDto.getToy().getDiscount() == null) {
				totalPrice += cartItemsDto.getQty() * cart.getToy().getPrice();
				
			}else {
				totalPrice += cartItemsDto.getQty() * (cart.getToy().getPrice() - ((cart.getToy().getPrice() * cart.getToy().getDiscount().getPercent())/100));
			}
			cartItems.add(cartItemsDto);
		}

		CartDto cartDto = new CartDto();
		cartDto.setCartItems(cartItems);
		cartDto.setTotalPrice(totalPrice);

		return cartDto;
	}

	public void deleteCartItems(long cartItemId, UserEntity user) {
		Optional<CartEntity> optionalCart = cartRepository.findById(cartItemId);
		if (!optionalCart.isPresent()) {
			throw new CustomException("Cart item id is invalid: " + cartItemId);
		}

		CartEntity cartEntity = optionalCart.get();
		if (cartEntity.getUser() != user) {
			throw new CustomException("Cart not belong to user : " + user.getEmail());

		}
		cartRepository.delete(cartEntity);
	}

	public void updateCart(UserEntity user, long cartItemId, AddToCartDto addToCartDto) {
		
		Optional<CartEntity> optionalCart = cartRepository.findById(cartItemId);
		CartEntity cart = optionalCart.get();
		if (!optionalCart.isPresent()) {
			throw new CustomException("Cart item id is invalid: " + cartItemId);
		}else {	
			cart.setQuantity(addToCartDto.getQty());
		}

		
		cartRepository.save(cart);
	}

}
