import 'package:bank_ui/models/accountsModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewCard extends StatefulWidget {
  @override
  _AddNewCardState createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {

  final accountNumberCon = new TextEditingController();

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
                controller: accountNumberCon,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Account Number',
                ),
              ),
            ),
            RaisedButton(
              child: Text('Add'),
              onPressed: () {
                Provider.of<AccountsModel>(context, listen: false)
                    .addCard(int.parse(accountNumberCon.text));
              },
            ),
          ],
        ),
      ),
    );
  }
}
