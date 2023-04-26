package com.boutiqa.service;


import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boutiqa.entity.Product;
import com.boutiqa.entity.Seller;
import com.boutiqa.repository.ProductRepository;

@Service
@Transactional
public class ProductService {
    @Autowired
    private ProductRepository productRepo;

    public List<Product> getAllProducts() {
		return productRepo.findAll();
	}

    public Product saveProduct(Product product){
        return productRepo.save(product);
    }
    
    public List<Product> findBySeller(Seller seller){
    	return productRepo.findBySeller(seller);
    }
    
    public List<Product> findAllWithImages() {
        return productRepo.findAllWithImages();
    }
    
    public List<Product> search(String keyword){
    	return productRepo.search(keyword);
    }
}
