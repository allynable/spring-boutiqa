package com.boutiqa.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boutiqa.entity.Address;
import com.boutiqa.entity.Consumer;
import com.boutiqa.repository.ConsumerRepository;

@Service
@Transactional
public class ConsumerService {
    @Autowired
    ConsumerRepository consumerRepo;

    public Consumer newConsumer(Consumer consumer){
        return consumerRepo.save(consumer);
    }
    
    public void addAddress(int consumerId, Address address) {
    	Consumer consumer = (consumerRepo.findByConsumerId(consumerId)).get();
    	consumer.setAddress(address);
    	consumerRepo.save(consumer);
    }
}
