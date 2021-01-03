import 'package:flutter/material.dart';

class Services extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  final List<String> services = <String>[
    "Send Money",
    "Pay Bill",
    "Buy Airtime",
    "Withdraw Cash",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        height: 100,
        child: ListView.builder(
          padding: EdgeInsets.only(left: 10, right: 5),
          scrollDirection: Axis.horizontal,
          itemCount: services.length,
          itemBuilder: (context, index) {
            return ServicesTabs();
          },
        ),
      ),
    );
  }
}

class ServicesTabs extends StatefulWidget {
  @override
  _ServicesTabsState createState() => _ServicesTabsState();
}

class _ServicesTabsState extends State<ServicesTabs> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          height: 110,
          width: 90,
          decoration: BoxDecoration(
            color: Colors.amberAccent,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10),
              top: Radius.circular(10),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 26,
                top: 20,
                child: Icon(
                  Icons.payment,
                  size: 40,
                ),
              ),
              Positioned(
                  left: 18,
                  top: 70,
                  child: Text(
                    "Transfer",
                    style: TextStyle(fontSize: 15),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
