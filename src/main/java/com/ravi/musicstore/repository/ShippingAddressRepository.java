package com.ravi.musicstore.repository;

import java.util.List;

import com.ravi.musicstore.model.Customer;
import com.ravi.musicstore.model.ShippingAddress;
import org.springframework.data.repository.CrudRepository;

public interface ShippingAddressRepository extends CrudRepository<ShippingAddress, Long>{
	
	List<ShippingAddress> findAllByCustomer(Customer customer);
	
	
}
