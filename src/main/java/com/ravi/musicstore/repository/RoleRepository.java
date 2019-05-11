package com.ravi.musicstore.repository;

import com.ravi.musicstore.model.Customer;
import com.ravi.musicstore.model.Role;
import org.springframework.data.repository.CrudRepository;

public interface RoleRepository extends CrudRepository<Role, Long>{
	Role findByAuthorityAndCustomer(String auth, Customer customer);
}
