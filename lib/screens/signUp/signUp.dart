import 'package:bank_ui/models/accountsModel.dart';
import 'package:bank_ui/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController accountNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SafeArea(
          child: SingleChildScrollView(
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
                    "Create\nAccount",
                    style: TextStyle(fontSize: 45),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40,
                    right: 40,
                    top: 40,
                  ),
                  child: TextField(
                    controller: accountNameController,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Name',
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
                    controller: emailController,
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
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                    left: 40,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 195,
                        ),
                        child: FloatingActionButton(
                          backgroundColor: Colors.pink,
                          child: Icon(Icons.trending_flat),
                          onPressed: () {
                            Provider.of<AuthService>(context, listen: false)
                                .signUp(emailController.text,
                                    passwordController.text, context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
