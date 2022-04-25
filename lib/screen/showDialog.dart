import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo/Services.dart/services.dart';

class ShowDialog extends StatefulWidget {
  // const ShowDialog({ Key? key }) : super(key: key);

  @override
  State<ShowDialog> createState() => _ShowDialogState();
}

final _formKey = GlobalKey<FormState>();

class _ShowDialogState extends State<ShowDialog> {
  String title = '';
  String Description = '';
  @override
  Widget build(BuildContext context) {
    print("showdialog title $Title");
    print("showdialog description $Description");
    return Form(
      key: _formKey,
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: const Text("Add todo"),
        content: SizedBox(
          width: 400,
          height: 140,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: "Title"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter title';
                  }
                  return null;
                },
                onChanged: ((value) => title = value),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Description"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter description';
                  }
                  return null;
                },
                onChanged: ((value) => Description = value),
              )
            ],
          ),
        ),
        actions: [
          TextButton(
            
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    print("this is the title ${title}");
                    FirebaseService().createToDo(title, Description);
                  });
                  Navigator.pop(context);
                  var snackBar = SnackBar(content: Text('Todo is Added',style: TextStyle(color: Colors.green),));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
                return null;
              },
              child: const Text("Add"))
        ],
      ),
    );
  }
}
