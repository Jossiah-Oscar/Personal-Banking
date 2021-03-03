import 'package:bank_ui/models/accountsModel.dart';
import 'package:bank_ui/screens/home/components/card/addCard.dart';
import 'package:bank_ui/screens/home/home.dart';
import 'package:bank_ui/screens/signUp/logIn.dart';
import 'package:bank_ui/screens/signUp/signUp.dart';
import 'package:bank_ui/services/authentication.dart';
import 'package:bank_ui/services/database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AccountsModel()),
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => DatabaseService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AddNewCard(),
      ),
    );
  }
}
