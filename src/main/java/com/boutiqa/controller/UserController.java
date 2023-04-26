package com.boutiqa.controller;

import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.boutiqa.entity.Address;
import com.boutiqa.entity.Seller;
import com.boutiqa.entity.SellerForm;
import com.boutiqa.entity.User;
import com.boutiqa.service.AddressService;
import com.boutiqa.service.ConsumerService;
import com.boutiqa.service.SellerService;
import com.boutiqa.service.UserService;

@Controller
public class UserController {
    @Autowired
    UserService userService;
    
    @Autowired
    AddressService addressService;
    
    @Autowired
    ConsumerService consumerService;
    
    @Autowired
    SellerService sellerService;
    
    @RequestMapping("/home")
	public String home(HttpSession session) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext()
			    .getAuthentication().getPrincipal();
		Optional <User> user = userService.findByUsername(userDetails.getUsername());
		session.setAttribute("user", user.get());
		return("home");
	}
    
    @RequestMapping(value = "/showConsumerProfile", method = {RequestMethod.POST, RequestMethod.GET})
	public String viewConsumerProfile(HttpSession session, Model model){
    	UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext()
			    .getAuthentication().getPrincipal();
		Optional <User> user = userService.findByUsername(userDetails.getUsername());
    	model.addAttribute("user", user.get());
		return("consumer-profile");
	}

    @RequestMapping(value = "/showConsumerAddress", method = {RequestMethod.POST, RequestMethod.GET})
   	public String viewConsumerAddress(HttpSession session, Model model){
    	UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext()
			    .getAuthentication().getPrincipal();
		Optional <User> user = userService.findByUsername(userDetails.getUsername());
       	model.addAttribute("address", user.get().getConsumer().getAddress());
   		return("consumer-address");
   	}
    
    @RequestMapping(value = "/showConsumerPassword", method = {RequestMethod.POST, RequestMethod.GET})
   	public String showConsumerPasswordForm(Model model, HttpSession session){
       	User user = new User();
       	model.addAttribute("user", user);
       	return("consumer-password");
   	}
    
    @RequestMapping(value = "/updateConsumerProfile", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView updateConsumerProfile(@ModelAttribute("user")  User user, HttpSession session,  BindingResult result) {
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("consumer-profile");
    	mav.addObject("successMessage","Profile Updated!");
    	mav.addObject("user", user);
    	userService.update(user);  	
    	session.setAttribute("user", user);
    	return mav;
    }
    
    @RequestMapping(value = "/updateConsumerAddress", method = {RequestMethod.POST})
    public ModelAndView updateConsumerAddress(@ModelAttribute("Address")  Address address,  BindingResult result, HttpSession session) {
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("consumer-address");
    	mav.addObject(address);
    	mav.addObject("successMessage","Address Updated!");
    	Address newAddress = addressService.newAddress(address);
    	User user = (User) session.getAttribute("user");
    	consumerService.addAddress(user.getConsumer().getConsumerId(), newAddress);
    	return mav;
    }
    
    @RequestMapping(value="/updatePassword", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView updatePassword(@ModelAttribute("user")User newUser, BindingResult result, HttpSession session) {
    	ModelAndView mav = new ModelAndView();
    	User user = (User) session.getAttribute("user");

    	if(!user.getPassword().equals(newUser.getPassword())) {
    		mav.setViewName("consumer-password");
    		mav.addObject("errorMessage", "Incorrect Password!");
    	}
    	
    	if (!newUser.getNewPassword().equals(newUser.getConfirmPassword())) {
    		mav.setViewName("consumer-password");
    		mav.addObject("notMatchError", "Password does not match!");
    	}
    	
    	if(!mav.getModel().isEmpty()) {
    		return mav;
    	}
    	mav.setViewName("consumer-password");
    	userService.updatePassword(user, newUser);
    	mav.addObject("successMessage", "Password successfully changed!");
    	return mav;
    }
    
    @RequestMapping(value="/showSellerProfile", method = {RequestMethod.POST, RequestMethod.GET})
	public String viewSellerProfile(HttpSession session, Model model) {
    	UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext()
			    .getAuthentication().getPrincipal();
		Optional <User> user = userService.findByUsername(userDetails.getUsername());
		SellerForm sellerForm = new SellerForm(user.get(), user.get().getSeller(), user.get().getSeller().getAddress());
		model.addAttribute("sellerForm", sellerForm);
		return("seller-profile");
	}
    
    @RequestMapping(value = "/updateSellerProfile", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView updateSellerProfile(@ModelAttribute("sellerForm")  SellerForm sellerForm, HttpSession session,  BindingResult result) {
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("seller-profile");
	
    	User user = sellerForm.getUser();
    	Seller seller = sellerForm.getSeller();
    	Address address = sellerForm.getAddress();
    	address.setAddressId(sellerForm.getAddressId());
    	seller.setSellerId(sellerForm.getSellerId());
    	seller.setAddress(address);
    	seller.setUser(userService.update(user));
    	addressService.newAddress(address);
    	sellerService.update(seller);
    	session.setAttribute("user", user);
    	mav.addObject("successMessage","Profile Updated!");
    	mav.addObject("sellerForm", sellerForm);
    	return mav;
    }
}
