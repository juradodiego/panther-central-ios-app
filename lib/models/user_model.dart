import 'package:panther_central_ios_app/models/transaction_model.dart';
import 'package:panther_central_ios_app/models/card_model.dart';

class User {
  final String firstName;
  final String lastName;
  final String role;
  final Map<String, double> accounts;
  final List<Transaction> transactions;
  final List<Card> cards;

  User(
      {required this.firstName,
      required this.lastName,
      required this.role,
      required this.accounts,
      required this.transactions,
      required this.cards});

  factory User.fromJson(Map<String, dynamic> json) {
    var transactionsJson = json["Transactions"] as List;
    var cardsJson = json["Cards"] as List;

    List<Transaction> transactionList = transactionsJson
        .map((transactionsJson) => Transaction.fromJson(transactionsJson))
        .toList();
    List<Card> cardList =
        cardsJson.map((cardsJson) => Card.fromJson(cardsJson)).toList();

    return User(
        firstName: json["FirstName"],
        lastName: json["LastName"],
        role: json["Role"],
        accounts: json["Accounts"],
        transactions: transactionList,
        cards: cardList);
  }

  @override
  String toString() {
    return '{ $firstName, $lastName, $role, ${accounts.toString()}, ${transactions.toString()}, ${cards.toString()} }';
  }
}
