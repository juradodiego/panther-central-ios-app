import 'package:flutter/material.dart';
import 'package:panther_central_ios_app/models/transaction_list_model.dart';
import 'package:panther_central_ios_app/models/transaction_model.dart';
import 'package:panther_central_ios_app/models/transactions_graph_model.dart';
import 'package:panther_central_ios_app/screens/choose_payment_screen.dart';
import 'package:panther_central_ios_app/viewModel/user_view_model.dart';
import 'package:provider/provider.dart';

const List<Widget> toggle = <Widget>[Text('D'), Text('M'), Text('Y')];

class TransactionScreen extends StatelessWidget {
  final List<bool> _selectedToggle = <bool>[
    false,
    true,
    false
  ]; // 0 = Day, 1 = Month, 2 = Year
  UserViewModel user; // This is the user that is passed in from the home screen

  TransactionScreen(this.user); // <--- Constructor

  @override
  Widget build(BuildContext context) {
    Provider.of<TransactionList>(context, listen: false)
        .updateTransactions(
        getCurrentToggle(_selectedToggle));
    List<Transaction> transactions = Provider.of<TransactionList>(context).transactions;
    return SingleChildScrollView(
      child: Column(
        children: [
          //#region TOGGLE SWITCH
          Row(
            children: [
              const Spacer(),
              Padding(
                  padding: const EdgeInsets.only(right: 20, top: 10),
                  child: ToggleButtons(
                    direction: Axis.horizontal,
                    onPressed: (int index) {
                      // The button that is tapped is set to true, and the others to false.
                      for (int i = 0; i < _selectedToggle.length; i++) {
                        _selectedToggle[i] = i == index;
                      }
                      Provider.of<TransactionList>(context, listen: false)
                          .updateTransactions(
                              getCurrentToggle(_selectedToggle));
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    selectedBorderColor: PC_BLUE,
                    selectedColor: PC_BLUE,
                    fillColor: PC_YELLOW,
                    color: PC_YELLOW,
                    constraints: const BoxConstraints(
                      minHeight: 40.0,
                      minWidth: 40.0,
                    ),
                    isSelected: _selectedToggle,
                    children: toggle,
                  ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          //#endregion
          //#region TRANSACTION SUMMARY
          const Text(
            "Transaction Summary",
            style: TextStyle(
                color: PC_YELLOW, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
              height: 250,
              width: 350,
              child: TransactionsGraph(user, transactions),
          ),
          const SizedBox(
            height: 15,
          ),
          //#endregion
          //#region TRANSACTION HISTORY
          const Text(
            "Transaction History",
            style: TextStyle(
                color: PC_YELLOW, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          createTransactionList(
              transactions),
          //#endregion
        ],
      ),
    );
  }

  Widget createTransactionList(List<Transaction> transactions) {
    return Container(
        width: 340,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (var transaction in transactions)
                createTransactionListElement(transaction)
            ],
          ),
        ));
  }

  Widget createTransactionListElement(Transaction transaction) {
    return Container(
      height: 40,
      width: 335,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "${transaction.date.month}/${transaction.date.day}",
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              transaction.description,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Text(
              transaction.amount,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              getAccount(transaction),
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  String getAccount(Transaction transaction) {
    switch (transaction.account) {
      case "Panther Funds":
        return "PF";
      case "Dining Dollars":
        return "DD";
      case "OC Dining Dollars":
        return "OC";
      case "Add. Dining Dollars":
        return "AD";
      case "Bonus Bucks":
        return "BB";
    }
    return "";
  }

  String getCurrentToggle(List<bool> boolArr) {
    if (boolArr[0]) {
      return "D";
    } else if (boolArr[1]) {
      return "M";
    } else {
      return "Y";
    }
  }
}
