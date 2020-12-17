import 'package:bank_ui/Tests/cardlist.dart';
import 'package:bank_ui/Tests/testService.dart';
import 'package:bank_ui/components/appbar.dart';
import 'package:bank_ui/constants/colors.dart';
import 'package:bank_ui/screens/card/addCard.dart';
import 'package:bank_ui/screens/home/components/cardcarousel.dart';
import 'package:bank_ui/screens/home/components/list.dart';
import 'package:bank_ui/screens/home/components/service.dart';
import 'package:bank_ui/screens/sidebar/sidebar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCollapsed = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Stack(
        children: [
          //Main Body
          SafeArea(
            child: Column(
              children: <Widget>[
                //Custom AppBar
                CustomAppBar(),

                SizedBox(
                  height: 10,
                ),

                //Bank Cards Carousel
                CardList(),
                SizedBox(
                  height: 15,
                ),

                //Service Tab
                TestServices()
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        width: 50,
        color: button,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.card_membership_sharp),
            Icon(Icons.card_membership_sharp),
            GestureDetector(
                onTap: () => Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (
                          context,
                          animation,
                          secondaryAnimation,
                        ) =>
                            AddNewCard(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return child;
                        },
                      ),
                    ),
                child: Icon(Icons.add)),
            Icon(Icons.card_membership_sharp),
            Icon(Icons.card_membership_sharp),
          ],
        ),
      ),
    );
  }
}
