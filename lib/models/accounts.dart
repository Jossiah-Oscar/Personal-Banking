class Account {
  String accountName;
  List<Card> accounts;

  Account({
    this.accountName,
    this.accounts,
  });
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
