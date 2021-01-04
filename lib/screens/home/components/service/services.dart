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
      padding: const EdgeInsets.only(top: 0),
      child: Container(
        height: 135,
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
    return Padding(
      padding: const EdgeInsets.only(left: 5, top: 20, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 100,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 10,
                  top: 30,
                  child: Icon(
                    Icons.language,
                    size: 30,
                  ),
                ),
                Positioned(
                  top: 70,
                  left: 10,
                  child: Text(
                    "Online \nPayments",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
