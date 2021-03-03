import 'package:bank_ui/models/accountsModel.dart';
import 'package:bank_ui/models/user.dart';
import 'package:bank_ui/screens/home/components/card/addCard.dart';
import 'package:bank_ui/screens/signUp/logIn.dart';
import 'package:bank_ui/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on Firebase User
  FirebaseUser _userFromFirebaseUser(User user) {
    return user != null ? FirebaseUser(uid: user.uid) : null;
  }

// auth change stream
  Stream<FirebaseUser> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

//Log in with Email and Password Firebase.
  Future logIn(String email, String password, context) async {
    try {
      dynamic result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return print(result);
    } on FirebaseAuthException catch (e) {
      // ignore: unrelated_type_equality_checks

      print(e);
    }
    // print(FirebaseAuthException);
    notifyListeners();
  }

//SignUp with Email and Password Firebase
  Future signUp(String email, String password, context) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = result.user;

      //create a new document for each new registered user
      await DatabaseService(uid: user.uid)
          .updateUserData([], "Rowland Benard Martin");

      //Navigate to user adding a new card
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (
            context,
            animation,
            secondaryAnimation,
          ) =>
              AddNewCard(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        ),
      );

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

//Forgot password
  Future sendpasswordresetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

// Sign in Anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return
          // _userFromFirebaseUser(user);
          print(user.uid);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
