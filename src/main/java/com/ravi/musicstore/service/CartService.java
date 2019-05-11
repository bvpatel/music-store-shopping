package com.ravi.musicstore.service;

import java.io.IOException;

import com.ravi.musicstore.model.Cart;

public interface CartService {
	
	Cart validate(Object customerId) throws IOException;
	
	void emptyCart(Cart cart);
	
	void save(Cart cart);
}
