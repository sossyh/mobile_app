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
        title: Text("TUTORIAL CATEGORIES"),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
              icon: const Icon(Icons.search))
        ],
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
                      return tutorial_description(tutorial);
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

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    "Backend",
    "Frontend",
    "Mobile App Development",
    "Astronomy"
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }
}
