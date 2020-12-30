import 'dart:convert';

// import 'dart:html';

import 'package:bank_ui/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AccountsModel extends ChangeNotifier {
  final List<CardModel> accounts = [];

//Display cards from the database
  Future getCards() async {
    String _url = "http://192.168.8.100/personalbanking/index.php";
    await http.get(_url).then((value) {
      List<dynamic> accountsList = jsonDecode(value.body) as List;
      accountsList.forEach((element) {
        accounts.add(
          new CardModel(
            int.tryParse(
              element["account_number"],
            ),
          ),
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

  Future logIn(email, password, context) async {
    String _url = "http://192.168.8.100/personalbanking/login.php";
    var response = await http.post(_url, body: {
      "email": email.toString(),
      "password": password.toString(),
    });

    var message = jsonDecode(response.body);

    if (message == 'Login Matched') {
      Navigator.of(context).push(
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
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(message),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    print(message);

    notifyListeners();
  }

  // //Test addInfo to Database
  // void addInfo(name, number) {
  //   _url = "http://192.168.8.100/personalbanking/adddata.php";

  //   http.post(_url, body: {
  //     "name": name.toString(),
  //     "number": number.toString(),
  //   });

  //   // test.jsonEncode(name,number);

  //   notifyListeners();
  // }
}

class CardModel {
  int accountNumber;
  // String name;

  int get getaccountNumber => accountNumber;
  // String get getName => name;

  CardModel(this.accountNumber);
}

// //POST Request for Accounts
class AccountModel {
  int accountNumber;
  int cardNumber;
  String accountName;

  AccountModel(this.accountName, this.accountNumber, this.cardNumber);
}

class UserModel {
  String email;
  String password;

  UserModel(this.email, this.password);
}
