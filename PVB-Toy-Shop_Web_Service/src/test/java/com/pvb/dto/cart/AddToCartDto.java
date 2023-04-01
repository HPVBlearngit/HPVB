package com.pvb.dto.cart;

import com.sun.istack.NotNull;

public class AddToCartDto {
	private long id;
	private @NotNull long toyId;
	private @NotNull int qty;

	public AddToCartDto() {

	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getToyId() {
		return toyId;
	}

	public void setToyId(long toyId) {
		this.toyId = toyId;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

}
