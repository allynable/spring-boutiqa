package com.boutiqa.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.boutiqa.entity.Address;

public interface AddressRepository extends JpaRepository<Address, Long>{
    
}
