import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskfortoday/widgets/task_list.dart';
import 'models/task_model.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final nameController = TextEditingController();
  final hourController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Task for today'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('CHART'),
                elevation: 5,
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Task'),
                      controller: nameController,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Hours'),
                      controller: hourController,
                    ),
                    FlatButton(
                      child: Text('Add task'),
                      textColor: Colors.blue,
                      onPressed: () {
                        print(nameController.text);
                      },
                    )
                  ],
                ),
              ),
            ),
            TaskList(),
          ],
        ));
  }
}
