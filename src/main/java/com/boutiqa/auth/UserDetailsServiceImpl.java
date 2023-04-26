package com.boutiqa.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.boutiqa.entity.User;
import com.boutiqa.service.LoginService;


public class UserDetailsServiceImpl implements UserDetailsService {
	@Autowired
    private LoginService loginService;

    @Autowired
    private PasswordEncoder passwordEncoder;
    
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		User login = loginService.findByUserName(userName);
        if(login == null) {
            throw new UsernameNotFoundException("Login User " + userName + " is not valid. Please re-enter.");
        }
        org.springframework.security.core.userdetails.User.UserBuilder userBuilder = org.springframework.security.core.userdetails.User.builder();
        
        String role = login.getUserType().getUserTypeName();
		
       return userBuilder.username(login.getUsername())
                        .password(login.getPassword())
                        .roles(role)
                        .passwordEncoder(passwordEncoder::encode)
                        .build();
	}

}
