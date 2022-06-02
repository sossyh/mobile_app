package com.tutorapp.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tutorapp.project.model.Comments;

@Repository
public  interface CommentRepository extends JpaRepository<Comments,Long> {
    
}
