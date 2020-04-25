import 'package:flutter/foundation.dart';
class Task {
  final String id;
  final String name;
  final DateTime dateTime;
  final double hourTask;

  Task(
  {@required this.id,
  @required this.name,
  @required this.dateTime,
  this.hourTask});
  }

