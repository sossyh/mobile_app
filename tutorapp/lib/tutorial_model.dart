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
  tutorials("assets/backend.jpg", "BACKEND DEVELOPEMENT", ""),
  tutorials("assets/frontend.jpg", "FRONTEND DEVELOPEMENT", ""),
  tutorials("assets/mobile.jpg", "MOBILE APP DEVELOPEMENT", ""),
  tutorials("assets/astronomy.jpg", "ASTRONOMY", ""),
];
