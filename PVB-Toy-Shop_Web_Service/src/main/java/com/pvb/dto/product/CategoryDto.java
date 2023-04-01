package com.pvb.dto.product;

public class CategoryDto {
	private Long id;
	private String category;
	private String description;
	private String catImg;
	
	public CategoryDto(long id, String category, String description, String catImg) {
		
		this.id = id;
		this.category = category;
		this.description = description;
		this.catImg = catImg;
	}

	public CategoryDto() {
		
	}
	
	

	public String getCatImg() {
		return catImg;
	}

	public void setCatImg(String catImg) {
		this.catImg = catImg;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	
	
	
	
}
