package com.tutorapp.project.controller;

import java.util.Optional;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
// import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
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
// @CrossOrigin(origins="*")
public class tutorialController{
    
    private final tutorialRepository tutRepo;
    @GetMapping(params="new")
    public Iterable<tutorials>newTutorials(){
        PageRequest page=PageRequest.of(0, 8,Sort.by ( "addedAt").descending());
        return tutRepo.findAll(page).getContent();
        
    }
    @GetMapping("/{title}")
    public ResponseEntity<tutorials>TutorialByTitle(@PathVariable("title")String title){
        Optional<tutorials> tutorial=tutRepo.findByTitle(title);
        if (tutorial.isPresent()){
            return new ResponseEntity<>(tutorial.get(),HttpStatus.OK);
        }
        return new ResponseEntity<>(null,HttpStatus.NOT_FOUND);
    }
    @PostMapping(consumes="application/json")
    @ResponseStatus(HttpStatus.CREATED)
    public tutorials postTutorial(@RequestBody tutorials tutorial) {
       
        
        return tutRepo.save(tutorial);
    }
    
    
}