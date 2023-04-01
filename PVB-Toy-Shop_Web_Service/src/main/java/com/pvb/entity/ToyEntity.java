package com.pvb.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "toy")
public class ToyEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	@Column(name = "name")
	private String name;
	@Column(name = "SKU")
	private String SKU;
	@Column(name = "description")
	private String description;
	@Column(name = "price")
	private double price;
	@Column(name = "qty_in_stock")
	private int qtyInStock;
	@Column(name = "create_at")
	private Date createAt;
	@Column(name = "modified_at")
	private Date modifiedAt;
	@ManyToOne	
	@JoinColumn(name = "category_id")
	@JsonIgnore
	private CategoryEntity category;
	@ManyToOne
	@JoinColumn(name = "brand_id")
	@JsonIgnore
	private BrandEntity brand;
	@ManyToOne
	@JoinColumn(name = "discount_id")
	@JsonIgnore
	private DiscountEntity discount;
	
	@OneToMany(mappedBy = "toy")
	@JsonIgnore
	private List<ToyImageEntity> toyImageEntities;
	
	  
	
	

	public List<ToyImageEntity> getToyImageEntities() {
		return toyImageEntities;
	}

	public void setToyImageEntities(List<ToyImageEntity> toyImageEntities) {
		this.toyImageEntities = toyImageEntities;
	}

	public void setId(long id) {
		this.id = id;
	}

	public CategoryEntity getCategory() {
		return category;
	}

	public void setCategory(CategoryEntity category) {
		this.category = category;
	}

	public BrandEntity getBrand() {
		return brand;
	}

	public void setBrand(BrandEntity brand) {
		this.brand = brand;
	}

	public DiscountEntity getDiscount() {
		return discount;
	}

	public void setDiscount(DiscountEntity discount) {
		this.discount = discount;
	}

	public long getId() {
		return id;
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

	


	
	
	

}
