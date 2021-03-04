import 'package:bank_ui/constants/colors.dart';
import 'package:bank_ui/models/accountsModel.dart';
// ignore: unused_import
import 'package:bank_ui/screens/home/components/card/cardview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardList extends StatefulWidget {
  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  final List<CardListTest> cardListTest = <CardListTest>[];
  @override
  void initState() {
    Provider.of<AccountsModel>(context, listen: false).getCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Consumer<AccountsModel>(
        builder: (context, model, child) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 16, right: 6),
            itemCount: model.accounts.length,
            itemBuilder: (context, index) {
              return CardListTest(model.accounts[index].accountNumber,
                  model.accounts[index].accountName);
              // Text(model.accounts[index].accountNumber.toString()) ;
            },
          );
        },
      ),
    );
  }
}

class CardListTest extends StatefulWidget {
  int accountNumber;
  String accountName;
  CardListTest(int accountNumber, String name) {
    this.accountNumber = accountNumber;
    this.accountName = name;
  }
  @override
  _CardListTestState createState() => _CardListTestState();
}

class _CardListTestState extends State<CardListTest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 200,
      width: 360,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18), color: backgroundDark),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 30,
            top: 90,
            child: Text(
              widget.accountNumber.toString(),
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
              widget.accountName,
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
    );
  }
}
