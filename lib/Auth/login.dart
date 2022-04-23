import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../Services.dart/googleSignIn.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  void initState() {
    print("call the function");
    // TODO: implement initState
    super.initState();
    GoogleSignInProvider().googleLogin;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Center(
          child: ElevatedButton.icon(
              onPressed: () {
                print("button pressed");
                // final signIn =
                //     Provider.of<GoogleSignInProvider>(context, listen: false);
                //     signIn.googleLogin;
                GoogleSignInProvider().googleLogin();
              },
              icon: const FaIcon(
                FontAwesomeIcons.google,
                color: Colors.red,
              ),
              label: const Text("Sign Up With Google")),
        ));
  }
}
