package com.ravi.musicstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ravi.musicstore.repository.CustomerRepository;

@Controller
@RequestMapping("/customer/cart")
public class CartController {

    @Autowired
    private CustomerRepository customerRepository;
    /*
    @RequestMapping
    public Cart getCart(@AuthenticationPrincipal User activeUser){
        Customer customer = customerRepository.findByEmail(activeUser.getUsername());
        

		return customer.getCart();
    }*/
    @RequestMapping
    public String cartPage(){
    	return "cart";
    }
}
