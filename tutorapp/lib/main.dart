import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:tutorapp/authentication/authentication.dart';
import 'package:tutorapp/tutorials/tutorials.dart';
import 'package:tutorapp/comment/comment.dart';
import 'package:tutorapp/registration/registration.dart';

void main() {
  runApp(TutorApp());
}

class TutorApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
