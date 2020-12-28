// import 'package:bank_ui/screens/home/components/service/gridtest.dart';
// import 'package:bank_ui/constants/colors.dart';
// import 'package:flutter/material.dart';

// class TestServices extends StatefulWidget {
//   @override
//   _TestServicesState createState() => _TestServicesState();
// }

// class _TestServicesState extends State<TestServices> {
//   final List<String> services = <String>[
//     "Send Money",
//     "Pay Bill",
//     "Buy Airtime",
//     "Withdraw Cash",
    
//   ];

//   // final List<GridTest> gridTest = <GridTest>[];
//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   //   services.forEach((element) {
//   //     gridTest.add(
//   //       new GridTest(
//   //         element,
//   //         Icon(
//   //           Icons.send_sharp,
//   //           size: 20,
//   //         ),
//   //       ),
//   //     );
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         color: Colors.white12,
//         height: 400,
//         child: GridView.count(
//           scrollDirection: Axis.vertical,
//           crossAxisCount: 3,
//           children: List.generate(gridTest.length, (index) {
//             return gridTest[index];
//           }),
//         ),
//       ),
//     );
//   }
// }
