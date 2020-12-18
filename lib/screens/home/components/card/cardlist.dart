import 'package:bank_ui/models/accountsModel.dart';
import 'package:bank_ui/screens/home/components/card/cardListTest.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardList extends StatefulWidget {
  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  // final List<int> accounts = <int>[
  //   1234566578946958,
  // ];

  String name = "Rowland Benard Martin";

  final List<CardListTest> cardListTest = <CardListTest>[];
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   accounts.forEach((element) {
  //     cardListTest.add(
  //       new CardListTest(element, name),
  //     );
  //   });
  // }

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
              return CardListTest(model.accounts[index].accountNumber, "Hello");
              // Text(model.accounts[index].accountNumber.toString()) ;
            },
          );
        },
      ),
    );
  }
}
