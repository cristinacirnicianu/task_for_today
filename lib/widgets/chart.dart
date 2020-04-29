import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './chart_bar.dart';
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

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'hour': totalSum
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupTaskValues.fold(0.0, (sum, item) {
      return sum +item['hour'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupTaskValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupTaskValues.map((dt) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  dt['day'],
                  dt['hour'],
                  totalSpending == 0.0 ? 0.0 :(dt['hour'] as double)/totalSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
