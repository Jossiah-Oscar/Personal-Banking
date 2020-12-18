import 'package:bank_ui/constants/colors.dart';
import 'package:bank_ui/screens/card/cardview.dart';
import 'package:bank_ui/screens/home/components/card/cardview.dart';
import 'package:flutter/material.dart';

class TestStackBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(),
            body: Container(
              color: backgroundDark,
            ),
          ),
          Positioned(
            top: 80,
            // left: 100,
            child: Container(
              color: background,
              height: 180,
              width: 380,
              child: PageView(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (
                          context,
                          animation,
                          secondaryAnimation,
                        ) =>
                            CardView(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return child;
                        },
                      ),
                    ),
                    child: Container(
                      child: Hero(
                        tag: 'world',
                        child: Image.asset("assets/world.png"),
                      ),
                    ),
                  ),
                  Container(
                    child: Image.asset("assets/titanium.png"),
                  ),
                  Container(
                    child: Image.asset("assets/tanzanite.png"),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
