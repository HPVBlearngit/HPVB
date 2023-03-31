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
@Table(name = "toy_brand")
public class BrandEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	@Column(name = "brand")
	private String brand;

	@OneToMany(mappedBy = "brand")
	private List<ToyEntity> toys = new ArrayList<>();

	public List<ToyEntity> getToys() {
		return toys;
	}

	public void setToys(List<ToyEntity> toys) {
		this.toys = toys;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public long getId() {
		return id;
	}
}
