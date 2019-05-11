package com.ravi.musicstore.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import com.ravi.musicstore.model.Customer;
import com.ravi.musicstore.model.ShippingAddress;
import com.ravi.musicstore.service.CustomerAddressService;
import com.ravi.musicstore.service.CustomerService;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ravi.musicstore.repository.ShippingAddressRepository;

@Service
public class CustomerAddressServiceImpl implements CustomerAddressService {
	
	@Autowired
	private ShippingAddressRepository shippingAddressRepository;
	@Autowired
	private CustomerService customerService;
	
	public List<ShippingAddress> getAllShippingAddressByCustomerId(Object customerId) {
		Customer customer = customerService.findOne((Long) customerId);
		return shippingAddressRepository.findAllByCustomer(customer);
	}
	
	@Transactional
	public void addShippingAddressObject(Object customerId, ShippingAddress shippingAddress){
		Customer customer = customerService.findOne((Long)customerId);
		// if there is no default shipping address, then set it up
		shippingAddress.setIsDefault(true);
		Hibernate.initialize(customer.getShippingAddresses());
		for(ShippingAddress shippingAddress_ : customer.getShippingAddresses()){
			if(shippingAddress_.getIsDefault()){
				shippingAddress.setIsDefault(false);
				break;
			}
		}
		shippingAddress.setCustomer(customer); 
		shippingAddressRepository.save(shippingAddress);
	}
}
