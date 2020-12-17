import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transfer"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Container(
              height: 180,
              width: 380,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red[500],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: Text("NMB BANK", textAlign: TextAlign.left),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          // color: Colors.red,

                          child: Text("NMB BANK", textAlign: TextAlign.right),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            // color: Colors.green,

                            child: Center(
                          child: Text("1022 1022 1023 1023",
                              textAlign: TextAlign.center),
                        )),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            // color: Colors.black,

                            height: 55,
                            width: 150,
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text("JOSSIAH KIBONA",
                                  textAlign: TextAlign.center),
                            )),
                      ),
                      Expanded(
                        child: Container(
                          // color: Colors.black,
                          height: 55,
                          width: 100,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text("02/25", textAlign: TextAlign.center),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              //child: Image.asset("assets/world.png", fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }
}
