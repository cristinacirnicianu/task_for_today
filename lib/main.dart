import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './task_model.dart';
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
  final List<Task> tasks = [
    Task(id: 't1', name: 'make yoga', hourTask: 2.5, dateTime: DateTime.now()),
    Task(
        id: 't2',
        name: 'java programing',
        hourTask: 5,
        dateTime: DateTime.now()),
    Task(id: 't3', name: 'meditate', hourTask: 0.15, dateTime: DateTime.now()),
  ];

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
            Card(elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(decoration: InputDecoration(labelText: 'Task'),),
                  TextField(decoration: InputDecoration(labelText: 'Hours'),),
                  FlatButton(child: Text('Add task'),
                    textColor: Colors.blue,
                    onPressed: () {},)
                ],
              ),
            ),),
            Column(
              children: tasks.map((tk) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          tk.hourTask.toString() + 'h',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.blue[800]
                          ),),
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26, width: 2),
                        ),
                        padding: EdgeInsets.all(10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(tk.name, style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),),
                          Text(DateFormat.yMMMd().format(tk.dateTime),
                            style: TextStyle(color: Colors.grey[800]),),
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        ));
  }
}
