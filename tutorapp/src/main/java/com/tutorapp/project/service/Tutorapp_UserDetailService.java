package com.tutorapp.project.service;



import javax.transaction.Transactional;

import com.tutorapp.project.model.User;
import com.tutorapp.project.model.UserDetail;
import com.tutorapp.project.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;



@Service
public class Tutorapp_UserDetailService implements UserDetailsService {

	@Autowired
	private UserRepository userRepository;
	
	@Override
	@Transactional
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = userRepository.findByUsername(username)
						.orElseThrow(()-> new UsernameNotFoundException(String.format("Username with %s is not found", username)));
		return UserDetail.build(user);
	}

}

