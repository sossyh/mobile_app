package com.tutorapp.project.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
    private Long id;

    private String Text;
    @ManyToOne
    private User user;
    Comments(String text,User user){
        this.Text=text;
        this.user=user;
    }
}
