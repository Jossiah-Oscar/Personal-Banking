// import 'package:bank_ui/models/accounts.dart';
// import 'package:bank_ui/models/accountsModel.dart';
// import 'package:bank_ui/services/database.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class AccountList extends StatefulWidget {
//   @override
//   _AccountListState createState() => _AccountListState();
// }

// class _AccountListState extends State<AccountList> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamProvider<List<Account>>.value(
//       value: DatabaseService().accounts,
//       child: Scaffold(),
//     );
//   }
// }

// class AccountCard extends StatefulWidget {
//   @override
//   _AccountCardState createState() => _AccountCardState();
// }

// class _AccountCardState extends State<AccountCard> {
//   final accounts = Provider.of<>(context);

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
