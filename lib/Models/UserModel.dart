import 'TransactionModel.dart';
import 'CardModel.dart';

class User {

  final String firstName;
  final String lastName;
  final String role;
  final Map<String, double> accounts;
  final List<Transaction> transactions;
  final List<Card> cards;

  User({this.firstName, this.lastName, this.role, this.accounts, this.transactions, this.cards});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      firstName: json["FirstName"],
      lastName: json["LastName"],
      role: json["Role"],
      accounts: json["Accounts"],
      transactions: Transaction.fromJson(json["Transactions"])
    );
  }
}