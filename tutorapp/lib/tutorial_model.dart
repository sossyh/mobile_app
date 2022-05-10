import 'package:flutter/material.dart';

class tutorials {
  String image;
  String title;
  String description;
  tutorials(
    this.image,
    this.title,
    this.description,
  );
}

final tutorial_category = [
  tutorials("assets/backend.jpg", "BACKEND DEVELOPEMENT",
      "This tutorial contains Backend devalopement which enables you to creates components and features on the server-side, indirectly accessed by a user through a front end application or system. These developers are tasked with creating, maintaining, testing, and debugging the entire back end."),
  tutorials("assets/frontend.jpg", "FRONTEND DEVELOPEMENT",
      "This tutorial contains Frontend developement which makes you as a developer use HTML, CSS, and JavaScript to build the client side of a website. They are responsible for building the visual elements on a page, such as the layout, buttons, menus, forms, and other features that users will see and interact with when they visit a webpage."),
  tutorials("assets/mobile.jpg", "MOBILE APP DEVELOPEMENT",
      "This tutorial is about Mobile application developement which contains the set of processes and procedures involved in writing software for small, wireless computing devices, such as smartphones and other hand-held devices"),
  tutorials("assets/astronomy.jpg", "ASTRONOMY",
      "Astronomy is the study of everything in the universe beyond Earth's atmosphere. That includes objects we can see with our naked eyes, like the Sun , the Moon , the planets, and the stars . It also includes objects we can only see with telescopes or other instruments, like faraway galaxies and tiny particles. you will learn more about it in this tutorial"),
];
