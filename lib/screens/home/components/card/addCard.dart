import 'package:bank_ui/models/accountsModel.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class AddNewCard extends StatefulWidget {
  @override
  _AddNewCardState createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  final accountNumberController = new TextEditingController();
  final cardNumberController = new TextEditingController();
  

  // final databaseReference = FirebaseDatabase().instance.reference();
  final List<String> tanzanianCity = [
    "Dar Es Salaam",
    "Dodoma",
    "Morogoro",
    "Mbeya",
    "Arusha",
    "Moshi"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: accountNumberController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Account Number',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: cardNumberController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Card Number',
                ),
              ),
            ),
            RaisedButton(
              child: Text('Add'),
              onPressed: () {
                Provider.of<AccountsModel>(context, listen: false).addCard(int.parse(accountNumberController.text), int.parse(cardNumberController.text));
              },
            ),
          ],
        ),
      ),
    );
  }
}
