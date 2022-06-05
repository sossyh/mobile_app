import 'package:flutter/material.dart';
import 'package:tutorapp/tutorials/screen/categories.dart';
import '../Model/tutorial_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Tutorial_description extends StatelessWidget {
  final String extra;
  late Tutorial tutorial;
  static const routeName = 'Tutorial_description';
  Tutorial_description({Key? key, required this.tutorial, required this.extra})
      : super(key: key);
  

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(tutorial.title),

          
        ),
        body: Card(
            elevation: 10,
            child: Column(
              children: [
                ListTile(
                  title: Text('Title:${tutorial.title}'),
                  subtitle: Text('Code:${tutorial.code}'),
                ),
                Text(
                  "Tutorials Description",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(tutorial.description ?? ""),
                ElevatedButton(child: (Text("Enroll")), onPressed: () {})
              ],
            )));
  }
}


