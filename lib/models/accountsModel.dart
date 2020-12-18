import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AccountsModel extends ChangeNotifier {
  final List<CardModel> accounts = [];

  String _url = "http://192.168.18.12/personalbanking/index.php";

  void getCards() {
    http.get(_url).then((value) {
      List accountsList = jsonDecode(value.body) as List;
      accountsList.forEach((element) {
        accounts.add(
          new CardModel(
            int.parse(
              element["card_number"],
            ),
          ),
        );
      });

      // print(jsonDecode(value.body)[0][0]);
      notifyListeners();
    });
  }

  void AddCard(int accountNumber) {
    accounts.add(new CardModel(accountNumber));

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
