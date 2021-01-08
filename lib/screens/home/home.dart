import 'package:bank_ui/screens/home/components/card/addCard.dart';
import 'package:bank_ui/screens/home/components/card/cardlist.dart';
import 'package:bank_ui/screens/home/components/service/services.dart';
import 'package:bank_ui/constants/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCollapsed = true;

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
        if (_selectedIndex == 1) {
          Navigator.of(context).push(
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
          );
        } else if (_selectedIndex == 0) {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (
                context,
                animation,
                secondaryAnimation,
              ) =>
                  HomePage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return child;
              },
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 400,
                  color: Colors.lightBlue,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 180),
                        child: CardList(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Services(),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Card',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
