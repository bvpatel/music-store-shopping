package com.ravi.musicstore.repository;

import java.util.List;

import com.ravi.musicstore.model.Code;
import com.ravi.musicstore.model.Customer;
import org.springframework.data.repository.CrudRepository;

public interface CodeRepository extends CrudRepository<Code, Long>{
	
	List<Code> findByCodeTypeAndCustomer(int codeType, Customer customer);
	
	Code findByCodeStr(String codeStr);
}
