package com.boutiqa.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.boutiqa.entity.Seller;

public interface SellerRepository extends JpaRepository<Seller, Long>{
	boolean existsByBusinessRegNumber(String businessRegNumber);
}
