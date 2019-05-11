package com.ravi.musicstore.service.impl;

import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.List;

import com.ravi.musicstore.service.CodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ravi.musicstore.model.Code;
import com.ravi.musicstore.model.Customer;
import com.ravi.musicstore.repository.CodeRepository;

@Service
public class CodeServiceImpl implements CodeService {

	@Autowired
	private CodeRepository codeRepository;
	
	public void save(Code code){
		SecureRandom random = new SecureRandom();
    	String codeStr = new BigInteger(130, random).toString(32);
    	code.setCodeStr(codeStr);
		codeRepository.save(code);
	}
	
	public Code findByCodeStr(String codeStr){
		return codeRepository.findByCodeStr(codeStr);
	}
	
	public void delete(Code code){
		codeRepository.delete(code);
	}
	
	public List<Code> findByCodeTypeAndCustomer(int codeType, Customer customer){
		return codeRepository.findByCodeTypeAndCustomer(codeType, customer);
	}
}
