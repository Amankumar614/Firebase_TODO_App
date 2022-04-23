import 'package:flutter/material.dart';
import 'package:todo/Services.dart/services.dart';

class ShowDialog extends StatefulWidget {
  // const ShowDialog({ Key? key }) : super(key: key);
  String title;
  String Description;
  ShowDialog({required this.title,required this.Description});

  @override
  State<ShowDialog> createState() => _ShowDialogState();
}

class _ShowDialogState extends State<ShowDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  title: const Text("Add todo"),
                  content: SizedBox(
                    width: 400,
                    height: 100,
                    child: Column(
                      children: [
                        TextField(
                          onChanged: ((value) => widget.title = value),
                        ),
                        TextField(
                          onChanged: ((value) => widget.Description = value),
                        )
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                          
                            FirebaseService().createToDo(widget.title, widget.Description);
                          });
                          Navigator.pop(context);
                        },
                        child: const Text("Add"))
                  ],
                );
  }
}