import 'package:bank_ui/constants/colors.dart';
import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Card",
          style: TextStyle(),
        )),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(70),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(2.0, 2.0), // shadow direction: bottom right
                  )
                ],
              ),
              height: 360,
              width: 415,
              child: Stack(
                children: [
                  Positioned(
                    top: 80,
                    left: 20,
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 200,
                      width: 360,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: backgroundDark,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue,
                            blurRadius: 3.0,
                            spreadRadius: 3.0,
                            offset: Offset(
                                2.0, 2.0), // shadow direction: bottom right
                          )
                        ],
                      ),
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
                  ),
                  Positioned(
                    top: 290,
                    left: 20,
                    child: Row(
                      children: [
                        Text("Your card is active"),
                        SizedBox(
                          width: 32,
                        ),
                        OutlinedButton.icon(
                          style: ButtonStyle(),
                          label: Text("Freeze"),
                          icon: Icon(
                            Icons.ac_unit,
                            size: 20,
                          ),
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        OutlinedButton.icon(
                          style: ButtonStyle(),
                          label: Text("Erase"),
                          icon: Icon(Icons.delete),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
                left: 30,
              ),
              child: Text(
                "Card Settings",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 130,
                    width: 100,
                    color: Colors.blueAccent,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 10,
                          top: 50,
                          child: Icon(
                            Icons.rss_feed,
                            size: 30,
                          ),
                        ),
                        Positioned(
                          top: 90,
                          left: 10,
                          child: Text(
                            "Contactless \nPayment",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 130,
                    width: 100,
                    color: Colors.blueAccent,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 10,
                          top: 50,
                          child: Icon(
                            Icons.language,
                            size: 30,
                          ),
                        ),
                        Positioned(
                          top: 90,
                          left: 10,
                          child: Text(
                            "Online \nPayments",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 130,
                    width: 100,
                    color: Colors.blueAccent,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 10,
                          top: 50,
                          child: Icon(
                            Icons.credit_card,
                            size: 30,
                          ),
                        ),
                        Positioned(
                          top: 90,
                          left: 10,
                          child: Text(
                            "ATM \nWithdrawals",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
