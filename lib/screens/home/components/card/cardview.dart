import 'package:bank_ui/constants/colors.dart';
import 'package:bank_ui/models/accounts.dart';
import 'package:flutter/material.dart';

class CardView extends StatefulWidget {
  final Account account;
  const CardView({Key key, @required this.account}) : super(key: key);
  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  bool isSwitchedOnline = false;
  bool isSwitchedATM = false;
  bool isSwitchedLess = false;
  bool isSwitchedBlock = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          " My Card",
          style: TextStyle(),
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(right: 10),
                height: 200,
                width: 360,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: backgroundDark,
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 30,
                      top: 90,
                      child: Text(
                        widget.account.number.toString(),
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
                        widget.account.name,
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.04,
                width: MediaQuery.of(context).size.width,
                // color: Colors.lightBlue,
                child: Text(
                  "Favourite Contacts",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                  // color: Colors.lightBlue,

                  ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                      left: 10,
                      bottom: 4,
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.17,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 3.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            size: 30,
                          ),
                          Text("Rowland"),
                          Text("Martin"),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            ExpansionTile(
              backgroundColor: Colors.white,
              title: Text(
                " Activities",
                style: TextStyle(fontSize: 20),
              ),
              children: [
                ListTile(
                  tileColor: Colors.white,
                  leading: Icon(Icons.person),
                  title: Text(
                    'Rowland Martin',
                    style: TextStyle(fontSize: 17),
                  ),
                  subtitle: Text(
                    "Payment Sent",
                    style: TextStyle(fontSize: 14),
                  ),
                  trailing: Text(
                    "TSH 20,000,000",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                ListTile(
                  tileColor: Colors.white,
                  leading: Icon(Icons.person),
                  title: Text(
                    'Rowland Martin',
                    style: TextStyle(fontSize: 17),
                  ),
                  subtitle: Text(
                    "Payment Sent",
                    style: TextStyle(fontSize: 14),
                  ),
                  trailing: Text(
                    "TSH 20,000,000",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            //Card Setting
            ExpansionTile(
              title: Text(
                " Card Settings",
                style: TextStyle(fontSize: 20),
              ),
              children: [
                ListTile(
                  title: Text('Online Payment'),
                  trailing: Switch(
                    value: isSwitchedOnline,
                    onChanged: (value) {
                      setState(() {
                        isSwitchedOnline = value;
                        print(isSwitchedOnline);
                      });
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),
                ),
                ListTile(
                  title: Text('ATM Withdraw'),
                  trailing: Switch(
                    value: isSwitchedATM,
                    onChanged: (value) {
                      setState(() {
                        isSwitchedATM = value;
                        print(isSwitchedATM);
                      });
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),
                ),
                ListTile(
                  title: Text('Connectionless Payment'),
                  trailing: Switch(
                    value: isSwitchedLess,
                    onChanged: (value) {
                      setState(() {
                        isSwitchedLess = value;
                        print(isSwitchedLess);
                      });
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),
                ),
                ListTile(
                  title: Text('Block Card'),
                  trailing: Switch(
                    value: isSwitchedBlock,
                    onChanged: (value) {
                      setState(() {
                        isSwitchedBlock = value;
                        print(isSwitchedBlock);
                      });
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),
                ),
              ],
            ),
            //Activities
          ],
        ),
      ),
    );
  }
}
