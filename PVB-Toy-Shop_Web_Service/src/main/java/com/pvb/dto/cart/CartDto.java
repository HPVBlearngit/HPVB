package com.pvb.dto.cart;

import java.util.List;

public class CartDto {
	private List<CartItemsDto> cartItems;
	private double totalPrice;

	public CartDto() {

	}

	public List<CartItemsDto> getCartItems() {
		return cartItems;
	}

	public void setCartItems(List<CartItemsDto> cartItems) {
		this.cartItems = cartItems;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

}
