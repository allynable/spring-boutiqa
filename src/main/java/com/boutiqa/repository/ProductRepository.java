package com.boutiqa.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.boutiqa.entity.Product;
import com.boutiqa.entity.Seller;

public interface ProductRepository extends JpaRepository<Product, Long> {
	
    List <Product> findBySeller(Seller seller);
    
    @Query("SELECT DISTINCT p FROM Product p JOIN FETCH p.productImage")
    List<Product> findAllWithImages();
    
    @Query("SELECT p FROM Product p JOIN FETCH p.productImage where p.productName LIKE '%' || :keyword || '%'")
    List<Product> search(@Param("keyword")String keyword); 
}
