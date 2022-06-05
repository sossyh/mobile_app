package com.tutorapp.project.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
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
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.http.HttpStatus;
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
	@GetMapping()
 public List<User> fetchAllUsers(){
	 

	 return userRepository.findAll();
 }

	
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
	
	@PostMapping()
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
@PostMapping()
@ResponseStatus(HttpStatus.OK)
public ResponseEntity<User> createNewUser(@RequestBody User user){
	
		User newUser=new User();
		newUser.setUsername(user.getUsername());
		newUser.setEmail(user.getEmail());
		newUser.setRoles(user.getRoles());
		userRepository.save(newUser);
		return ResponseEntity.status(HttpStatus.OK).body(newUser);}	
@GetMapping("/{username}")
@ResponseStatus(HttpStatus.OK)
public ResponseEntity<User> fetchThisUser(@PathVariable("username" )String username , @RequestBody User user){
Optional <User> the_user=userRepository.findById(user.getId());
return ResponseEntity.status(HttpStatus.OK).body(the_user.get());}
 
 @PatchMapping(path="/{id}",consumes="application/json")
 public ResponseEntity<User> updateUser(@PathVariable("id")int id,@RequestBody User user)
 {

		 User newUser=new User();
		 newUser.setEmail(user.getEmail());
		 newUser.setUsername(user.getUsername());
		 newUser.setId(user.getId());
		 newUser.setRoles(user.getRoles());
		 userRepository.save(newUser);

		 return ResponseEntity.status(HttpStatus.OK).body(newUser);}
@DeleteMapping(path="/{id}",consumes="application/json")
	public ResponseEntity<?>deleteUserbyId(@PathVariable("id")int id){
		userRepository.deleteUserbyId(id);
		return ResponseEntity.status(HttpStatus.NO_CONTENT).body(null);
	}

}


