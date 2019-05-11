package com.ravi.musicstore.service;

import java.io.IOException;
import java.util.List;

import com.ravi.musicstore.model.Cart;
import com.ravi.musicstore.model.Customer;
import com.ravi.musicstore.model.CustomerOrder;
import com.ravi.musicstore.model.CustomerOrderShippingAddress;

public interface CustomerOrderService {
	
	double getCustomerOrderGrandTotalByCart(Cart cart);
	
	void addOrderDumpCart(CustomerOrderShippingAddress customerOrderShippingAddress, CustomerOrder customerOrder, Cart cart) throws IOException;
	
	List<CustomerOrder> getAllCustomerOrderByCustomer(Customer customer);
}
