package com.boutiqa.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.boutiqa.entity.Address;
import com.boutiqa.entity.Cart;
import com.boutiqa.entity.Consumer;
import com.boutiqa.entity.Seller;
import com.boutiqa.entity.SellerForm;
import com.boutiqa.entity.User;
import com.boutiqa.service.AddressService;
import com.boutiqa.service.CartService;
import com.boutiqa.service.ConsumerService;
import com.boutiqa.service.SellerService;
import com.boutiqa.service.UserService;

@Controller
public class AdminController {
	private final int PAGE_SIZE = 10;
	
	@Autowired
	UserService userService;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	ConsumerService	consumerService;
	
	@Autowired
	SellerService sellerService;
	
	@Autowired
	AddressService addressService;
	
	@RequestMapping(value="/userAdministration", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView showUserAdministationPage(@RequestParam(name = "page", defaultValue = "0")int page ,@RequestParam(name="userTypeId", defaultValue="3")int userTypeId) {
		ModelAndView mav = new ModelAndView();
		if(userTypeId != 3) {
			Page<User> userPage = userService.getUsers(userTypeId, PageRequest.of(page, PAGE_SIZE));
			List<User> users = userPage.getContent();
			mav.addObject("users", users);
			int totalPages = userPage.getTotalPages();
			mav.addObject("totalPages", totalPages);
			mav.addObject("currentPage", page);
			mav.setViewName("user-administration");
			return mav;
		}
		Page<User> userPage = userService.getUsersNot(3, PageRequest.of(page, PAGE_SIZE));
		List<User> users = userPage.getContent();
		mav.addObject("users", users);
		int totalPages = userPage.getTotalPages();
		mav.addObject("totalPages", totalPages);
		mav.addObject("currentPage", page);
		mav.setViewName("user-administration");
		return mav;
	}
	
	@RequestMapping(value="/userSearch", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView searchUser(@RequestParam String keyword) {
		ModelAndView mav = new ModelAndView("search-user");
		List<User> searchUser = userService.searchUser(3, keyword);
		mav.addObject("searchUser", searchUser);
		return mav;
	}
	
	@RequestMapping(value="/addConsumerForm", method= RequestMethod.GET)
	public ModelAndView showAddConsumer() {
		ModelAndView mav = new ModelAndView("add-consumer");
		mav.addObject("user", new User());
		return mav;
	}
	
	@RequestMapping(value="/addConsumer", method= RequestMethod.POST)
	public ModelAndView addConsumer(@ModelAttribute("user")  User user,  BindingResult result) {
		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()) {
			mav.setViewName("add-seller");
			return mav;
		}
		
		if(userService.checkEmail(user.getEmail())) {
			mav.addObject("errorEmail", "Email already existing!");
		}
		
		if(userService.checkUsername(user.getUsername())) {
			mav.addObject("errorUsername", "Username already existing!");
		}

		if (!user.getPassword().equals(user.getConfirmPassword())) {
			mav.addObject("errorPassword", "Password does not match");
		}
		
		if(!mav.getModel().isEmpty()) {
			mav.setViewName("add-consumer");
			return mav;
		}
		
		User newUser = userService.register(user);
		Cart newCart = cartService.newCart();
		Consumer consumer = new Consumer(newUser, newCart);
		consumerService.newConsumer(consumer);
		mav.setViewName("redirect:/userAdministration");
		mav.addObject("successMessage", "1");
		return mav;	
	}
	
	@RequestMapping(value="/addSellerForm", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView showAddSeller() {
		ModelAndView mav = new ModelAndView("add-seller");
		mav.addObject("sellerForm", new SellerForm());
		return mav;
	}
	
	@RequestMapping(value = "/addSeller", method = RequestMethod.POST)
	public ModelAndView addSeller(@ModelAttribute("sellerForm") SellerForm sellerForm,  BindingResult result){
		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()){
			mav.setViewName("add-seller");
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
			mav.setViewName("add-seller");
			return mav;
		}

		User user = userService.register(sellerForm.getUser());
		Address address = addressService.newAddress(sellerForm.getAddress());
		sellerService.newSeller(sellerForm.getSeller(), user, address);
		System.out.println(user.toString());
		System.out.println(address.toString());
		mav.setViewName("redirect:/userAdministration");
		mav.addObject("successMessage", "2");
		return mav;
	}
	
	@RequestMapping(value="/editConsumerForm", method=RequestMethod.GET)
	public ModelAndView showConsumerEditForm(@RequestParam("userId") int userId) {
		User user = userService.findById(userId).get();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("edit-consumer");
		mav.addObject("user", user);
		return mav;
	}
	
	@RequestMapping(value = "/updateConsumer", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView updateConsumer(@ModelAttribute("user")  User user, BindingResult result) {
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("redirect:/userAdministration");
    	mav.addObject("successMessage","3");
    	userService.update(user);  	
    	return mav;
    }
	
	@RequestMapping(value="/editSellerForm", method=RequestMethod.GET)
	public ModelAndView editSellerForm(@RequestParam("userId") int userId) {
		User user = userService.findById(userId).get();
		SellerForm sellerForm = new SellerForm(user, user.getSeller(), user.getSeller().getAddress());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("edit-seller");
		mav.addObject("sellerForm", sellerForm);
		return mav;
	}
	
	@RequestMapping(value = "/updateSeller", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView updateSeller(@ModelAttribute("sellerForm")  SellerForm sellerForm, HttpSession session,  BindingResult result) {
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("redirect:/userAdministration");
    	
    	User user = sellerForm.getUser();
    	Seller seller = sellerForm.getSeller();
    	Address address = sellerForm.getAddress();
    	address.setAddressId(sellerForm.getAddressId());
    	seller.setSellerId(sellerForm.getSellerId());
    	seller.setAddress(address);
    	seller.setUser(userService.update(user));
    	addressService.newAddress(address);
    	sellerService.update(seller);
    	mav.addObject("successMessage","4");
    	return mav;
    }
}
