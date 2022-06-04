import 'package:flutter/material.dart';
import 'package:tutorapp/authentication/authentication.dart';
import 'package:tutorapp/tutorials/screen/tutorials_add_update.dart';
import '../tutorials.dart';

//import 'course_add_update.dart';

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

    // if (settings.name == Tutorial_description.routeName) {
    //   Tutorial tutorial = settings.arguments as Tutorial;
    //   return MaterialPageRoute(
    //     builder: (context) => Tutorial_description(
    //       tutorial: tutorial,
    //       extra:state.extra as String
    //     ),
    //   );
    // }

    return MaterialPageRoute(builder: (context) => category());
  }
}

class TutorialArgument {
  final Tutorial? tutorial;
  final bool edit;
  TutorialArgument({this.tutorial, required this.edit});
}
