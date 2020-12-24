import 'dart:convert';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AccountsModel extends ChangeNotifier {
  final List<CardModel> accounts = [];

  String _url = "http://192.168.8.100/personalbanking/index.php";

//Display cards from the database
  void getCards() {
    http.get(_url).then((value) {
      List accountsList = jsonDecode(value.body) as List;
      accountsList.forEach((element) {
        accounts.add(
          new CardModel(
            int.parse(
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
  void addCard(accountNumber, cardNumber) {
    _url = "http://192.168.8.100/personalbanking/addaccount.php";
    http.post(_url, body: {
      // "accountName": accountName,
      "accountNumber": accountNumber.toString(),
      "cardNumber": cardNumber.toString(),
    });

    notifyListeners();
  }

  //Test addInfo to Database
  void addInfo(name, number) {
    _url = "http://192.168.8.100/personalbanking/adddata.php";

    http.post(_url, body: {
      "name": name.toString(),
      "number": number.toString(),
    });

    // test.jsonEncode(name,number);

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

//POST Request for Accounts
class AccountModel {
  int accountNumber;
  int cardNumber;
  String accountName;

  AccountModel(this.accountName, this.accountNumber, this.cardNumber);
}

// //POST Request Test Model
// class TestModel {
//   final String name;
//   final int number;

//   TestModel(this.name, this.number);
// }
