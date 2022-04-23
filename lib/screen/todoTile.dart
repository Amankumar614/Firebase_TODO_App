import 'package:flutter/material.dart';

import '../Services.dart/services.dart';

class todoList extends StatefulWidget {
  // const todoList({ Key? key }) : super(key: key);
  dynamic documentSnapshot;
  todoList({required this.documentSnapshot});

  @override
  State<todoList> createState() => _todoListState();
}

class _todoListState extends State<todoList> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text((widget.documentSnapshot != null)
          ? (widget.documentSnapshot['todoTitle'])
          : ""),
      subtitle: Text((widget.documentSnapshot != null)
          ? (widget.documentSnapshot['tododesc'])
          : ""),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          setState(() {
            FirebaseService().deleteTodos((widget.documentSnapshot != null)
                ? (widget.documentSnapshot['todoTitle'])
                : "");
          });
        },
        color: Colors.red,
      ),
    );
  }
}
