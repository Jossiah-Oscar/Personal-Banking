import 'dart:convert';

// import 'dart:html';

import 'package:bank_ui/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AccountsModel extends ChangeNotifier {
  final List<CardModel> accounts = [];
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

//Display cards from the database
  Future getCards() async {
    String _url = "http://192.168.8.100/personalbanking/index.php";
    await http.get(_url).then((value) {
      List<dynamic> accountsList = jsonDecode(value.body) as List;
      accountsList.forEach((element) {
        accounts.add(
          new CardModel(int.tryParse(
            element["account_number"],
          )),
        );
      });

      print(jsonDecode(value.body)[0][0]);
      notifyListeners();
    });
  }

// Add cards to the database
  Future addCard(accountNumber, cardNumber) async {
    String _url = "http://192.168.8.100/personalbanking/addaccount.php";
    await http.post(_url, body: {
      // "accountName": accountName,
      "accountNumber": accountNumber.toString(),
      "cardNumber": cardNumber.toString(),
    });

    notifyListeners();
  }

//Log in wiht Email and Password Firebase.
  Future logIn(String email, String password, context) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (
            context,
            animation,
            secondaryAnimation,
          ) =>
              HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        ),
      );
    } on FirebaseAuthException catch (e) {
      // ignore: unrelated_type_equality_checks

      print(e);
    }
    // print(FirebaseAuthException);
    notifyListeners();
  }

//Signup with Email and Password Firebase
  Future signUp(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed Up";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        return "The account already exists for that email.";
      } else {
        return "Something Went Wrong.";
      }
    } catch (e) {}
    print(FirebaseAuthException);
    notifyListeners();
  }
}

class CardModel {
  int accountNumber;
  // String name;

  int get getaccountNumber => accountNumber;
  // String get getName => name;

  CardModel(this.accountNumber);
}
