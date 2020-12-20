import 'package:bank_ui/constants/colors.dart';
import 'package:bank_ui/screens/home/components/card/cardview.dart';
import 'package:flutter/material.dart';

class CardListTest extends StatefulWidget {
  int testAccount = 0;
  String testName = "";
  CardListTest(int account, String name) {
    this.testAccount = account;
    this.testName = name;
  }
  @override
  _CardListTestState createState() => _CardListTestState();
}

class _CardListTestState extends State<CardListTest> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (
            context,
            animation,
            secondaryAnimation,
          ) =>
              CardView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        ),
      ),
      child: Container(
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
                widget.testAccount.toString(),
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
                widget.testName,
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
    );
  }
}
