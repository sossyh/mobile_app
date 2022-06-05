package com.tutorapp.project.controller;

import java.util.Optional;

import org.springframework.dao.EmptyResultDataAccessException;
// import org.springframework.data.domain.PageRequest;
// import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
// import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.tutorapp.project.model.tutorials;
import com.tutorapp.project.repository.tutorialRepository;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestBody;

@RequiredArgsConstructor
@RestController
@RequestMapping(path="/api/v1/tutorials",produces="application/json")
@CrossOrigin(origins="*")
public class tutorialController{
    
    private final tutorialRepository tutRepo;
    @GetMapping()
    public ResponseEntity<Iterable<tutorials>> fetchAll(){
        
        Iterable<tutorials> allTutorials=tutRepo.findAll();
        return ResponseEntity.status(HttpStatus.OK).body(allTutorials);
        
    }
    @GetMapping("/{code}")
    
    public ResponseEntity<tutorials> findtutorialByCode(@PathVariable("code")String code){
        Optional<tutorials> tutorial=tutRepo.findTutorialByCode(code);
        if (tutorial.isPresent()){
            return new ResponseEntity<>(tutorial.get(),HttpStatus.OK);
        }
        return new ResponseEntity<>(null,HttpStatus.NOT_FOUND);
    }
    @PostMapping(consumes="application/json")
    @ResponseStatus(HttpStatus.CREATED)
    public ResponseEntity<tutorials> createTutorial(@RequestBody tutorials tutorial) {
       
        
        return ResponseEntity.status(HttpStatus.CREATED).body(tutRepo.save(tutorial));
    }
    @PatchMapping(path="/{id}",consumes="application/json")
    @ResponseStatus(HttpStatus.OK)
    public ResponseEntity<tutorials>  updateTutorialbyID(@PathVariable("id") int id,tutorials NewTutorial){
        
        tutorials tutorial=tutRepo.findTutorialByid(id);
                tutorial.setCode(NewTutorial.getCode());
                tutorial.setTitle(NewTutorial.getTitle());
                tutorial.setDescription(NewTutorial.getDescription());
                tutRepo.save(tutorial);
                return ResponseEntity.status(HttpStatus.OK).body(tutorial);}
                       
    @DeleteMapping(path="/{id}",consumes="application/json")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public ResponseEntity<?> deleteTutorial(@PathVariable("id") int id){
    try{
        tutRepo.deleteTutorialbyId(id);
    return ResponseEntity.status(HttpStatus.OK).body(null);}
        catch(EmptyResultDataAccessException e){

            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }
        
    }    
}