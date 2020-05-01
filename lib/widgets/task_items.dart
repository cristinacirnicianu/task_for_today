import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/task_model.dart';
import 'package:intl/intl.dart';

class TaskItems extends StatelessWidget {
  const TaskItems({
    Key key,
    @required this.tasks,
    @required this.deteteTask,
  }) : super(key: key);

  final Task tasks;
  final Function deteteTask;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
                child: Text(
                  tasks.hourTask.toStringAsFixed(2) + 'h',
                )),
          ),
        ),
        title: Text(tasks.name,
            style: Theme.of(context).textTheme.headline6),
        subtitle: Text(
          DateFormat.yMMMd().format(tasks.dateTime),
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        trailing: MediaQuery.of(context).size.width > 400
            ? FlatButton.icon(
          textColor: Theme.of(context).errorColor,
          icon: const Icon(Icons.delete),
          label: const Text('Delete'),
          onPressed: () => deteteTask(tasks.id),
        )
            : IconButton(
            icon:const Icon(Icons.delete),
            color: Theme.of(context).errorColor,
            onPressed: () => deteteTask(tasks.id)),
      ),
    );
  }
}