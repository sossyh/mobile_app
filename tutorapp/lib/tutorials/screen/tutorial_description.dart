import 'package:flutter/material.dart';
import 'package:tutorapp/tutorials/screen/categories.dart';
import '../Model/tutorial_model.dart';

class tutorial_description extends StatefulWidget {
  tutorials tutorial;
  tutorial_description(this.tutorial);

  @override
  State<StatefulWidget> createState() => tutorial_description_State();
}

class tutorial_description_State extends State<tutorial_description> {
  @override
  bool _isenrolled = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tutorial.title),
      ),
      body: Column(children: [
        Image(
          image: AssetImage(widget.tutorial.image),
          width: double.infinity,
          height: 300,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(widget.tutorial.description),
        ),
        Padding(
          padding: EdgeInsets.only(right: 40, left: 40, top: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  child: const Text("Back"),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              ElevatedButton(
                  child: (_isenrolled
                      ? const Text("Enrolled")
                      : const Text("Enroll")),
                  onPressed: () {
                    setState(() {
                      _isenrolled = true;
                    });
                  }),
            ],
          ),
        )
      ]),
    );
  }
}
