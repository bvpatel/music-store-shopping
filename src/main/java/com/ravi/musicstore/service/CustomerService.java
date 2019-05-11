package com.ravi.musicstore.service;

import java.util.List;

import com.ravi.musicstore.model.Customer;

public interface CustomerService {
	
	Customer findOne(Long customerId);
	
	void save(Customer customer);
	
	void activeAccount(String codeStr);
	
	Customer findByEmail(String email);
	
	boolean hasRole(String role, Customer customer);
	
	List<Customer> getAllCustomer();
	
	void delete(Long customerId);
}
