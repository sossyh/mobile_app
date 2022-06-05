import 'dart:convert';
import 'package:flutter/material.dart';


List<tutorials> postFromJson(String str) => List<tutorials>.from(json.decode(str).map((x) => tutorials.fromJson(x)));

String tutorialToJson(List<tutorials> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));



class tutorials {
  String code;
  String image;
  String title;
  String description;
  
  tutorials({
     required this.code,
    required this.image,
     required this.title,
   required  this.description,
});
  
  factory tutorials.fromJson(Map<String, dynamic> json) {
    return tutorials(
        code:json["code"],
        title: json["title"],
        description:json["description"],
        image:json["image"]
      );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "image": image,
        "title": title,
        "description":description ,
      };


}

final tutorial_category = [
  tutorials(image:"assets/backend.jpg", title:"BACKEND DEVELOPEMENT",
      description:"This tutorial contains Backend devalopement which enables you to creates components and features on the server-side, indirectly accessed by a user through a front end application or system. These developers are tasked with creating, maintaining, testing, and debugging the entire back end.",code:"Back"),
  tutorials(image:"assets/frontend.jpg", title:"FRONTEND DEVELOPEMENT",
      description:"This tutorial contains Frontend developement which makes you as a developer use HTML, CSS, and JavaScript to build the client side of a website. They are responsible for building the visual elements on a page, such as the layout, buttons, menus, forms, and other features that users will see and interact with when they visit a webpage.",code:"FRONt"),
  tutorials(image:"assets/mobile.jpg", title:"MOBILE APP DEVELOPEMENT",
      description:"This tutorial is about Mobile application developement which contains the set of processes and procedures involved in writing software for small, wireless computing devices, such as smartphones and other hand-held devices",code:"MBAP"),
  tutorials(image:"assets/astronomy.jpg",title: "ASTRONOMY",
      description:"Astronomy is the study of everything in the universe beyond Earth's atmosphere. That includes objects we can see with our naked eyes, like the Sun , the Moon , the planets, and the stars . It also includes objects we can only see with telescopes or other instruments, like faraway galaxies and tiny particles. you will learn more about it in this tutorial",code:"ASTR"),
];
