import 'package:bank_ui/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 150,
                  left: 40,
                ),
                child: Text(
                  "Reset Password",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 80, top: 20),
                child: Text(
                  "Enter the email associated with your account and we will send and email with instructions to reset your password",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40,
                  right: 40,
                  top: 100,
                ),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 130,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Provider.of<AuthService>(context, listen: false)
                        .sendpasswordresetEmail(emailController.text);
                  },
                  child: Text("Send Instructions"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
