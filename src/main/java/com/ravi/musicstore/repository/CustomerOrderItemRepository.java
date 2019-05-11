package com.ravi.musicstore.repository;

import com.ravi.musicstore.model.CustomerOrderItem;
import org.springframework.data.repository.CrudRepository;

public interface CustomerOrderItemRepository extends CrudRepository <CustomerOrderItem, Long>{

}
