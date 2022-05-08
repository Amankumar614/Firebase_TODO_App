import 'package:flutter/material.dart';
import 'package:todo/Services.dart/initTitile.dart';
import 'package:todo/Services.dart/services.dart';

class editDialog extends StatefulWidget {
  // const editDialog({ Key? key }) : super(key: key);
  final String initTitle;
  final String initDescription;
  editDialog({required this.initTitle, required this.initDescription});

  @override
  State<editDialog> createState() => _editDialogState();
}


final _formKey = GlobalKey<FormState>();

class _editDialogState extends State<editDialog> {
  @override
  Widget build(BuildContext context) {
String changeTitle = widget.initTitle;
String changeDescr = widget.initDescription;

    return Form(
      key: _formKey,
      child: AlertDialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: const Text("Edit todo"),
        content: SizedBox(
          width: 400,
          height: 140,
          child: Column(
            children: 
            [
              Row(
                children: [
                  Text("Title : ${widget.initTitle}",style: TextStyle(fontSize: 20)),
                 
                  
                ],
              ),
               SizedBox(height:20),
              Row(children: [ Text("Description :",style: TextStyle(fontSize: 20),),],),
              
              // TextFormField(
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter title';
              //     }
              //     return null;
              //   },
              //   onChanged: ((titlevalue) => changeTitle = titlevalue),
              //   initialValue: widget.initTitle,
              // ),
              // SizedBox(height:60)
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter description';
                  }
                  return null;
                },
                onChanged: ((descvalue) => changeDescr = descvalue),
                initialValue: widget.initDescription,
              )
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                
                if (_formKey.currentState!.validate()) {
                  print("change title $changeTitle");
                print("change title $changeDescr");
                  setState(() {
                    titlestart= widget.initTitle;
                    FirebaseService().UpdateTodos(
                        widget.initTitle, changeTitle, changeDescr);
                  });
                  Navigator.pop(context);
                  var snackBar = SnackBar(content: Text('Todo is Edited',style: TextStyle(color: Colors.green),));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
                return null;
                
              },
              child: const Text("Edit"))
        ],
      ),
    );
  }
}
