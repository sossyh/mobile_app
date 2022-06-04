package com.tutorapp.project.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tutorapp.project.model.ERole;
import com.tutorapp.project.model.LoginRequest;
import com.tutorapp.project.model.SignUpRequest;
import com.tutorapp.project.model.Role;
import com.tutorapp.project.model.User;
import com.tutorapp.project.model.UserDetail;


import com.tutorapp.project.repository.RoleRepository;
import com.tutorapp.project.repository.UserRepository;
import com.tutorapp.project.utils.JwtUtils;



import com.tutorapp.project.utils.JwtResponse;

@CrossOrigin(value = "*")
@RestController
@RequestMapping("/api/v1/auth")

public class AuthController {
	
	@Autowired
	AuthenticationManager authenticationManager;
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	RoleRepository roleRepository;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	JwtUtils jwtUtils;
	
	@PostMapping("/signin")
	public ResponseEntity<?> signIn(@RequestBody LoginRequest loginRequest) {
		Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(loginRequest.getUserName(),loginRequest.getPassword()));
		
		SecurityContextHolder.getContext().setAuthentication(authentication);
		String jwt = jwtUtils.generateJwtToken(authentication);
		
		UserDetail userDetail = (UserDetail) authentication.getPrincipal();
		List<String> roles = userDetail.getAuthorities().stream()
						.map(item -> item.getAuthority())
						.collect(Collectors.toList());
		
		return ResponseEntity.ok(new JwtResponse(jwt, 
				 userDetail.getId(), 
				 userDetail.getUsername(), 
				 userDetail.getEmail(), 
				 roles));
	}
	
	@PostMapping("/signup")
	public ResponseEntity<?> signUp(@RequestBody SignUpRequest signUpRequest) {
		if (userRepository.existsByUsername(signUpRequest.getUserName())) {
			return ResponseEntity
					.badRequest()
					.body("Error: Username is already taken!");
		}
		
		if (userRepository.existsByUsername(signUpRequest.getEmail())) {
			return ResponseEntity
					.badRequest()
					.body("Error: email is already use!");
		}
		
		// Create new user's account
		User user = new User(
				signUpRequest.getUserName(),
				signUpRequest.getEmail(),
				signUpRequest.getPassword()
		);
		
		Set<String> strRoles = signUpRequest.getRole();
		Set<Role> roles = new HashSet<>();
		
			strRoles.forEach(role -> {
				switch (role) {
				case "admin":
					Role adminRole = roleRepository.findByName(ERole.ROLE_ADMIN)
							.orElseThrow(() -> new RuntimeException("Error: Role is not found."));
					roles.add(adminRole);

					break;
                case "Tutor":
                    Role TutorRole=roleRepository.findByName(ERole.ROLE_TUTOR)
                             .orElseThrow(()-> new RuntimeException("Error:Role was not found"));
                            roles.add(TutorRole);
				
				default:
					Role tuteeRole = roleRepository.findByName(ERole.ROLE_TUTEE)
							.orElseThrow(() -> new RuntimeException("Error: Role is not found."));
					roles.add(tuteeRole);
				}
			});	
		
		String encodedPassword = passwordEncoder.encode(signUpRequest.getPassword());
		user.setPassword(encodedPassword);
		user.setRoles(roles);
		userRepository.save(user);
		
		return ResponseEntity.ok(("User registered successfully!"));
		
	}
	

}
