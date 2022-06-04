// // import 'package:comment_box/comment/comment.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';

// import '../Bloc/comment_bloc.dart';

// class Comment_form extends StatefulWidget {
//   Comment_form({Key? key}) : super(key: key);

//   @override
//   State<Comment_form> createState() => _Comment_formState();
// }

// class _Comment_formState extends State<Comment_form> {
//   final formKey = GlobalKey<FormState>();

//   final messageController = TextEditingController();

//   final TextEditingController commentController = TextEditingController();

//   final passController = TextEditingController();

//   final TextEditingController usernameController = TextEditingController();

//   // @override
//   Widget commentChild(data) {
//     return ListView(
//       children: [
//         for (var i = 0; i < data.length; i++)
//           Padding(
//             padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
//             child: ListTile(
//               leading: GestureDetector(
//                 onTap: () async {
//                   // Display the image in large form.
//                   print("Comment seen");
//                 },
//                 child: Container(
//                   height: 50.0,
//                   width: 50.0,
//                   decoration: new BoxDecoration(
//                       color: Colors.blue,
//                       borderRadius: new BorderRadius.all(Radius.circular(50))),
//                   child: CircleAvatar(
//                       radius: 50,
//                       backgroundImage: NetworkImage(data[i]['pic'] + "$i")),
//                 ),
//               ),
//               title: Text(
//                 data[i]['name'],
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               subtitle: Text(data[i]['message']),
//             ),
//           )
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Comment Page"),
//         centerTitle: true,
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage('img11.jpg'), fit: BoxFit.fill)),
//         ),
//         elevation: 0,
//         toolbarHeight: 100.0,
//         backgroundColor: Colors.black12,
//       ),
//       body: Container(
//         child: CommentBox(
//           userImage:
//               "https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400",
//           child: commentChild(filedata),
//           labelText: 'Write a comment...',
//           withBorder: false,
//           errorText: 'Comment cannot be blank',
//           sendButtonMethod: () {
//             if (formKey.currentState!.validate()) {
//               print(commentController.text);
//               setState(() {
//                 var value = {
//                   'name': 'New user',
//                   'pic':
//                       'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
//                   'message': commentController.text
//                 };
//                 filedata.insert(0, value);
//               });
//               commentController.clear();
            
//               FocusScope.of(context).unfocus();
//             } else {
//               print("Not validated");
//             }
//           },
//           formKey: formKey,
//           commentController: commentController,
//           backgroundColor: Colors.black,
//           textColor: Colors.white,
//           sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
//         ),
//       ),
//     );
//   }
// }
