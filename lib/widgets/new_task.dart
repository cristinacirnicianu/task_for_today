import 'package:flutter/material.dart';

class NewTask extends StatelessWidget {
  final nameController = TextEditingController();
  final hourController = TextEditingController();

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
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Hours'),
                controller: hourController,
              ),
              FlatButton(
                child: Text('Add task'),
                textColor: Colors.blue,
                onPressed: () {
                  print(nameController.text);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
