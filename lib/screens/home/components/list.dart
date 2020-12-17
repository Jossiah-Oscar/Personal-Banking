import 'package:flutter/material.dart';

class TransactionHistory extends StatefulWidget {
  @override
  _TransactionHistoryState createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  final List<int> colorCodes = <int>[600, 500, 100, 300, 400];
  final List<String> entries = <String>[
    '100,000,000 was sent to Rowland Martin',
    'You received 2,000,000 from Dash Technology',
    'Hi Jossiah, this message is to confirm that we received a deposit of TZS 3,500,000 in your account ending in 2555 on 12/12/2020. Thank you!',
    'Hi <<customer name>>, your bill is ready to review at <<website link to account>>. The amount due is <<TZS>> if paid by <<DD/MM/YYYY>>',
    'e'
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          color: Colors.amber[colorCodes[index]],
          child: Center(child: Text('${entries[index]}')),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
