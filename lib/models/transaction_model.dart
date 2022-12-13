class Transaction {
  final DateTime date;
  final String description;
  final String account;
  final String amount;

  Transaction(
      {required this.date,
      required this.description,
      required this.account,
      required this.amount});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
        date: DateTime.parse(json["Date"]),
        description: json["Description"],
        account: json["Account"],
        amount: json["Amount"]);
  }

  @override
  String toString() {
    // return a string with the date only including the day and the month

    switch (account) {
      case 'Panther Funds':
        return ' ${date.month}/${date.day} $description $amount PF';
      case 'Dining Dollars':
        return ' ${date.month}/${date.day} $description $amount DD';
      case 'OC Dining Dollars':
        return ' ${date.month}/${date.day} $description $amount OCDD';
      case 'Add. Dining Dollars':
        return ' ${date.month}/${date.day} $description $amount ADD';
      case 'Bonus Bucks':
        return ' ${date.month}/${date.day} $description $amount BB';
    }
  return ' ${date.month}/${date.day} $description $amount';
  }
}
