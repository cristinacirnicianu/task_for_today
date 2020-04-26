import 'package:flutter/material.dart';

class NewTask extends StatelessWidget {
  final Function addTask;
  final nameController = TextEditingController();
  final hourController = TextEditingController();

  NewTask(this.addTask);

  void submitData() {
    final enteredName = nameController.text;
    final enteredHour = double.parse(hourController.text);
    if (enteredName.isEmpty || enteredHour <= 0) {
      return;
    }
    addTask(enteredName, enteredHour);
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
