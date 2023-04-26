package com.boutiqa.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.util.Optional;
import com.boutiqa.entity.User;

public interface LoginRepository extends JpaRepository<User, Long>{
	@Query(value = "SELECT * FROM user WHERE username = :username AND password = :password", nativeQuery = true)
	Optional <User> findByUsernameAndPassword(@Param("username") String username, @Param("password") String password);

	User findByUsername(String username);
}
