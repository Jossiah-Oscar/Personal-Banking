import 'package:bank_ui/models/accountsModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormData extends StatefulWidget {
  @override
  _FormDataState createState() => _FormDataState();
}

class _FormDataState extends State<FormData> {
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
            ),
            TextField(
              controller: numberController,
            ),
            // RaisedButton(
            //   child: Text("Submit"),
            //   onPressed: () {
            //     Provider.of<AccountsModel>(context, listen: false)
            //         .addInfo(nameController.text, int.parse(numberController.text));
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
