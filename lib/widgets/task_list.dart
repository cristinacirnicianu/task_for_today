import 'package:flutter/material.dart';
import '../models/task_model.dart';
import 'package:intl/intl.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  TaskList(this.tasks);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              children: [
                Container(
                  child: Text(
                    tasks[index].hourTask.toStringAsFixed(2) + 'h',
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
                    border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                  ),
                  padding: EdgeInsets.all(10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tasks[index].name, style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),),
                    Text(DateFormat.yMMMd().format(tasks[index].dateTime),
                      style: TextStyle(color: Theme.of(context).primaryColor),),
                  ],
                )
              ],
            ),
          );
        },
        itemCount: tasks.length,
        ),
    );
  }
}
