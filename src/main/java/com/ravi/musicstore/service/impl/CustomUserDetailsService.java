package com.ravi.musicstore.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.ravi.musicstore.model.Customer;
import com.ravi.musicstore.model.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ravi.musicstore.repository.CustomerRepository;

@Service("customUserDetailsService")
public class CustomUserDetailsService implements UserDetailsService{

	@Autowired
    private CustomerRepository customerRepository;
     
    @Transactional(readOnly=true)
    public UserDetails loadUserByUsername(String email)
            throws UsernameNotFoundException {
        Customer customer = customerRepository.findByEmail(email);
        if(customer == null){
            throw new UsernameNotFoundException("Username not found"); 
        }
            return new org.springframework.security.core.userdetails.User(customer.getEmail(), customer.getPassword(), 
            		customer.isEnabled(), true, true, true, getGrantedAuthorities(customer));
    }
 
     
    private List<GrantedAuthority> getGrantedAuthorities(Customer customer){
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        for(Role role : customer.getRoles()){
            authorities.add(new SimpleGrantedAuthority(role.getAuthority()));
        }
        return authorities;
    }
}
