package com.pvb.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;



@Entity
@Table(name = "category")
public class CategoryEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;	
	@Column(name = "category")
	private String category;
	@Column(name = "description")
	private String description;
	
	@Column(name = "cat_img")
	private String catImg;
	
	@OneToMany(mappedBy = "category")
	private List<ToyEntity> toys = new ArrayList<>();

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

	public List<ToyEntity> getToys() {
		return toys;
	}

	public void setToys(List<ToyEntity> toys) {
		this.toys = toys;
	}

	public long getId() {
		return id;
	}

	public String getCatImg() {
		return catImg;
	}

	public void setCatImg(String catImg) {
		this.catImg = catImg;
	}

	public void setId(long id) {
		this.id = id;
	}
	
	
	
	
	
	
}
