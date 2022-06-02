package com.tutorapp.project.repository;

import java.util.Optional;

import com.tutorapp.project.model.ERole;
import com.tutorapp.project.model.Role;

import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role,Long> {
    Optional<Role>findByName(ERole name);
    
}
