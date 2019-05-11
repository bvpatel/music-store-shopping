package com.ravi.musicstore.service.impl;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import com.ravi.musicstore.repository.CustomerOrderItemRepository;
import com.ravi.musicstore.repository.CustomerOrderShippingAddressRepository;
import com.ravi.musicstore.service.CartService;
import com.ravi.musicstore.service.CustomerOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ravi.musicstore.model.Cart;
import com.ravi.musicstore.model.CartItem;
import com.ravi.musicstore.model.Customer;
import com.ravi.musicstore.model.CustomerOrder;
import com.ravi.musicstore.model.CustomerOrderItem;
import com.ravi.musicstore.model.CustomerOrderShippingAddress;
import com.ravi.musicstore.model.ShippingAddress;
import com.ravi.musicstore.repository.CartItemRepository;
import com.ravi.musicstore.repository.CustomerOrderRepository;
import com.ravi.musicstore.repository.ShippingAddressRepository;

@Service
public class CustomerOrderServiceImpl implements CustomerOrderService {
	
	@Autowired
    private CartService cartService;
    @Autowired
    private CustomerOrderRepository customerOrderRepository;
    @Autowired
    private CustomerOrderShippingAddressRepository customerOrderShippingAddressRepository;
    @Autowired
    private ShippingAddressRepository shippingAddressRepository;
    @Autowired
    private CustomerOrderItemRepository customerOrderItemRepository;
    @Autowired
    private CartItemRepository cartItemRepository;
	
	public double getCustomerOrderGrandTotalByCart(Cart cart) {
        double grandTotal = 0;
        List<CartItem> cartItems = cart.getCartItems();

        for (CartItem item : cartItems) {
            grandTotal += item.getTotalPriceDouble();
        }

        return grandTotal;
    }
	
	public void addOrderDumpCart(CustomerOrderShippingAddress customerOrderShippingAddress,
                                 CustomerOrder customerOrder, Cart cart) throws IOException{
		
		if(customerOrderShippingAddress == null || customerOrder == null || cart == null){
			throw new IOException();
		}
		// initiate customerOrderShippingAddress
		ShippingAddress shippingAddress = shippingAddressRepository.findOne(customerOrderShippingAddress.getOriginalShippingAddressId());
		customerOrderShippingAddress.setAddress(shippingAddress.getAddress());
		customerOrderShippingAddress.setCity(shippingAddress.getCity());
		customerOrderShippingAddress.setCountry(shippingAddress.getCountry());
		customerOrderShippingAddress.setFullName(shippingAddress.getFullName());
		customerOrderShippingAddress.setPhoneNumber(shippingAddress.getPhoneNumber());
		customerOrderShippingAddress.setState(shippingAddress.getState());
		customerOrderShippingAddress.setZipCode(shippingAddress.getZipCode());
		
		// initiate customer order
		customerOrder.setCustomer(cart.getCustomer());
		customerOrder.setOrderDate(new Date());
		customerOrder.setOrderTotalPrice(cart.getGrandTotal());
		// for mapping orderItem table
		customerOrderRepository.save(customerOrder);
		cart.setGrandTotal(0);
		cartService.save(cart);
		// dump cartItem to orderItem, empty cart
		for(CartItem cartItem : cart.getCartItems()){
			CustomerOrderItem customerOrderItem = new CustomerOrderItem();
			customerOrderItem.setCustomerOrder(customerOrder);
			customerOrderItem.setProductId(cartItem.getProduct().getProductId());
			customerOrderItem.setProductName(cartItem.getProduct().getProductName());
			customerOrderItem.setProductPrice(cartItem.getProduct().getProductPrice());
			customerOrderItem.setProductQuantity(cartItem.getQuantity());
			customerOrderItemRepository.save(customerOrderItem);
			cartItemRepository.delete(cartItem);
		}
		// for mapping customerOrder table
		customerOrderShippingAddressRepository.save(customerOrderShippingAddress);
		
		customerOrder.setCustomerOrderShippingAddress(customerOrderShippingAddress);
		customerOrderRepository.save(customerOrder);
		
		customerOrderShippingAddress.setCustomerOrder(customerOrder);
		customerOrderShippingAddressRepository.save(customerOrderShippingAddress);
	}
	
	public List<CustomerOrder> getAllCustomerOrderByCustomer(Customer customer){
		return customerOrderRepository.findAllByCustomer(customer);
	}
}
