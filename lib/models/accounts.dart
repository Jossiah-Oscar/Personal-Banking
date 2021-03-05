// class Account {
//   String accountName;
//   List<Card> accounts;

//   Account({
//     this.accountName,
//     this.accounts,
//   });
// }
class Account {
  int expirationDate;
  int cVV;
  int number;
  int cardNumber;
  String name;

  Account(
      {this.expirationDate, this.cVV, this.number, this.cardNumber, this.name});

  Account.fromJson(Map<String, dynamic> json) {
    expirationDate = json['Expiration Date'];
    cVV = json['CVV'];
    number = json['Number'];
    cardNumber = json['Card Number'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Expiration Date'] = this.expirationDate;
    data['CVV'] = this.cVV;
    data['Number'] = this.number;
    data['Card Number'] = this.cardNumber;
    data['Name'] = this.name;
    return data;
  }
}

class Card {
  String name;
  int accountNumber;
  int cardNumber;
  int expDtae;
  int cvv;
  Card({
    this.accountNumber,
    this.cardNumber,
    this.cvv,
    this.expDtae,
    this.name,
  });
}
