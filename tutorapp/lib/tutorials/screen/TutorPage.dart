import 'package:flutter/material.dart';

import 'TutorialsBloc.dart';

class TutorPage extends StatefulWidget {
  @override
  _TutorPageState createState() => _TutorPageState();
}

class _TutorPageState extends State<TutorPage> {
  TutorialsBloc _tutorialBloc = new TutorialsBloc();

  TextEditingController _textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            child: CircleAvatar(
              radius: 40.0,
              child: ClipRect(
                child: (Image.asset(
                  'pic3.jpg',
                  fit: BoxFit.cover,
                  height: 45,
                )),
              ),
            ),
          ),
          Spacer(),
          Text("Tutor's page"),
        ]),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('img11.jpg'), fit: BoxFit.fill)),
        ),
        elevation: 0,
        toolbarHeight: 100.0,
        backgroundColor: Colors.black12,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: IconButton(
          icon: Icon(
            Icons.add,
            color: Color.fromARGB(255, 220, 154, 231),
          ),
          hoverColor: Colors.purple,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Add New Tutorial"),
                  content: TextField(
                    autofocus: true,
                    controller: _textEditingController,
                  ),
                  actions: <Widget>[
                    RaisedButton(
                      child: Text("SAVE"),
                      onPressed: () {
                        String name = _textEditingController.text;
                        _tutorialBloc.addNewTutorial(name);
                        _textEditingController.text = "";
                      },
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
      body: StreamBuilder<List<String>>(
        stream: _tutorialBloc.productListStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<String>? list = snapshot.data;
            return ListView.builder(
              itemCount: list?.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 0,
                  child: ListTile(
                    title: Text(list![index]),
                    trailing: IconButton(
                      onPressed: () {
                        _tutorialBloc.deleteTutorial(list[index]);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );

    showDialogFunc(context, img, title, desc) {
      return showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(15),
                height: 320,
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          img,
                          width: 200,
                          height: 200,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        // width: 200,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            desc,
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[500]),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          );
        },
      );
    }
  }
}
