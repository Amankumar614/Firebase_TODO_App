
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/Services.dart/googleSignIn.dart';
import 'package:todo/screen/showDialog.dart';
import 'package:todo/screen/todoTile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// final String title = '';

class _MyHomePageState extends State<MyHomePage> {
  List todos = List.empty();
  String title = '';
  String Description = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todo App'),
          actions: [IconButton(onPressed: (){GoogleSignInProvider().logOut();}, icon:Icon(Icons.access_time_rounded))],
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("MyTodos").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text("Error occur");
            }
            else{
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (BuildContext context, int index) {
                QueryDocumentSnapshot<Object?>? documentSnapshot=snapshot.data?.docs[index];
                return Dismissible(
                    key: Key(index.toString()),
                    child: Card(
                      elevation: 4,
                      child: todoList(documentSnapshot: documentSnapshot,)
                    ));
              },
            );}
          }
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (() => showDialog(
              context: context,
              builder: (BuildContext context) {
                return ShowDialog(title: title,Description: Description,);
              })
              ),
              child: const Icon(Icons.add,color: Colors.white,),
        ));
  }
}
