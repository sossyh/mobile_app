package com.tutorapp.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.tutorapp.project.model.Comments;

@Repository
public  interface CommentRepository extends JpaRepository<Comments,Long> {
   @Query(value="DELETE * FROM comments WHERE Id=id",nativeQuery=true)
    void deleteById(@Param("id")int id);
    @Query(value="SELECT * FROM comments WHERE Id=id",nativeQuery=true)
    Comments findById(@Param("id")int id);
    
}
