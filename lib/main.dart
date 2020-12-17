import 'package:bank_ui/Tests/Hero1.dart';
import 'package:bank_ui/Tests/databaseTest.dart';
import 'package:bank_ui/Tests/stackDesign.dart';
import 'package:bank_ui/Tests/userAuthentication/screens/wrapper.dart';
import 'package:bank_ui/screens/card/cardview.dart';
import 'package:bank_ui/screens/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      // home: FirebaseRealtimeDemoScreen(),
      // home: Wrapper(),
      // home: TestStackBackground(),
    );
  }
}
