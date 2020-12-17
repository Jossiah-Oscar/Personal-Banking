import 'package:bank_ui/constants/colors.dart';
import 'package:flutter/material.dart';

class GridTest extends StatefulWidget {
  String testText;
  Icon testIcon;
  GridTest(String test, Icon icon) {
    this.testText = test;
    this.testIcon = icon;
  }
  @override
  _GridTestState createState() => _GridTestState();
}

class _GridTestState extends State<GridTest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 30,
        color: background,
        child: Stack(
          children: [
            Positioned(
              left: 40,
              child: IconButton(
                icon: widget.testIcon, // color: button,
              ),
            ),
            Align(
              alignment: Alignment(0.0, 0.35),
              child: Text(
                widget.testText,
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              top: 113,
              child: Container(
                width: 150,
                height: 10,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
