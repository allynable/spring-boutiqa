package com.boutiqa.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.boutiqa.entity.Consumer;

public interface ConsumerRepository extends JpaRepository<Consumer, Long>{
    Optional <Consumer> findByConsumerId(int consumerId);
    @Query(value="SELECT * FROM consumer WHERE user_id = :user_id", nativeQuery = true)
    Optional <Consumer>findByUserId(@Param("user_id")int userId); 
    
}
