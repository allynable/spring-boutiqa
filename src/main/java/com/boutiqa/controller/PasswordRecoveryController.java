package com.boutiqa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.boutiqa.entity.User;
import com.boutiqa.service.UserService;

@Controller
public class PasswordRecoveryController {
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/forgotPassword")
	public String forgotPassword() {
		return "forgot-password";
	}
	
	@RequestMapping(value = "/recoverPassword", method = RequestMethod.POST)
	public ModelAndView recoverPassword(@RequestParam String email) {
		ModelAndView mav = new ModelAndView();
		if(!userService.checkEmail(email)) {
			mav.setViewName("forgot-password");
			mav.addObject("errorMessage", "Email is not registered!");
			return mav;
		}
		
		mav.addObject("email", email);
		mav.setViewName("reset-password");
		return mav;
	}
	
	@RequestMapping(value = "/resetPasswordForm", method = RequestMethod.GET)
	public String showResetPasswordForm(@RequestParam String email) {
		
		if(email.isEmpty()) {
			return "forgot-password";
		}
		return "reset-password";
	}
	
	@RequestMapping(value = "/resetPassword", method = {RequestMethod.POST})
	public ModelAndView resetPassword(@RequestParam String email,  @RequestParam String password, @RequestParam String confirmPassword) { 
		ModelAndView mav = new ModelAndView();
		if(!password.equals(confirmPassword)) {
			mav.setViewName("reset-password");
			mav.addObject("email", email);
			mav.addObject("errorMessage", "Password does not match!");
			return mav;
		}
		User user = userService.findByEmail(email).get();
		user.setPassword(password);
		userService.save(user);
		mav.addObject("successMessage", "Your password has been successfully updated!");
		mav.setViewName("reset-password-success");
		return mav;
	}
}
