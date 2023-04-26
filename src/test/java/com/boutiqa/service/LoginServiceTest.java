package com.boutiqa.service;

import static org.junit.jupiter.api.Assertions.*;

import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.web.context.WebApplicationContext;

import com.boutiqa.config.JpaConfig;
import com.boutiqa.config.WebMvcConfig;
import com.boutiqa.entity.User;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(classes={WebMvcConfig.class, JpaConfig.class})
@WebAppConfiguration
class LoginServiceTest {
	@Autowired
	LoginService loginService;
	
	@Autowired
	private WebApplicationContext context;
	
	@Test
	void testValidateUser() {
		User user = new User();
		user.setUsername("janedoe");
		user.setPassword("abc123");
		
		User test = loginService.validateUser(user).get();
		assertTrue(test instanceof User);
	}

	@Test
	void testFindByUserName() {
		User user = loginService.findByUserName("janedoe");
		
		assertTrue(user instanceof User);
	}

	@Test
	void testValidateCredential() {
		User user = new User();
		user.setUsername("janesmith");
		user.setPassword("abc123");
		
		User test = loginService.validateCredential(user).get();
		assertTrue(test instanceof User);
	}

}
