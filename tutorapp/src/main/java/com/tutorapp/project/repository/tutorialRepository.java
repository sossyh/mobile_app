package com.tutorapp.project.repository;

import java.util.List;
import java.util.Optional;

import com.tutorapp.project.model.tutorials;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public  interface tutorialRepository extends JpaRepository<tutorials,Long> {
    Optional<tutorials> findTutorialByid(Long id);
@Query(value="SELECT * FROM tutorials WHERE title LIKE %:title%",nativeQuery=true)
List<tutorials> findAllTitle(@Param("title")String title);
@Query(value="SELECT * FROM tutorials WHERE ^title$ ",nativeQuery = true)
 Optional<tutorials>findByTitle(@Param("title")String title);
 @Query(value="SELECT * FROM tutorials WHERE ^code$",nativeQuery=true)
 Optional<tutorials> findTutorialByCode(@Param("code")String code);
 
@Query(value="DELETE FROM tutorials WHERE ^code$ ",nativeQuery=true)
 void deleteTutorialbyCode(@Param("code")String code);
 @Query(value="SELECT  * FROM tutorials WHERE ID=id",nativeQuery=true)
tutorials findTutorialByid(@Param("id")int id);
@Query(value="DELETE * FROM tutorials WHERE ID=id",nativeQuery=true)
void deleteTutorialbyId(@Param("id")int id);   
}
