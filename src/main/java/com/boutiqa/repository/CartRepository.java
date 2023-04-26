package com.boutiqa.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.boutiqa.entity.Cart;

public interface CartRepository extends JpaRepository<Cart, Long>{

}
