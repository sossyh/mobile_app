import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:tutorapp/authentication/authentication.dart';
import 'package:tutorapp/tutorials/tutorials.dart';
import 'package:tutorapp/comment/comment.dart';
import 'package:tutorapp/registration/registration.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (BuildContext context) => AuthBloc()),
        BlocProvider<RegistrationBloc>(
            create: (BuildContext context) => RegistrationBloc()),
        //BlocProvider<CommentBloc>(create: (BuildContext context) => CommentBloc()),
        //BlocProvider<TutorBloc>(create: (BuildContext context) => TutorBloc()),
      ],
      child: TutorApp(),
    ),
  );
}

class TutorApp extends StatelessWidget {
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      routes: <GoRoute>[
        GoRoute(
          path: '/LoginScreen',
          builder: (BuildContext context, GoRouterState state) => LoginScreen(),
        ),
        GoRoute(
          path: '/Registration_form',
          builder: (BuildContext context, GoRouterState state) =>
              Registration_form(),
        ),
      ],
    );

    // return BlocProvider(
    //   create: (_) => RegistrationBloc(),
    //   child: MaterialApp.router(
    //     routeInformationParser: _router.routeInformationParser,
    //     routerDelegate: _router.routerDelegate,
    //     title: 'Tutor App',
    //   ),
    // );
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'Tutor App',
    );
  }
}
