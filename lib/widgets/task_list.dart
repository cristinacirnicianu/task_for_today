import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/task_items.dart';
import '../models/task_model.dart';


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
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                      height: constraints.maxHeight * 0.30,
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
              return TaskItems(tasks: tasks[index], deteteTask: deteteTask);
            },
            itemCount: tasks.length,
          );
  }
}


