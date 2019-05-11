package com.ravi.musicstore.repository;

import com.ravi.musicstore.model.CustomerOrderShippingAddress;
import org.springframework.data.repository.CrudRepository;

public interface CustomerOrderShippingAddressRepository 
					extends CrudRepository <CustomerOrderShippingAddress, Long> {

}
