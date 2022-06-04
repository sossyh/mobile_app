import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:tutorapp/authentication/authentication.dart';
import 'package:tutorapp/tutorials/tutorials.dart';
import 'package:tutorapp/comment/comment.dart';
import 'package:tutorapp/registration/registration.dart';
import 'package:go_router/go_router.dart';

void main() {
  //final TutorialDataProvider tutorialDataProvider;
  Tutorial tutorial;
  TutorialRepositoy? tutorialRepository;
  tutorialRepository?.create(Tutorial(id: 1, code: "123", title: "mobileapp"));

  runApp(TutorApp()
      // MultiBlocProvider(
      //   providers: [
      //     BlocProvider<AuthBloc>(create: (BuildContext context) => AuthBloc()),
      //     BlocProvider<RegistrationBloc>(
      //         create: (BuildContext context) => RegistrationBloc()),
      //     //BlocProvider<CommentBloc>(create: (BuildContext context) => CommentBloc()),
      //     // BlocProvider<TutorialBloc>(
      //     //   create: (BuildContext context) =>
      //     //       TutorialBloc(tutorialRepository: tutorialRepository),
      //     // )
      //   ],
      //   child: TutorApp(),
      // ),
      );
}

class TutorApp extends StatelessWidget {
  late final TutorialRepositoy tutorialRepositoy;
  late final Tutorial tutorial;

  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      initialLocation: '/LoginScreen',
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
        GoRoute(
          path: '/category',
          builder: (BuildContext context, GoRouterState state) => category(),
        ),
        GoRoute(
            path: '/Tutorial_description',
            pageBuilder: (BuildContext context, GoRouterState state) =>
                MaterialPage(
                  key: state.pageKey,
                  child: Tutorial_description(
                      tutorial: tutorial, extra: state.extra as String),
                )
            //Tutorial_description(tutorial: tutorial),
            ),
      ],
    );

    return BlocProvider(
      create: (_) => AuthBloc(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        title: 'Tutor App',
      ),
    );
//     return MaterialApp.router(
//       debugShowCheckedModeBanner: false,
//       routeInformationParser: _router.routeInformationParser,
//       routerDelegate: _router.routerDelegate,
//       title: 'Tutor App',
//     );
  }
}
