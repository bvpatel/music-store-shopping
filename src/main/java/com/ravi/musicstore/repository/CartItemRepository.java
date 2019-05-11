package com.ravi.musicstore.repository;

import javax.transaction.Transactional;

import com.ravi.musicstore.model.CartItem;
import org.springframework.data.repository.CrudRepository;

@Transactional
public interface CartItemRepository extends CrudRepository<CartItem, Long>{

}
