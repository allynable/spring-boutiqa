package com.boutiqa.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import com.boutiqa.entity.UserType;

public interface UserTypeRepository extends JpaRepository<UserType, Long>{
	@Query(value = "SELECT * FROM usertype WHERE user_type_name = :userTypeName", nativeQuery = true)
	UserType findByUserTypeName(@Param("userTypeName") String userTypeName);
	
	UserType findByUserTypeId(int userTypeId);
}
