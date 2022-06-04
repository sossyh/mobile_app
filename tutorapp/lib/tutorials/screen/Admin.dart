import 'package:flutter/material.dart';
import 'package:tutorapp/tutorials/screen/categories.dart';
import '../Model/tutorial_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// class Tutorial_description extends StatelessWidget {
//   late Tutorial tutorial;
//   Tutorial_description({Key? key, required this.tutorial}) : super(key: key);
//   //bool _isenrolled = false;

//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(tutorial.title),

//           actions: [
//               IconButton(
//                 icon: const Icon(Icons.edit),
//                 onPressed: () => Navigator.of(context).pushNamed(
//                   AddUpdateCourse.routeName,
//                   arguments: CourseArgument(course: course, edit: true),
//                 ),
//               ),
//               const SizedBox(
//                 width: 32,
//               ),
//               IconButton(
//                   icon: const Icon(Icons.delete),
//                   onPressed: () {
//                     BlocProvider.of<TutorialBloc>(context)
//                         .add(Tutorial_Delete(course.id ?? 0));
//                     Navigator.of(context).pushNamedAndRemoveUntil(
//                         CoursesList.routeName, (route) => false);
//                   }),
//             ],
//         ),
//         body: Card(
//             elevation: 10,
//             child: Column(
//               children: [
//                 ListTile(
//                   title: Text('Title:${tutorial.title}'),
//                   subtitle: Text('Code:${tutorial.code}'),
//                 ),
//                 Text(
//                   "Tutorials Description",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Text(tutorial.description ?? ""),
//               ],
//             )));
//   }
// }
