import 'package:bank_ui/constants/colors.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Add Card",
          style: TextStyle(),
        )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 25, bottom: 15),
                    child: Text(
                      "Add Card",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ],
              ),
              //Card
              Container(
                margin: EdgeInsets.only(right: 10),
                height: 200,
                width: 360,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: backgroundDark),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 30,
                      top: 90,
                      child: Text(
                        '****  ****  ****  6958',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 30,
                      top: 145,
                      child: Text(
                        'Card Holder',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 30,
                      top: 165,
                      child: Text(
                        'Rowland Benard Martin',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 225,
                      top: 145,
                      child: Text(
                        'Expires',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 225,
                      top: 165,
                      child: Text(
                        '11/22',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 275,
                      top: 0,
                      child: Container(
                        width: 70,
                        height: 70,
                        child: Image.asset("assets/Nmb_logo.jpg"),
                      ),
                    ),
                    Positioned(
                      left: 275,
                      top: 135,
                      child: Container(
                        width: 65,
                        height: 65,
                        child: Image.asset("assets/mastercard.png"),
                      ),
                    ),
                  ],
                ),
              ),

              //Add card form
              Padding(
                padding:
                    EdgeInsets.only(left: 25, right: 25, top: 30, bottom: 10),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Card Holder Name',
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
                child: TextField(
                  controller: accountNumberController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Account Number',
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
                child: TextField(
                  controller: cardNumberController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Card Number',
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: cardNumberController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Expiration Date',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextField(
                          controller: cardNumberController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'CVV',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ButtonTheme(
                  minWidth: 200,
                  height: 50,
                  child: RaisedButton(
                    child: Text('Add'),
                    onPressed: () {
                      if (accountNumberController.text.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(
                              "Account Number",
                            ),
                            content: Text("Please enter your Account Number"),
                            actions: [],
                          ),
                        );
                      } else if (cardNumberController.text.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(
                              "Card Number",
                            ),
                            content: Text("Please enter your Card Number"),
                          ),
                        );
                      } else {}
                      {
                        Provider.of<AccountsModel>(context, listen: false)
                            .addCard(int.parse(accountNumberController.text),
                                int.parse(cardNumberController.text));
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
