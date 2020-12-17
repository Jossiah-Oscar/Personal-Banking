import 'package:bank_ui/constants/colors.dart';
import 'package:flutter/material.dart';

class ServiceTab extends StatefulWidget {
  @override
  _ServiceTabState createState() => _ServiceTabState();
}

class _ServiceTabState extends State<ServiceTab> {
  final List<String> services = <String>[
    "Send Money",
    "Pay Bill",
    "Buy Airtime",
    "Withdraw Cash"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 200,
      child: GridView.count(
        crossAxisSpacing: 1.0,
        mainAxisSpacing: 1.0,
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(4, (index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              color: backgroundMid,
              child: Stack(
                children: [
                  Positioned(
                    left: 70,
                    child: IconButton(
                      icon: Icon(
                        Icons.send_sharp,
                        size: 20,
                      ), // color: button,
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 60,
                    child: Text(
                      "${services[index]}",
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
