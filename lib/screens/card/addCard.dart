import 'package:flutter/material.dart';
import 'package:bank_ui/Tests/cardlist.dart';

class AddNewCard extends StatefulWidget {
  @override
  _AddNewCardState createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  
  TextEditingController accountController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  void addCard(){
    setState(() {
      
    });
  }
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
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Account Number',
                ),
              ),
            ),
            RaisedButton(
              child: Text('Add'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
