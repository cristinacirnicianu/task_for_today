import 'package:flutter/material.dart';
import 'package:taskfortoday/models/task_model.dart';
import 'package:intl/intl.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  final List<Task> _userTasks = [
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
    return  Column(
      children: _userTasks.map((tk) {
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
    );
  }
}
