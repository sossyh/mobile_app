import 'package:flutter/material.dart';

// class tutorials {
//   String image;
//   String title;
//   String description;
//   tutorials(
//     this.image,
//     this.title,
//     this.description,
//   );
// }

final list_of_images = [
  "assets/backend.jpg",
  "assets/frontend.jpg",
  "assets/mobile.jpg",
  "assets/astronomy.jpg",
];

class Tutorial {
  final int? id;
  final String code;
  final String title;
  //final String? image;
  final String? description;

  Tutorial({
    required this.id,
    required this.code,
    required this.title,
    this.description,
    //this.image
  });

  factory Tutorial.fromJson(Map<String, dynamic> json) {
    return Tutorial(
        id: json['id'],
        code: json['code'],
        title: json['title'],
        description: json['description']);
  }
}
