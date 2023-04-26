package com.boutiqa.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.boutiqa.entity.Product;
import com.boutiqa.entity.ProductImage;
import com.boutiqa.entity.User;
import com.boutiqa.service.ProductImageService;
import com.boutiqa.service.ProductService;
import com.boutiqa.service.UserService;

@Controller
public class ProductController {
    @Autowired
    private ProductService productService;
    
    @Autowired
    private UserService userService;
    
    @Autowired
    ProductImageService productImageService;
    
    @RequestMapping("/productList")
    public ModelAndView getAllProducts(){
        List<Product> products = productService.findAllWithImages();
        return new ModelAndView("product-list", "products", products);
    }
    
    @RequestMapping(value="/showSellerProducts", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView showSellerProducts(HttpSession session) {
    	ModelAndView mav = new ModelAndView();
    	if(session.getAttribute("user") == null) {
    		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext()
    			    .getAuthentication().getPrincipal();
    		Optional <User> user = userService.findByUsername(userDetails.getUsername());
    		List<Product> products = productService.findBySeller(user.get().getSeller());
    		mav.addObject("products" ,products);
    	}else {
    		User user = (User) session.getAttribute("user");
    		List<Product> products = productService.findBySeller(user.getSeller());
    		mav.addObject("products" ,products);
    	}
    	mav.setViewName("seller-products");
    	return mav;
    }
    
    @RequestMapping(value="/searchProduct")
    public ModelAndView searchProduct(@RequestParam String keyword) {
    	List<Product> result = productService.search(keyword);
    	ModelAndView mav = new ModelAndView("product-search");
    	mav.addObject("searchProduct", result);
    	return mav;
    }
    
    @RequestMapping(value="/addProductForm", method = RequestMethod.GET)
    public ModelAndView addProductForm(HttpSession session) {
    	ModelAndView mav = new ModelAndView("add-product");
    	mav.addObject("product", new Product());
    	return mav;
    }
    
    @RequestMapping(value="/addProduct", method = RequestMethod.POST)
    public ModelAndView addProduct(@ModelAttribute("product")Product product, HttpSession session) {
    	ModelAndView mav = new ModelAndView();
    	UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext()
			    .getAuthentication().getPrincipal();
		Optional <User> user = userService.findByUsername(userDetails.getUsername());
    	product.setSeller(user.get().getSeller());
    	Product newProduct = productService.saveProduct(product);
    	ProductImage productImage = new ProductImage();
    	productImage.setProduct(newProduct);
    	productImageService.save(productImage);
    	mav.setViewName("redirect:/showSellerProducts");
    	return mav;
    }
}
