package com.tutorapp.project.model;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class tutorials {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
    private int ID;
    private Date addedAt;
    private String code;
    private String title;
    private String description;
    @ManyToOne
    private User tutor;
    public void setTitle(String newTitle){
        this.title=newTitle;
    }
   
    @PrePersist
    void addedAt(){
        this.addedAt=new Date();
    }
   
    
}
