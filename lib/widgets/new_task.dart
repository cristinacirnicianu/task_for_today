import 'package:flutter/material.dart';

class NewTask extends StatefulWidget {

  final Function addTask;
  NewTask(this.addTask);
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {

  final nameController = TextEditingController();
  final hourController = TextEditingController();

  void submitData() {
    final enteredName = nameController.text;
    final enteredHour = double.parse(hourController.text);
    if (enteredName.isEmpty || enteredHour <= 0) {
      return;
    }
   widget.addTask(
       enteredName,
       enteredHour);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Task'),
                controller: nameController,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Hours'),
                controller: hourController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
              ),
              FlatButton(
                child: Text('Add task'),
                textColor: Colors.blue,
                onPressed: submitData,
              )
            ],
          ),
        ),
      ),
    );
  }
}
