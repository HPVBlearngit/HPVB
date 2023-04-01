package com.pvb.dto.product;

import java.util.Date;
import java.util.List;

public class ToyDto {
	private long id;
	private String name;
	private String SKU;
	private String description;
	private double price;
	private int qtyInStock;
	private Date createAt;
	private Date modifiedAt;
	private CategoryDto category;
	private BrandDto brand;
	private DiscountDto discount;
	private List<ToyImagesDto> toyImage;

	
	
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSKU() {
		return SKU;
	}

	public void setSKU(String sKU) {
		SKU = sKU;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQtyInStock() {
		return qtyInStock;
	}

	public void setQtyInStock(int qtyInStock) {
		this.qtyInStock = qtyInStock;
	}

	public Date getCreateAt() {
		return createAt;
	}

	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}

	public Date getModifiedAt() {
		return modifiedAt;
	}

	public void setModifiedAt(Date modifiedAt) {
		this.modifiedAt = modifiedAt;
	}

	public CategoryDto getCategory() {
		return category;
	}

	public void setCategory(CategoryDto category) {
		this.category = category;
	}

	public BrandDto getBrand() {
		return brand;
	}

	public void setBrand(BrandDto brand) {
		this.brand = brand;
	}

	public DiscountDto getDiscount() {
		return discount;
	}

	public void setDiscount(DiscountDto discount) {
		this.discount = discount;
	}

	public List<ToyImagesDto> getToyImage() {
		return toyImage;
	}

	public void setToyImage(List<ToyImagesDto> toyImage) {
		this.toyImage = toyImage;
	}

	

	

}
