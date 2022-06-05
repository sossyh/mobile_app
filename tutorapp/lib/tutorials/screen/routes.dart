import 'package:flutter/material.dart';
import 'package:tutorapp/authentication/authentication.dart';
import 'package:tutorapp/tutorials/screen/Admin.dart';

import '../tutorials.dart';


class TutorAppRoute {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) => LoginScreen());
    }

    if (settings.name == AddUpdateTutorial.routeName) {
      TutorialArgument args = settings.arguments as TutorialArgument;
      return MaterialPageRoute(
        builder: (context) => AddUpdateTutorial(
          args: args,
        ),
      );
    }


    return MaterialPageRoute(builder: (context) => category());
  }
}

class TutorialArgument {
  final Tutorial? tutorial;
  final bool edit;
  TutorialArgument({this.tutorial, required this.edit});
}
