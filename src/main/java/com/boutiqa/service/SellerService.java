package com.boutiqa.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boutiqa.entity.Address;
import com.boutiqa.entity.Seller;
import com.boutiqa.entity.User;
import com.boutiqa.repository.SellerRepository;

@Service
@Transactional
public class SellerService {
    @Autowired
    SellerRepository sellerRepo;
    
    public Seller newSeller(Seller seller, User user, Address address){
		seller.setAddress(address);
		seller.setUser(user);
		sellerRepo.save(seller);
		return seller;
	}
    
    public boolean checkBusinessRegNumber(String businessRegNumber) {
		return sellerRepo.existsByBusinessRegNumber(businessRegNumber);
	}
    
    public void update(Seller seller) {
    	sellerRepo.save(seller);
    }
}
