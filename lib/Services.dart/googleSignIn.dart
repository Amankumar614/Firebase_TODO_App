import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier{
  void prinr(){
    print("we are here");
  }

final googleSignIn= GoogleSignIn();
GoogleSignInAccount? _user;
GoogleSignInAccount? get user=>_user!;

 Future googleLogin()async{
  print("we are here too");
  print("button is preesed $_user");
  // this is will show the pop up 
  final googleUser=await googleSignIn.signIn();
  if (googleUser==null)return;
  print("this is the value of googleUser $googleUser");
  _user=googleUser;
print("check this $_user ");
  final googleAuth = await googleUser.authentication;

  final Credential= GoogleAuthProvider.credential(

    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
    
  );
  await FirebaseAuth.instance.signInWithCredential(Credential);
  print("this is the google token ${ googleAuth.idToken}");
  // to update the ui
  notifyListeners();
}
Future logOut()async{
  FirebaseAuth.instance.signOut();
}
}