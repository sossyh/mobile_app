import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../BLoC/tutorial_bloc.dart';
import 'tutorial_description.dart';
import '../Repository/tutorial_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../tutorials.dart';
import 'package:go_router/go_router.dart';

class category extends StatelessWidget {
  final TutorialRepositoy tutorialRepository =
      TutorialRepositoy(TutorialDataProvider());

  @override
  static const routeName = 'category';
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
        value: this.tutorialRepository,
        child: BlocProvider(
            create: (context) =>
                TutorialBloc(tutorialRepository: this.tutorialRepository)
                  ..add(Tutorial_Load()),
            child: Scaffold(
                appBar: AppBar(
                  title: Row(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Color.fromARGB(255, 6, 23, 31),
                            size: 25.0,
                          ),
                          onPressed: () {
                            context.go('/LoginScreen');
                          },
                        ),
                      ),
                      SizedBox(width: 30),
                      Text(
                        "TUTORIAL CATEGORIES",
                        style: TextStyle(
                            color: Color.fromARGB(255, 10, 29, 37),
                            fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
                //   actions: [
                //     IconButton(
                //         onPressed: () {
                //           showSearch(
                //             context: context,
                //             delegate: CustomSearchDelegate(),
                //           );
                //         },
                //         icon: const Icon(Icons.search))
                //   ],
                // ),
                //drawer: Drawer(),
                body: BlocBuilder<TutorialBloc, TutorialState>(
                  builder: (_, state) {
                    if (state is Tutorial_Operation_Failure) {
                      return const Text("The operation is not done");
                    }
                    if (state is Tutorial_Operation_Success) {
                      final tutorials = state.tutorials;
                      return ListView.builder(
                          itemCount: tutorials.length,
                          itemBuilder: (_, index) => GestureDetector(
                                child: ListTile(
                                  title: Text(tutorials.elementAt(index).title),
                                  subtitle:
                                      Text(tutorials.elementAt(index).code),
                                  onTap: () => context.push(
                                      '/$Tutorial_description',
                                      extra: tutorials.elementAt(index)),
                                ),
                              ));
                    }
                    return Text(
                        "This should never be displayed if it is correct");
                  },
                ))));
  }
}
// ListView.builder(
//         itemCount: tutorial_category.length,
//         itemBuilder: (BuildContext context, int index) {
//           final tutorial = tutorial_category[index];
//           return GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (BuildContext context) {
//                       return tutorial_description(tutorial);
//                     },
//                   ),
//                 );
//               },
//               child: Column(
//                 children: [
//                   Card(
//                     elevation: 10,
//                     child: Column(
//                       children: [
//                         Image.asset(
//                           tutorial.image,
//                           height: 150,
//                           width: double.infinity,
//                           fit: BoxFit.cover,
//                         ),