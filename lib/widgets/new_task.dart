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

  void _submitData() {
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

  void _presentDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime.now());
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
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Hours'),
                controller: hourController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Text('NO DATE CHOSEN'),
                    FlatButton(child: Text('Choose date', style: TextStyle(
                        fontWeight: FontWeight.bold,
                    ),),
                    onPressed: _presentDatePicker,
                    textColor: Theme.of(context).primaryColor,)
                  ],
                ),
              ),
              RaisedButton(
                child: Text('Add task'),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: _submitData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
