import 'package:bank_ui/components/maskedformatter.dart';
import 'package:bank_ui/constants/colors.dart';
import 'package:bank_ui/models/user.dart';
import 'package:bank_ui/screens/home/home.dart';
import 'package:bank_ui/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class AddNewCard extends StatefulWidget {
  @override
  _AddNewCardState createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  final accountNumberController = new TextEditingController();
  final cardNumberController = new TextEditingController();
  final accountNameController = new TextEditingController();
  final exdateController = new TextEditingController();
  final cvvController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Center(
            child: Text(
          "Add Card",
          style: TextStyle(),
        )),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                  ),
                  child: Container(
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
                                color: Colors.white,
                                decorationStyle: TextDecorationStyle.dotted),
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
                ),

                //Add card form
                Padding(
                  padding:
                      EdgeInsets.only(left: 25, right: 25, top: 30, bottom: 10),
                  child: TextField(
                    controller: accountNameController,
                    decoration: InputDecoration(
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
                      labelText: 'Account Number',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
                  child: TextField(
                    controller: cardNumberController,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.card_membership_sharp,
                        size: 20,
                      ),
                      labelText: 'Card Number',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      MaskedTextInputFormatter(
                        mask: 'xxxx-xxxx-xxxx-xxxx',
                        separator: '-',
                      ),
                    ],
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
                          controller: exdateController,
                          decoration: InputDecoration(
                              labelText: 'Expiration Date',
                              suffixIcon: Icon(
                                Icons.calendar_today_sharp,
                                size: 20,
                              )),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextField(
                            controller: cvvController,
                            decoration: InputDecoration(
                              labelText: 'CVV',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: ButtonTheme(
                    minWidth: 200,
                    height: 50,
                    child: ElevatedButton(
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
                        } else if (accountNameController.text.isEmpty) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(
                                "Account Name",
                              ),
                              content: Text("Please enter your Card Number"),
                            ),
                          );
                        } else {
                          Provider.of<DatabaseService>(context, listen: false)
                              .addAccounts(
                            accountNameController.text,
                            int.parse(accountNumberController.text),
                            int.parse(cardNumberController.text),
                            int.parse(exdateController.text),
                            int.parse(cvvController.text),
                            user.uid.toString(),
                          );

                          // Navigator.of(context).push(
                          //   PageRouteBuilder(
                          //     pageBuilder: (
                          //       context,
                          //       animation,
                          //       secondaryAnimation,
                          //     ) =>
                          //         HomePage(),
                          //     transitionsBuilder: (context, animation,
                          //         secondaryAnimation, child) {
                          //       return child;
                          //     },
                          //   ),
                          // );
                        }
                      },
                    ),
                  ),
                ),

                ElevatedButton(
                  child: Text('Update'),
                  onPressed: () {
                    Provider.of<DatabaseService>(context, listen: false)
                        .addMoreAccounts(
                      accountNameController.text,
                      int.parse(accountNumberController.text),
                      int.parse(cardNumberController.text),
                      int.parse(exdateController.text),
                      int.parse(cvvController.text),
                      user.uid.toString(),
                    );
                  },
                ),
                Row(
                  children: [
                    ElevatedButton(
                      child: Text('Document Check'),
                      onPressed: () {
                        Provider.of<DatabaseService>(context, listen: false)
                            .docSnapShot();
                      },
                    ),
                    ElevatedButton(
                      child: Text('print card'),
                      onPressed: () {
                        Provider.of<DatabaseService>(context, listen: false)
                            .docCheck(
                                // user.uid.toString(),
                                );

                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder: (
                              context,
                              animation,
                              secondaryAnimation,
                            ) =>
                                HomePage(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return child;
                            },
                          ),
                        );
                      },
                    ),
                    ElevatedButton(
                      child: Text('card check'),
                      onPressed: () {
                        Provider.of<DatabaseService>(context, listen: false)
                            .cardCheck();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UpdateCards extends StatelessWidget {
  final accountNumberController = new TextEditingController();
  final cardNumberController = new TextEditingController();
  final accountNameController = new TextEditingController();
  final exdateController = new TextEditingController();
  final cvvController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Center(
            child: Text(
          "Add Card",
          style: TextStyle(),
        )),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                  ),
                  child: Container(
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
                ),

                //Add card form
                Padding(
                  padding:
                      EdgeInsets.only(left: 25, right: 25, top: 30, bottom: 10),
                  child: TextField(
                    controller: accountNameController,
                    decoration: InputDecoration(
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
                      labelText: 'Card Number',
                      suffixIcon: Icon(Icons.card_membership_sharp),
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
                          controller: exdateController,
                          decoration: InputDecoration(
                            labelText: 'Expiration Date',
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextField(
                            controller: cvvController,
                            decoration: InputDecoration(
                              labelText: 'CVV',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: ButtonTheme(
                    minWidth: 200,
                    height: 50,
                    child: ElevatedButton(
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
                        } else if (accountNameController.text.isEmpty) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(
                                "Account Name",
                              ),
                              content: Text("Please enter your Card Number"),
                            ),
                          );
                        } else {
                          Provider.of<DatabaseService>(context, listen: false)
                              .addMoreAccounts(
                            accountNameController.text,
                            int.parse(accountNumberController.text),
                            int.parse(cardNumberController.text),
                            int.parse(exdateController.text),
                            int.parse(cvvController.text),
                            user.uid.toString(),
                          );

                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                              ) =>
                                  HomePage(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return child;
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
