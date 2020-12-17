import 'package:flutter/material.dart';

class PractiseRun extends StatefulWidget {
  @override
  _PractiseRunState createState() => _PractiseRunState();
}

class _PractiseRunState extends State<PractiseRun> {
  final _pageController = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 180,
          width: 380,
          child: PageView(
            children: [
              Container(
                height: 180,
                width: 380,
                color: Colors.red,
              ),
              Container(
                height: 180,
                width: 380,
                color: Colors.green,
              ),
              Container(
                height: 180,
                width: 380,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
