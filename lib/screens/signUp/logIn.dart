import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 40,
                right: 0,
                top: 105,
              ),
              child: Text(
                "Welcome",
                style: TextStyle(fontSize: 45),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40,
                right: 0,
              ),
              child: Text(
                "Back",
                style: TextStyle(fontSize: 45),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40,
                right: 40,
                top: 170,
              ),
              child: TextField(
                // controller: cardNumberController,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40,
                right: 40,
                top: 20,
              ),
              child: TextField(
                // controller: cardNumberController,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Text("Log In", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
