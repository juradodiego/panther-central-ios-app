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
    return '{ $date, $description, $account, $amount }';
  }
}
