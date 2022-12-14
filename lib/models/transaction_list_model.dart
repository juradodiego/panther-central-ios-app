import 'package:flutter/cupertino.dart';
import 'package:panther_central_ios_app/models/transaction_model.dart';
import 'package:panther_central_ios_app/viewModel/user_view_model.dart';
import 'package:tuple/tuple.dart';

class TransactionList with ChangeNotifier{

  TransactionList(this.user);

  final UserViewModel user;
  List<Transaction> transactions = [];

  void updateTransactions(String toggle){
    transactions =  user.filterTransactions(toggle);
    notifyListeners();
  }
}
