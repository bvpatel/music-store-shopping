package com.ravi.musicstore.repository;

import javax.transaction.Transactional;

import com.ravi.musicstore.model.Customer;
import org.springframework.data.repository.CrudRepository;

@Transactional
public interface CustomerRepository extends CrudRepository<Customer, Long>{
	
	Customer findByEmail(String email);
	
}
