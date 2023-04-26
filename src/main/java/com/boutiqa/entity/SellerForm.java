package com.boutiqa.entity;

public class SellerForm {
    private User user;
    private Seller seller;
    private Address address;
    private int addressId;
    private int sellerId;
    
    public int getAddressId() {
		return addressId;
	}

	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}

	public int getSellerId() {
		return sellerId;
	}

	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}

	public SellerForm() {
		
	}
    
	public SellerForm(User user, Seller seller, Address address) {
		super();
		this.user = user;
		this.seller = seller;
		this.address = address;
	}
	public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public Seller getSeller() {
        return seller;
    }
    public void setSeller(Seller seller) {
        this.seller = seller;
    }

    public Address getAddress() {
        return this.address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

}
