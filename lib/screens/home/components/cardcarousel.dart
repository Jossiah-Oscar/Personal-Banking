import 'package:bank_ui/screens/card/cardview.dart';
import 'package:flutter/material.dart';

class CardCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 180,
        width: 380,
        decoration: BoxDecoration(
          color: Colors.amberAccent,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
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
                width: 380,
                color: Colors.white,
                child: Hero(
                  tag: 'world',
                  child: Image.asset("assets/world.png"),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Image.asset("assets/titanium.png"),
            ),
            Container(
              color: Colors.white,
              child: Image.asset("assets/tanzanite.png"),
            ),
          ],
        ),
      ),
    );
  }
}
