import 'package:bank_ui/constants/colors.dart';
import 'package:bank_ui/screens/home/components/list.dart';
import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Card", style: TextStyle(),)),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
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
            // Container(
            //   height: 220,
            //   width: 400,
            //   child: Hero(
            //     tag: 'world',
            //     child: Container(
            //       color: Colors.white,
            //       child: Image.asset("assets/world.png"),
            //     ),
            //   ),
            // ),
            SizedBox(height: 10),

            //Balance button and Amount
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     SizedBox(width: 30),
            //     Container(
            //       width: 100,
            //       child: OutlineButton(
            //         child: Text("Balance"),
            //       ),
            //     ),
            //     SizedBox(width: 30),
            //     Expanded(
            //       child: Container(
            //         width: 150,
            //         // color: Colors.red,
            //         child: Align(
            //           alignment: Alignment.centerLeft,
            //           child: Text("TZS 100,000,000",
            //               style: TextStyle(fontSize: 28)),
            //         ),
            //       ),
            //     ),
            //     SizedBox(width: 30),
            //   ],
            // ),
            SizedBox(
              height: 350,
              child: Column(
                children: [
                  //history and search
                  Container(
                    height: 350,
                    width: 380,
                    decoration: BoxDecoration(
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Transactions'),
                            SizedBox(width: 210),
                            OutlinedButton(
                              child: Text('More'),
                            ),
                          ],
                        ),
                        Expanded(
                          child: TransactionHistory(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              // child: RaisedButton(
              //   color: Colors.red,
              //   child: Text(
              //     'Send',
              //     style: TextStyle(fontSize: 20, color: Colors.white),
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
