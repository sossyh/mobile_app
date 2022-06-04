package com.tutorapp.project.controller;

import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
// import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.tutorapp.project.model.Comments;

import com.tutorapp.project.repository.CommentRepository;


import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@RestController
@RequestMapping(path="api/v1/comment",produces="application/json")
public class CommentRestController {
    private final CommentRepository commentRepo;
@PostMapping(consumes="appilcation/json")
@ResponseStatus(HttpStatus.CREATED)
public Comments putComment(@RequestBody Comments comment){
        
        return commentRepo.save(comment);
    }
    @DeleteMapping(path="/id",consumes="application/json")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteComment(@PathVariable("id")int id,@RequestBody Comments comment){
        try{
            commentRepo.deleteById(id);

        }catch(EmptyResultDataAccessException w){
            
        }
           }
    @PatchMapping(path="/id",consumes="application/json")
    @ResponseStatus(HttpStatus.OK)
    public Comments patchComment(@PathVariable("/id")int id,@RequestBody Comments newComment){
        Comments comment=commentRepo.findById(id);
        if(newComment.getText()!= null){
            comment.setText(newComment.getText());}
            return commentRepo.save(comment);
        }
        @GetMapping()
        @ResponseStatus(HttpStatus.OK)
        public List<Comments>getComments(){
            List<Comments> comments=commentRepo.findAll();
            return comments;
            
        }
        @GetMapping(path="/id")
        @ResponseStatus(HttpStatus.OK)
        public Comments getComment(@PathVariable ("id")int Id){
            Comments comment=commentRepo.findById(Id);
            return comment;

        }
    }




    

