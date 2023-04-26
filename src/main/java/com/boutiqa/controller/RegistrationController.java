package com.boutiqa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.boutiqa.entity.Address;
import com.boutiqa.entity.Cart;
import com.boutiqa.entity.Consumer;
import com.boutiqa.entity.SellerForm;
import com.boutiqa.entity.User;
import com.boutiqa.service.AddressService;
import com.boutiqa.service.CartService;
import com.boutiqa.service.ConsumerService;
import com.boutiqa.service.SellerService;
import com.boutiqa.service.UserService;

@Controller
public class RegistrationController {
	@Autowired
	public UserService userService;

	@Autowired
	public SellerService sellerService;

	@Autowired
	public AddressService addressService;

	@Autowired
	public CartService cartService;

	@Autowired
	public ConsumerService consumerService;
	
	@RequestMapping(value="/consumerRegistration", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView showConsumerRegistrationForm() {
		ModelAndView mav = new ModelAndView("consumer-registration");
		mav.addObject("user", new User());
		return mav;
	}
	
	@RequestMapping(value="/registerConsumer", method = RequestMethod.POST)
	public ModelAndView registerConsumer(@ModelAttribute("user")  User user,  BindingResult result) {
		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()) {
			mav.setViewName("consumer-registration");
			return mav;
		}
		
		if(userService.checkEmail(user.getEmail())) {
			mav.setViewName("consumer-registration");
			mav.addObject("errorEmail", "Email already existing!");
		}
		
		if(userService.checkUsername(user.getUsername())) {
			mav.setViewName("consumer-registration");
			mav.addObject("errorUsername", "Username already existing!");
		}

		if (!user.getPassword().equals(user.getConfirmPassword())) {
			mav.setViewName("consumer-registration");
			mav.addObject("errorPassword", "Password does not match");
		}
		
		if(!mav.getModel().isEmpty()) {
			return mav;
		}
		
		User newUser = userService.register(user);
		Cart newCart = cartService.newCart();
		Consumer consumer = new Consumer(newUser, newCart);
		consumerService.newConsumer(consumer);
		mav.setViewName("registration-success");
		mav.addObject("successMessage", "Registered Successfully. Login using username and password");
		mav.addObject("firstName", user.getFirstName());
		mav.addObject("id", user.getUserId());
		return mav;	
	}

	@RequestMapping(value="/sellerRegistration", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView showSellerRegistrationForm() {
		ModelAndView mav = new ModelAndView("seller-registration");
		mav.addObject("sellerForm", new SellerForm());
		return mav;
	}

	@RequestMapping(value = "/registerSeller", method = RequestMethod.POST)
	public ModelAndView registerSeller(@ModelAttribute("sellerForm") SellerForm sellerForm,  BindingResult result){
		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()){
			mav.setViewName("seller-registration");
			return mav;
		}
		
		if(userService.checkEmail(sellerForm.getUser().getEmail())) {
			mav.addObject("errorEmail", "Email already existing!");
		}
		
		if(userService.checkUsername(sellerForm.getUser().getUsername())) {
			mav.addObject("errorUsername", "Username already existing!");
		}

		if (!sellerForm.getUser().getPassword().equals(sellerForm.getUser().getConfirmPassword())) {
			mav.addObject("errorPassword", "Password does not match");
		}
		
		if(sellerService.checkBusinessRegNumber(sellerForm.getSeller().getBusinessRegNumber())) {
			mav.addObject("errorBusinessRegNumber", "Existing Business Registration Number!");
		}
		
		if(!mav.getModel().isEmpty()) {
			mav.setViewName("seller-registration");
			return mav;
		}

		User user = userService.register(sellerForm.getUser());
		Address address = addressService.newAddress(sellerForm.getAddress());
		sellerService.newSeller(sellerForm.getSeller(), user, address);
		System.out.println(user.toString());
		System.out.println(address.toString());
		mav.setViewName("registration-success");
		mav.addObject("firstName", user.getFirstName());
		mav.addObject("successMessage", "Store registered successfully! Kindly check your email for verification. Thank you!");
		return mav;
	}
}
