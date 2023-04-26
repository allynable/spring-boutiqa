package com.boutiqa.service;


import java.util.Optional;

import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.boutiqa.entity.User;
import com.boutiqa.repository.LoginRepository;


@Service
@Transactional
public class LoginService{

	@Autowired
	LoginRepository repository;
	
	public Optional<User> validateUser(User user) {
		return repository.findByUsernameAndPassword(user.getUsername(), user.getPassword());
	}

	public User findByUserName (String userName) {
		return repository.findByUsername(userName);
	}

	public Optional<User> validateCredential(User user) {
		return repository.findByUsernameAndPassword(user.getUsername(), user.getPassword());
	}
}
