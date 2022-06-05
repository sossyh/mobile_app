import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
// import 'package:tutorapp/registration/registration.dart';
import '../comment.dart';
import 'package:comment_box/comment/comment.dart';

class comment_form extends StatefulWidget {
  comment_form({Key? key}) : super(key: key);

  @override
  State<comment_form> createState() => _comment_formState();
}

class _comment_formState extends State<comment_form> {
  final formKey = GlobalKey<FormState>();

  final Idcontroller = TextEditingController();

  final textcontroller = TextEditingController();

  final CommentRepository commentRepository =
      CommentRepository(CommentDataProvider());

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
        value: this.commentRepository,
        child: BlocProvider(
          create: (_) => CommentBloc(commentRepository: this.commentRepository)
            ..add(comment_Load()),
          child: Scaffold(
            appBar: AppBar(
              title: Text("Comment Page"),
              centerTitle: true,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('mobile.jpg'), fit: BoxFit.fill)),
              ),
              elevation: 0,
              toolbarHeight: 100.0,
              backgroundColor: Colors.black12,
            ),
            body: Container(
                child: Row(
              children: [
                Spacer(),
                CommentBox(
                  withBorder: false,
                  errorText: 'Comment cannot be blank',
                  labelText: 'write a comment........',
                  formKey: formKey,
                  commentController: textcontroller,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  sendWidget:
                      Icon(Icons.send_sharp, size: 30, color: Colors.white),
                  sendButtonMethod: () {
                    if (formKey.currentState!.validate()) {
                      print(textcontroller.text);
                      setState(() {
                        var value = {
                          'name': 'New User',
                          'pic':
                              'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
                          'message': textcontroller.text
                        };
                        filedata.insert(0, value);
                      });
                      textcontroller.clear();
                      FocusScope.of(context).unfocus();
                    } else {
                      print("Not validated");
                    }
                  },
                ),
                BlocBuilder<CommentBloc, Comment_State>(
                  builder: (_, Comment_State state) {
                    Widget buttonChild = Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    );

                    if (state is Comment_Operation_Failure) {
                      return const Text("The comment is not sent");
                    }
                    if (state is Comment_Operation_Success) {
                      return buttonChild = ElevatedButton(
                        onPressed: () {
                          context.push('/category');
                        },
                        child: buttonChild,
                      );
                    }

                    return ElevatedButton(
                      onPressed: () {
                        final formValid = formKey.currentState!.validate();
                        if (!formValid) return;

                        final regBloc = BlocProvider.of<CommentBloc>(context);
                        regBloc.add(
                          Write_comment(
                            text: textcontroller.text,
                          ),
                        );
                      },
                      child: buttonChild,
                    );
                  },
                ),
              ],
            )),
          ),
        ));
  }
}
