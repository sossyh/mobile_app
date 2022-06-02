package com.tutorapp.project.controller;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.tutorapp.project.model.Comments;

import com.tutorapp.project.repository.CommentRepository;


import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@RestController
@RequestMapping(path="api/v1/Users",produces="application/json")
public class CommentRestController {
    private final CommentRepository commentRepo;
@PutMapping(path="/{commentId}",consumes="appilcation/json")
public Comments putComment(
    @PathVariable("commentId")Long commentId,@RequestBody Comments comment){
        comment.setId(commentId);
        return commentRepo.save(comment);
    }
    @DeleteMapping(path="/{commentId}",consumes="application/json")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public String deleteComment(@PathVariable("commentId")Long commentId,@RequestBody Comments comment){
        try{
            commentRepo.deleteById(commentId);

        }catch(EmptyResultDataAccessException w){
            
        }
        return "unable to delete this comment";    }
    @PatchMapping(path="/{commentId}",consumes="application/json")
    @ResponseStatus(HttpStatus.ACCEPTED)
    public Comments patchComment(@PathVariable("commentId")Long commentId,@RequestBody Comments newComment){
        Comments comment=commentRepo.findById(commentId).get();
        if(newComment.getText()!= null){
            comment.setText(newComment.getText());}
            return commentRepo.save(comment);
        }
    }




    

