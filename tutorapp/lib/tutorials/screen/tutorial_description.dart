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
  //bool _isenrolled = false;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(tutorial.title),

          // actions: [
          //     // IconButton(
          //     //   icon: const Icon(Icons.edit),
          //     //   onPressed: () => Navigator.of(context).pushNamed(
          //     //     AddUpdateCourse.routeName,
          //     //     arguments: CourseArgument(course: course, edit: true),
          //     //   ),
          //     // ),
          //     const SizedBox(
          //       width: 32,
          //     ),
          //     IconButton(
          //         icon: const Icon(Icons.delete),
          //         onPressed: () {
          //           BlocProvider.of<CourseBloc>(context)
          //               .add(CourseDelete(course.id ?? 0));
          //           Navigator.of(context).pushNamedAndRemoveUntil(
          //               CoursesList.routeName, (route) => false);
          //         }),
          //   ],
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


// Column(children: [
//         Image(
//           image: AssetImage(widget.tutorial.image),
//           width: double.infinity,
//           height: 300,
//           fit: BoxFit.cover,
//         ),
//         Padding(
//           padding: EdgeInsets.all(10),
//           child: Text(widget.tutorial.description),
//         ),
//         Padding(
//           padding: EdgeInsets.only(right: 40, left: 40, top: 40),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               ElevatedButton(
//                   child: const Text("Back"),
//                   onPressed: () {
//                     () => context.go('/category');
//                   }),
//               ElevatedButton(
//                   child: (_isenrolled
//                       ? const Text("Enrolled")
//                       : const Text("Enroll")),
//                   onPressed: () {
//                     setState(() {
//                       _isenrolled = true;
//                     });
//                   }),
//             ],
//           ),
//         )
//       ]),
//     );
//   }
// }
