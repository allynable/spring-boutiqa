package com.boutiqa.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boutiqa.entity.Cart;
import com.boutiqa.repository.CartRepository;

@Service
@Transactional
public class CartService {
    @Autowired
    CartRepository cartRepo;

    public Cart newCart(){
        Cart cart = new Cart();
        return cartRepo.save(cart);
    }
}
