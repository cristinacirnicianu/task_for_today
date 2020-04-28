import 'package:flutter/material.dart';
import '../models/task_model.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Task> recentTasks;

  Chart(this.recentTasks);

  List<Map<String, Object>> get groupTaskValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;
      for (var i = 0; i < recentTasks.length; i++) {
        if (recentTasks[i].dateTime.day == weekDay.day &&
            recentTasks[i].dateTime.month == weekDay.month &&
            recentTasks[i].dateTime.year == weekDay.year) {
          totalSum += recentTasks[i].hourTask;
        }
      }
      print(DateFormat.E().format(weekDay));
      print(totalSum);

      return {'day': DateFormat.E().format(weekDay).substring(0, 1), 'hour': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupTaskValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupTaskValues.map((dt) {
          return Text('${dt['day']}: ${dt['hour']}');
        }).toList(),
      ),
    );
  }
}
