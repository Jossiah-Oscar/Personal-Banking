import 'package:flutter/material.dart';

class AccountsModel extends ChangeNotifier {
  final List<CardModel> accounts = [];

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
