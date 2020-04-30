import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/adaptive_flatbutton.dart';

class NewTask extends StatefulWidget {
  final Function addTask;

  NewTask(this.addTask);

  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final _nameController = TextEditingController();
  final _hourController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_hourController.text.isEmpty) {
      return;
    }
    final enteredName = _nameController.text;
    final enteredHour = double.parse(_hourController.text);
    if (enteredName.isEmpty || enteredHour <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTask(
      enteredName,
      enteredHour,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Task'),
                controller: _nameController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Hours'),
                controller: _hourController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                        child: Text(_selectedDate == null
                            ? 'NO DATE CHOSEN'
                            : 'Picked date: ${DateFormat.yMd().format(_selectedDate)}')),
                    AdaptiveFlatButton('Chose date', _presentDatePicker )
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
