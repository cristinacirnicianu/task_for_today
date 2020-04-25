import 'package:flutter/material.dart';
import '../models/task_model.dart';
import './new_task.dart';
import './task_list.dart';

class UserTasks extends StatefulWidget {
  @override
  _UserTasksState createState() => _UserTasksState();
}

class _UserTasksState extends State<UserTasks> {
  final List<Task> _userTasks = [
    Task(id: 't1', name: 'make yoga', hourTask: 2.5, dateTime: DateTime.now()),
    Task(
        id: 't2',
        name: 'java programing',
        hourTask: 5,
        dateTime: DateTime.now()),
    Task(id: 't3', name: 'meditate', hourTask: 0.15, dateTime: DateTime.now()),
  ];

  void _addNewTask(String tkName, double tkHours) {
    final newTk = Task(
      name: tkName,
      hourTask: tkHours,
      dateTime: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTasks.add(newTk);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTask(),
        TaskList(_userTasks),
      ],
    );
  }
}
