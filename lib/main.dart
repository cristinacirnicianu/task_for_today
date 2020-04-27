import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './widgets/task_list.dart';
import './models/task_model.dart';
import './widgets/new_task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
      ),
      title: 'My daily tasks',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void _startAddNewTask(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
            child: NewTask(_addNewTask),
        behavior: HitTestBehavior.opaque,);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task for today'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed:() => _startAddNewTask(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('CHART'),
                elevation: 5,
              ),
            ),
            TaskList(_userTasks),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTask(context),
      ),
    );
  }
}
