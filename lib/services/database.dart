import 'package:bank_ui/models/accounts.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DatabaseService extends ChangeNotifier {
  final String uid;
  DatabaseService({this.uid});

  final String tempUID = "7mm1KmXFtrdrYgjzsYsCz1GQ4Ww1";
  final List<Account> cardList = [];
  //collection reference
  final CollectionReference accountCollection =
      FirebaseFirestore.instance.collection("Accounts");

//create user document when they SignUp for the first time
  Future updateUserData(
    List<dynamic> accounts,
    String accountName,
  ) async {
    try {
      await accountCollection.doc(uid).set(
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
    } catch (e) {
      print(e);
    }
    return notifyListeners();
  }

//Add accounts to the database
  Future addAccounts(
    String name,
    int accountNumber,
    int cardNumber,
    int expDtae,
    int cvv,
    String uid,
  ) async {
    print(uid);
    try {
      return await accountCollection.doc(tempUID).set(
        {
          'name': name,
          'accounts': [
            {
              'Name': name,
              'Number': accountNumber,
              'Card Number': cardNumber,
              'Expiration Date': expDtae,
              'CVV': cvv,
            }
          ],
        },
      );
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

// add more cards to the account
  Future addMoreAccounts(
    String name,
    int accountNumber,
    int cardNumber,
    int expDtae,
    int cvv,
    String uid,
  ) async {
    try {
      return await accountCollection.doc(tempUID).update(
        {
          "accounts": FieldValue.arrayUnion(
            [
              {
                'Name': name,
                'Number': accountNumber,
                'Card Number': cardNumber,
                'Expiration Date': expDtae,
                'CVV': cvv,
              }
            ],
          ),
        },
      );
    } catch (e) {}
    notifyListeners();
  }

  // check if card exists
  Future cardCheck() async {
    try {
      await accountCollection
          .where("accounts", arrayContainsAny: ["Jossiah"])
          .get()
          .then((value) {});
    } catch (e) {}
  }

//Getting a document snamshot
  Future docSnapShot() async {
    try {
      await accountCollection.get().then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          print(doc["name"]);
        });
      });
    } catch (e) {
      print(e);
    }
  }

  //Check if document Exists
  Future docCheck(
    String uid,
  ) async {
    try {
      accountCollection.doc(tempUID).get().then(
        (DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.exists) {
            try {
              List<dynamic> card = documentSnapshot.get(
                FieldPath(
                  [
                    "accounts",
                  ],
                ),
              );
              // ignore: todo
              // TODO Get a list of all cards.
              card.forEach((element) {
                card.add(new Account());
              });
              print(card);
            } on StateError catch (e) {
              print(e);
            }
          } else {
            print(" Document Doesn't Exist");
          }
        },
      );
    } catch (e) {
      print(e);
    }
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
