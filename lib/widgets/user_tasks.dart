import 'package:flutter/material.dart';
import '../models/task_model.dart';
import './new_task.dart';
import './task_list.dart';

class UserTasks extends StatefulWidget {
  @override
  _UserTasksState createState() => _UserTasksState();
}

class _UserTasksState extends State<UserTasks> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTask(_addNewTask),
      ],
    );
  }
}
