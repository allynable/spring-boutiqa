package com.boutiqa.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.boutiqa.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, Long> {
    
}
