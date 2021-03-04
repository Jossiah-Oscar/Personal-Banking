import 'dart:convert';

// import 'dart:html';

// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AccountsModel extends ChangeNotifier {
  final List<CardModel> accounts = [];

//Display cards from the database
  Future getCards() async {
    var _url = Uri.http("http://192.168.18.12", "/personalbanking/index.php");
    await http.get(_url).then((value) {
      List<dynamic> accountsList = jsonDecode(value.body) as List;
      accounts.clear();
      accountsList.forEach(
        (element) {
          accounts.add(
            new CardModel(
              int.tryParse(
                element["account_number"],
              ),
              element["account_name"],
            ),
          );
        },
      );

      notifyListeners();
    });
  }

  // ignore: unused_element
  void _onItemTapped(int index) {
    // ignore: unused_local_variable
    int _selectedIndex = index;
    print(index);
  }

// Add cards to the database
  Future addCard(accountNumber, cardNumber, accountName) async {
    var _url =
        Uri.http("http://192.168.18.12", "/personalbanking/addaccount.php");

    try {
      await http.post(_url, body: {
        // "accountName": accountName,
        "accountNumber": accountNumber.toString(),
        "cardNumber": cardNumber.toString(),
        "accountName": accountName.toString(),
      });
      // return getCards();
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}

class CardModel {
  int accountNumber;
  String accountName;

  int get getaccountNumber => accountNumber;
  String get getaccountName => accountName;
  // String get getName => name;

  CardModel(this.accountNumber, this.accountName);
}

class Accounts {
  int accountNumber;
  int cardNumber;
  String accountName;
  int balance;

  Accounts(
      {this.accountName, this.accountNumber, this.balance, this.cardNumber});
}
