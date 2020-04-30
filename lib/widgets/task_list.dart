import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/task_model.dart';
import 'package:intl/intl.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Function deteteTask;

  TaskList(this.tasks, this.deteteTask);

  @override
  Widget build(BuildContext context) {
    return tasks.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                  Text(
                    'No tasks added yet!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      height: constraints.maxHeight *0.30,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      )),
                ],
              );
            },
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
                  subtitle: Text(
                    DateFormat.yMMMd().format(tasks[index].dateTime),
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deteteTask(tasks[index].id)),
                ),
              );
            },
            itemCount: tasks.length,
          );
  }
}
