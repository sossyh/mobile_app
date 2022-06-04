import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'tutorial_description.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../tutorials.dart';
import 'package:go_router/go_router.dart';

// import '../blocs/course_bloc.dart';
// import '../blocs/course_event.dart';
// import '../models/course.dart';

class AddUpdateTutorial extends StatefulWidget {
  static const routeName = 'tutorialAddUpdate';
  final TutorialArgument args;

  const AddUpdateTutorial({Key? key, required this.args}) : super(key: key);

  @override
  _AddUpdateTutorialState createState() => _AddUpdateTutorialState();
}

class _AddUpdateTutorialState extends State<AddUpdateTutorial> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _tutorial = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('${widget.args.edit ? "Edit Tutorial" : "Add New Tutorial"}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.tutorial?.code : '',
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please insert the tutorial code';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: 'Tutorial Code'),
                  onSaved: (value) {
                    setState(() {
                      _tutorial["code"] = value;
                    });
                  }),
              TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.tutorial?.title : '',
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please insert the tutorial title';
                    }
                    return null;
                  },
                  decoration:
                      const InputDecoration(labelText: 'Tutorial Title'),
                  onSaved: (value) {
                    _tutorial["title"] = value;
                  }),
              // TextFormField(
              //     initialValue: widget.args.edit
              //         ? widget.args.course?.ects.toString()
              //         : '',
              //     validator: (value) {
              //       if (value != null && value.isEmpty) {
              //         return 'Please enter course ects';
              //       }
              //       return null;
              //     },
              // decoration: const InputDecoration(labelText: 'Course ECTS'),
              // onSaved: (value) {
              //   setState(() {
              //     if (value != null) {
              //       _course["ects"] = int.parse(value);
              //     }
              //   });
              // }),
              TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.tutorial?.description : '',
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please insert tutorial description';
                    }
                    return null;
                  },
                  decoration:
                      const InputDecoration(labelText: 'Tutorial Description'),
                  onSaved: (value) {
                    setState(() {
                      _tutorial["description"] = value;
                    });
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form != null && form.validate()) {
                      form.save();
                      final Tutorial_Event event = widget.args.edit
                          ? Tutorilal_Update(
                              widget.args.tutorial?.id ?? 0,
                              Tutorial(
                                id: widget.args.tutorial!.id,
                                code: _tutorial["code"],
                                title: _tutorial["title"],
                                description: _tutorial["description"],
                              ),
                            )
                          : Tutorial_Create(
                              Tutorial(
                                id: _tutorial["id"],
                                code: _tutorial["code"],
                                title: _tutorial["title"],
                                description: _tutorial["description"],
                              ),
                            );
                      BlocProvider.of<TutorialBloc>(context).add(event);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          category.routeName, (route) => false);
                    }
                  },
                  label: const Text('SAVE'),
                  icon: const Icon(Icons.save),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
