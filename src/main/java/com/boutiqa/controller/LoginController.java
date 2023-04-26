package com.boutiqa.controller;

import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.boutiqa.entity.User;
import com.boutiqa.service.LoginService;
import com.boutiqa.service.UserService;

@Controller
public class LoginController {
	
	@Autowired
	LoginService loginService;
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/showLogin", method = RequestMethod.GET)
	public ModelAndView showLogin() {
		ModelAndView mav = new ModelAndView("login");
		mav.addObject("user", new User());
		return mav;
	}
	
	@RequestMapping(value = "/login", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView loginProcess(@ModelAttribute("user") User login, HttpSession session) {
		ModelAndView mav = null;
		Optional <User> loginUser = loginService.validateUser(login);
		if (loginUser == null || !loginUser.isPresent()) {
			mav = new ModelAndView("login");
			mav.addObject("message", "Incorrect Username or Password!");
		} 
		return mav;
	}
}
