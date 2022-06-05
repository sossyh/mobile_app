package com.tutorapp.project.repository;

import java.util.List;
import java.util.Optional;

import com.tutorapp.project.model.User;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

// import net.bytebuddy.dynamic.DynamicType.Builder.MethodDefinition.ImplementationDefinition.Optional;

@Repository
public interface UserRepository extends JpaRepository<User,Long>{
    Optional<User> findByUsername(String username);
	
	
	Boolean existsByUsername(String username);

	Boolean existsByEmail(String email);
	List<User>findAll();

@Query(value="DELETE * FROM users WHERE Id=id",nativeQuery=true)
    void deleteUserbyId(int id);
} 

    

