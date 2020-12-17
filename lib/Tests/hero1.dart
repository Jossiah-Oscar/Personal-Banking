import 'package:flutter/material.dart';

class MyHomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('data'),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (
                  context,
                  animation,
                  secondaryAnimation,
                ) =>
                    MyDetails(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return child;
                },
              ),
            ),
            child: Hero(
              tag: 'dash',
              child: new Image.asset('assets/tanzanite.png'),
            ),
          ),
        ),
      ),
    );
  }
}

class MyDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Hero(
          tag: 'dash',
          child: Container(
            child: new Image.asset('assets/tanzanite.png'),
            color: Colors.black,
            width: 300,
            height: 400,
          ),
        ),
      ),
    );
  }
}
