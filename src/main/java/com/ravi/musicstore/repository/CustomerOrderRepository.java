package com.ravi.musicstore.repository;

import java.util.List;

import com.ravi.musicstore.model.Customer;
import com.ravi.musicstore.model.CustomerOrder;
import org.springframework.data.repository.CrudRepository;

public interface CustomerOrderRepository extends CrudRepository<CustomerOrder, Long>{

	List<CustomerOrder> findAllByCustomer(Customer customer);
}
