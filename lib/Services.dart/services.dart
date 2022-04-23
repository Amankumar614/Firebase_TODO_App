import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  createToDo(String title, String Description) {
    // this is the instance of the firestore collection
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyTodos").doc(title);

    Map<String, String> todoList = {
      "todoTitle": title,
      "tododesc": Description
    };
    documentReference.set(todoList).whenComplete(() => print("All Done"));
  }
// this will delete the particular todo
  deleteTodos(item) {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('MyTodos').doc(item);
    documentReference.delete().whenComplete(() => print("deleted"));
  }
}
