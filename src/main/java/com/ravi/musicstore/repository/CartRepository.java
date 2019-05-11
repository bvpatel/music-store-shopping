package com.ravi.musicstore.repository;

import javax.transaction.Transactional;

import com.ravi.musicstore.model.Cart;
import org.springframework.data.repository.CrudRepository;

@Transactional
public interface CartRepository extends CrudRepository<Cart, Long>{
	
}
