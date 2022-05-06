import 'package:flutter/material.dart';
import 'categories.dart';

void main() {
  runApp(TutorApp());
}

class TutorApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: category(),
    );
  }
}
