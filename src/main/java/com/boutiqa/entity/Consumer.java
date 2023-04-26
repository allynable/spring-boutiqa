package com.boutiqa.entity;


import java.util.Optional;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="consumer")
public class Consumer {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="consumer_id")
	private int consumerId;
	
	@OneToOne
	@JoinColumn(name="user_id")
	private User user;
	
	@OneToOne(optional = true)
    @JoinColumn(name = "address_id")
    private Address address;
	
	@OneToOne
	@JoinColumn(name="cart_id")
	private Cart cart;

	public Consumer() {
	}

	public Consumer(User user, Cart cart) {
		super();
		this.user = user;
		this.cart = cart;
	}

	public int getConsumerId() {
		return consumerId;
	}

	public void setConsumerId(int consumerId) {
		this.consumerId = consumerId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Optional<Address> getAddress() {
        return Optional.ofNullable(address);
    }

	public void setAddress(Address address) {
		this.address = address;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}
}
