package com.tutorapp.project.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
// import javax.persistence.OneToOne;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity

public class Comments {
@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
<<<<<<< HEAD
    private Long id; 
    //this id is for database persistance 
    @JoinColumn( name="ID",referencedColumnName="ID",updatable=false,insertable=false)
=======
    private Long id; //this id is for database persistance 
>>>>>>> c0375d8fe96116d9d33288139679cc4b8116eb6b
    private int Id; //the id from ui

    private String Text;
    @ManyToOne
    private User user;
    Comments(String text,User user){
        this.Text=text;
        this.user=user;
    }
}
