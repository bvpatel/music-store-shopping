package com.ravi.musicstore.service;

import java.util.List;

import com.ravi.musicstore.model.Code;
import com.ravi.musicstore.model.Customer;

public interface CodeService {
	
	List<Code> findByCodeTypeAndCustomer(int codeType, Customer customer);
	
	void save(Code code);
	
	Code findByCodeStr(String codeStr);
	
	void delete(Code code);
}
