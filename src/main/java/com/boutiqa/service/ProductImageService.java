package com.boutiqa.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boutiqa.entity.ProductImage;
import com.boutiqa.repository.ProductImageRepository;

@Service
@Transactional
public class ProductImageService {
	@Autowired
	ProductImageRepository productImageRepo;
	
	public void save(ProductImage productImage) {
		productImage.setImageUrl("/images/default.png");
		productImageRepo.save(productImage);
	}
}
