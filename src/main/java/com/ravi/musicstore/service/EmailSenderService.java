package com.ravi.musicstore.service;

import com.ravi.musicstore.model.Customer;

public interface EmailSenderService {

	void sendActiveCode(Customer customer);
	
	void sendResetPasswordCode(Customer customer);
}
