import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo/Services.dart/initTitile.dart';
import 'package:todo/screen/editDialog.dart';

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
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ListTile(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return editDialog(
                      initTitle: widget.documentSnapshot['todoTitle'],
                      initDescription: widget.documentSnapshot['tododesc']);
                });
          },
          title: Text((widget.documentSnapshot != null)
              ? (widget.documentSnapshot['todoTitle'])
              : ""),
          subtitle: Text((widget.documentSnapshot != null)
              ? (widget.documentSnapshot['tododesc'])
              : ""),
          trailing: Row(mainAxisSize: MainAxisSize.min, children: [
            IconButton(
              icon: Icon(
                Icons.edit,
                color: Colors.greenAccent[400],
              ),
              onPressed: () {
                print("${widget.documentSnapshot['todoTitle']}");
                setState(() {
                  {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return editDialog(
                              initTitle: widget.documentSnapshot['todoTitle'],
                              initDescription:
                                  widget.documentSnapshot['tododesc']);
                        });
                  }
                });
              },
              color: Colors.red,
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  // FirebaseService().deleteTodos(
                  //     (widget.documentSnapshot != null)
                  //         ? (widget.documentSnapshot['todoTitle'])
                  //         : "");
                  FirebaseService().deleteTodos(titlestart);
                  var snackBar = SnackBar(content: Text('Todo is Deleted',style: TextStyle(color: Colors.red),));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                });
              },
              color: Colors.red,
            ),
          ])),
    );
  }
}
