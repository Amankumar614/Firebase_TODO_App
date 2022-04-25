import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  // createToDo(String title, String Description) {
  //   // this is the instance of the firestore collection
  //   DocumentReference documentReference =
  //       FirebaseFirestore.instance.collection("MyTodos").doc(title);

  //   Map<String, dynamic> todoList = {
  //     "todoTitle": title,
  //     "tododesc": Description
  //   };
  //   documentReference.set(todoList).whenComplete(() => print("All Done"));
  // }

    createToDo(String title, String Description) {
    // this is the instance of the firestore collection
    print("this is the title which we are getting $title");
      print("this is the title which we are getting $Description");
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
    print("this is the item which is used to delete the todo $item");
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('MyTodos').doc(item);
    documentReference.delete().whenComplete(() => print("deleted"));
  }

  UpdateTodos(String title,String changeTitle,String changeDescr)async{
  print("we are ready to upadte");
  print("this is the data which we get $changeTitle and $changeDescr by using the xxxx $title");
  DocumentReference documentReference =
        FirebaseFirestore.instance.collection('MyTodos').doc(title);
         Map<String, dynamic> upadteTodo = {
      "todoTitle": changeTitle,
      "tododesc": changeDescr
    };
  // return await documentReference.set(upadteTodo).whenComplete(() => print("upadte complete"));
  return await documentReference.update(
    upadteTodo
    // title=changeTitle;
  );
  
}

}
