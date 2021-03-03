import 'package:bank_ui/models/accounts.dart';
import 'package:bank_ui/models/accountsModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DatabaseService extends ChangeNotifier {
  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference accountCollection =
      FirebaseFirestore.instance.collection("Accounts");

  Future updateUserData(List<dynamic> accounts, String accountName) async {
    return await accountCollection.doc(uid).set(
      {
        'name': accountName,
        'accounts': [
          {
            'Name': '',
            'Number': '',
            'Card Number': '',
            'Expiration Date': '',
            'CVV': '',
          }
        ],
      },
    );
  }

  Future addAccounts(String name, int accountNumber, int cardNumber,
      int expDtae, int cvv) async {
    // List<dynamic> accounts = List.from(snapshot.data['accounts'])
    print(uid);
    return await accountCollection.doc("LPfpgHaR9VbzRv7TKeqddg0jqtI2").update({
      'accounts': FieldValue.arrayUnion(['name'])
    });
  }

//Account List from snapshot
  List<Account> _accountListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Account(
        accountName: doc.data()['accountName'] ?? '',
        accounts: doc.data()[[]] ?? '',
      );
    }).toList();
  }

  //Get account collections
  Stream<List<Account>> get accounts {
    return accountCollection.snapshots().map((_accountListFromSnapshot));
  }
}
