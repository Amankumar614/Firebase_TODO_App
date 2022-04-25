import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Auth/login.dart';
import 'package:todo/Services.dart/googleSignIn.dart';
import 'package:todo/screen/myHomePage.dart';
import 'package:todo/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // GoogleSignInProvider().googleLogin();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(debugShowCheckedModeBanner: false,
        theme:ThemeData.dark(),title: "todo", home: wrapper()));
  }
}
