package com.boutiqa.repository;


import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.boutiqa.entity.User;
import com.boutiqa.entity.UserType;

public interface UserRepository extends JpaRepository<User,Long> {
	boolean existsByUsername(String username);
    boolean existsByEmail(String email);
    
    @Query(value = "SELECT * FROM user WHERE user_id = :userId", nativeQuery = true)
    Optional<User> findById(@Param("userId") int userId);
    
    @Query(value = "SELECT * FROM user WHERE email = :email", nativeQuery = true)
	Optional<User> findByEmail(@Param("email") String email);
    
    @Query(value = "SELECT * FROM user WHERE username = :username", nativeQuery = true)
	Optional<User> findByUsername(@Param("username") String username);
    
    Page<User> findByUserTypeNot(UserType userType, Pageable pageable);
    
    Page<User> findByUserType(UserType userType, Pageable pageable);
    
    @Query(value="SELECT u FROM User u WHERE u.userType <> :userType AND ( u.firstName LIKE '%' || :keyword || '%'"
    		+ "OR u.lastName LIKE '%' || :keyword || '%'"
    		+ "OR u.email  LIKE '%' || :keyword || '%'"
    		+ "OR u.username  LIKE '%' || :keyword || '%'"
    		+ "OR u.phoneNumber  LIKE '%' || :keyword || '%'"
    		+ "OR u.gender  LIKE '%' || :keyword || '%'"
    		+ "OR u.dateOfBirth  LIKE '%' || :keyword || '%')")
    List<User> searchUser(@Param("userType")UserType userType, @Param("keyword") String keyword);
}
