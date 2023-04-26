package com.boutiqa.service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;
import javax.transaction.Transactional;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.boutiqa.entity.User;
import com.boutiqa.entity.UserType;
import com.boutiqa.repository.UserRepository;
import com.boutiqa.repository.UserTypeRepository;

@Service
@Transactional
public class UserService{
	@Autowired
	UserRepository repository;
	
	@Autowired
	UserTypeRepository userTypeRepo;
	
	public User register(User consumer) {
		UserType userType = userTypeRepo.findByUserTypeName(consumer.getRole());
		LocalDateTime localDateTime = LocalDateTime.now();
		Timestamp timestamp = Timestamp.valueOf(localDateTime);
		String formatString = "yyyy-MM-dd HH:mm:ss.SSSSSS";
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern(formatString);
		String formattedTimestamp = timestamp.toLocalDateTime().format(dateTimeFormatter);
		consumer.setUserType(userType);
		consumer.setCreatedAt(formattedTimestamp);
		repository.save(consumer);
		return consumer;
	}
	
	public User update(User user){
		user.setUserType(userTypeRepo.findByUserTypeName(user.getRole()));
		repository.save(user);
		return user;
	}
	
	public User save(User user) {
		return repository.save(user);
	}
	
	public boolean checkUsername(String username) {
		return repository.existsByUsername(username);
	}
	
	public boolean checkEmail(String email) {
		return repository.existsByEmail(email);
	}

	public Optional<User> findById(int userId) {
		return repository.findById(userId);
	}

	public Optional<User> findByEmail(String email){
		return repository.findByEmail(email);
	}
	
	public Optional<User> findByUsername(String username){
		return repository.findByUsername(username);
	}
	
	public void updatePassword(User oldUser, User newUser) {
		oldUser.setPassword(newUser.getNewPassword());
		repository.save(oldUser);
	}
	
	public Page<User> getUsersNot(int userTypeId, Pageable pageable){
		UserType userType = userTypeRepo.findByUserTypeId(userTypeId);
		return repository.findByUserTypeNot(userType, pageable);
	}
	
	public Page<User> getUsers(int userTypeId, Pageable pageable){
		UserType userType = userTypeRepo.findByUserTypeId(userTypeId);
		return repository.findByUserType(userType, pageable);
	}
	
	public List<User> searchUser(int userTypeId,String keyword){
		UserType userType = userTypeRepo.findByUserTypeId(userTypeId);
		return repository.searchUser(userType, keyword);
	}
}
