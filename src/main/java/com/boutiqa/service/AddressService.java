package com.boutiqa.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boutiqa.entity.Address;
import com.boutiqa.repository.AddressRepository;

@Service
@Transactional
public class AddressService {
    @Autowired
    AddressRepository addressRepo;

    public Address newAddress(Address address){
		addressRepo.save(address);
		return address;
	}
}
