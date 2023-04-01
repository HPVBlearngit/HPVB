package com.pvb.dto.cart;

import com.pvb.entity.CartEntity;
import com.pvb.entity.ToyEntity;

public class CartItemsDto {
	private long id;
	private int qty;
	private ToyEntity toy;
	private String toyimages;

	public CartItemsDto() {
	}

	public CartItemsDto(CartEntity cart) {
		this.id = cart.getId();
		this.qty = cart.getQuantity();
		this.setToy(cart.getToy());
		this.setToyimages(cart.getToy().getToyImageEntities().get(0).getUrl());
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public ToyEntity getToy() {
		return toy;
	}

	public void setToy(ToyEntity toy) {
		this.toy = toy;
	}

	public String getToyimages() {
		return toyimages;
	}

	public void setToyimages(String toyimages) {
		this.toyimages = toyimages;
	}

	

}
