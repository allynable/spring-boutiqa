package com.boutiqa.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="seller")
public class Seller {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="seller_id")
	private int sellerId;
	
	@OneToOne
	@JoinColumn(name="user_id")
	private User user;
	
	@OneToOne
	@JoinColumn(name="address_id")
	private Address address;
	
	@Column(name="store_name")
	private String storeName;
	
	@Column(name="store_description")
	private String storeDescription;
	
	@Column(name="business_reg_number")
	private String businessRegNumber;
	
	@OneToMany(mappedBy="seller")
	private Set<Product> product = new HashSet<>();
	
	public Seller() {
	}

	public Seller(User user, Address address, String storeName, String storeDescription, String businessRegNumber,
			Set<Product> product) {
		super();
		this.user = user;
		this.address = address;
		this.storeName = storeName;
		this.storeDescription = storeDescription;
		this.businessRegNumber = businessRegNumber;
		this.product = product;
	}

	public int getSellerId() {
		return sellerId;
	}

	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getStoreDescription() {
		return storeDescription;
	}

	public void setStoreDescription(String storeDescription) {
		this.storeDescription = storeDescription;
	}

	public String getBusinessRegNumber() {
		return businessRegNumber;
	}

	public void setBusinessRegNumber(String businessRegNumber) {
		this.businessRegNumber = businessRegNumber;
	}

	public Set<Product> getProduct() {
		return product;
	}

	public void setProduct(Set<Product> product) {
		this.product = product;
	}
}
