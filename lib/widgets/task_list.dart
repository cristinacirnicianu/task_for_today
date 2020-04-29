import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/task_model.dart';
import 'package:intl/intl.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;

  TaskList(this.tasks);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: tasks.isEmpty
          ? Column(
              children: [
                Text(
                  'No tasks added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FittedBox(
                            child: Text(
                          tasks[index].hourTask.toStringAsFixed(2) + 'h',
                        )),
                      ),
                    ),
                    title: Text(tasks[index].name,
                        style: Theme.of(context).textTheme.headline6),
                    subtitle: Text(DateFormat.yMMMd().format(tasks[index].dateTime),
                      style:TextStyle(color:Theme.of(context).primaryColor),),
                  ),
                );
              },
              itemCount: tasks.length,
            ),
    );
  }
}
