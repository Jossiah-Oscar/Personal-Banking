import 'package:bank_ui/screens/signUp/forgotPassword.dart';
import 'package:bank_ui/screens/signUp/signUp.dart';
import 'package:bank_ui/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: GestureDetector(
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
                      "Welcome\nBack",
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
                      top: 20,
                      left: 40,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: Text(
                            "Log In",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 230,
                          ),
                          child: FloatingActionButton(
                            backgroundColor: Colors.pink,
                            child: Icon(Icons.trending_flat),
                            onPressed: () {
                              Provider.of<AuthService>(context, listen: false)
                                  .signInAnon();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 110,
                      left: 40,
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                              ) =>
                                  SignUp(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return child;
                              },
                            ),
                          ),
                          child: Text("Sign Up"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 180),
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder: (
                                  context,
                                  animation,
                                  secondaryAnimation,
                                ) =>
                                    ForgotPassword(),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  return child;
                                },
                              ),
                            ),
                            child: Text("Forgot Password"),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //     left: 40,
                  //     right: 40,
                  //     top: 40,
                  //   ),
                  //   child: RaisedButton(
                  //     onPressed: () {
                  //       Navigator.of(context).push(
                  //         PageRouteBuilder(
                  //           pageBuilder: (
                  //             context,
                  //             animation,
                  //             secondaryAnimation,
                  //           ) =>
                  //               SignUp(),
                  //           transitionsBuilder:
                  //               (context, animation, secondaryAnimation, child) {
                  //             return child;
                  //           },
                  //         ),
                  //       );
                  //     },
                  //     child: Text("Sign In"),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
