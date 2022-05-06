import 'package:flutter/material.dart';
import 'tutorial_model.dart';
import 'tutorial_description.dart';

class category extends StatefulWidget {
  const category({Key? key}) : super(key: key);

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("tutorial categories"),
      ),
      drawer: Drawer(),
      body: ListView.builder(
        itemCount: tutorial_category.length,
        itemBuilder: (BuildContext context, int index) {
          final tutorial = tutorial_category[index];
          return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return tutorial_description();
                    },
                  ),
                );
              },
              child: Column(
                children: [
                  Card(
                    elevation: 10,
                    child: Column(
                      children: [
                        Image.asset(
                          tutorial.image,
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 40,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(0, 0, 0, 0.3)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  tutorial.title,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                            Positioned(
                                top: 13,
                                right: 20,
                                child: Container(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.ac_unit,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                      Icon(
                                        Icons.ac_unit,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                      Icon(
                                        Icons.ac_unit,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ));
        },
      ),
    );
  }
}
