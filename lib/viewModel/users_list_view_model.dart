import 'package:panther_central_ios_app/models/address_model.dart';
import 'package:panther_central_ios_app/models/custom_card_model.dart';
import 'package:panther_central_ios_app/models/transaction_model.dart';
import 'package:panther_central_ios_app/models/user_model.dart';
import 'package:panther_central_ios_app/viewModel/user_view_model.dart';




class UsersListViewModel {
  Map<String, UserViewModel> users = <String, UserViewModel>{};

  UserViewModel? fetchUser(String username) {
    String normalizedUsername = username.toLowerCase();
    generateUsers();
    return users[normalizedUsername];

  }

  void generateUsers() {
    //#region User One Acct.
    var userOneAccount = <String, double>{};
    userOneAccount['Panther Funds'] = 13.14;
    userOneAccount['Dining Dollars'] = 12.34;
    userOneAccount['OC Dining Dollars'] = 56.78;
    userOneAccount['Add. Dining Dollars'] = 90.10;
    userOneAccount['Bonus Bucks'] = 11.12;
    //#endregion

    //#region User One Transactions
    var userOneTransactions = <Transaction>[];
    Transaction userOneTransactionOne = Transaction(
        date: DateTime.now().subtract(const Duration(days:1)),
        description: 'UserOneTransactionOne',
        account: 'Panther Funds',
        amount: r'$30.00');
    Transaction userOneTransactionTwo = Transaction(
        date: DateTime.now().subtract(const Duration(days:2)),
        description: 'UserOneTransactionTwo',
        account: 'Dining Dollars',
        amount: r'-$20.00');
    Transaction userOneTransactionThree = Transaction(
        date: DateTime.now(),
        description: 'UserOneTransactionThree',
        account: 'Panther Funds',
        amount: r'-$15.00');
    Transaction userOneTransactionFour = Transaction(
        date: DateTime.now(),
        description: 'UserOneTransactionFour',
        account: 'OC Dining Dollars',
        amount: r'-$10.00');
    Transaction userOneTransactionFive = Transaction(
        date: DateTime.now(),
        description: 'UserOneTransactionFive',
        account: 'Add. Dining Dollars',
        amount: r'-$5.00');
    Transaction userOneTransactionSix = Transaction(
        date: DateTime.now(),
        description: 'UserOneTransactionSix',
        account: 'Bonus Bucks',
        amount: r'-$1.00');
    Transaction userOneTransactionSeven = Transaction(
        date: DateTime.now().subtract(const Duration(days:30)),
        description: 'UserOneTransactionSeven',
        account: 'Panther Funds',
        amount: r'$40.00');
    Transaction userOneTransactionEight = Transaction(
        date: DateTime.now().subtract(const Duration(days:370)),
        description: 'UserOneTransactionEight',
        account: 'Dining Dollars',
        amount: r'-$30.00');
    // Create userOneTransactionNin
    Transaction userOneTransactionNine = Transaction(
        date: DateTime.now().subtract(const Duration(days:340)),
        description: 'UserOneTransactionNine',
        account: 'OC Dining Dollars',
        amount: r'-$20.00');
    Transaction userOneTransactionTen = Transaction(
        date: DateTime.now().subtract(const Duration(days:240)),
        description: 'UserOneTransactionTen',
        account: 'Add. Dining Dollars',
        amount: r'-$10.00');
    Transaction userOneTransactionEleven = Transaction(
        date: DateTime.now().subtract(const Duration(days:210)),
        description: 'UserOneTransactionEleven',
        account: 'Bonus Bucks',
        amount: r'-$5.00');
    Transaction userOneTransactionTwelve = Transaction(
        date: DateTime.now().subtract(const Duration(days:180)),
        description: 'UserOneTransactionTwelve',
        account: 'Panther Funds',
        amount: r'$50.00');




    userOneTransactions.add(userOneTransactionOne);
    userOneTransactions.add(userOneTransactionTwo);
    userOneTransactions.add(userOneTransactionThree);
    userOneTransactions.add(userOneTransactionFour);
    userOneTransactions.add(userOneTransactionFive);
    userOneTransactions.add(userOneTransactionSix);
    userOneTransactions.add(userOneTransactionSeven);
    userOneTransactions.add(userOneTransactionEight);
    userOneTransactions.add(userOneTransactionNine);
    userOneTransactions.add(userOneTransactionTen);
    userOneTransactions.add(userOneTransactionEleven);
    userOneTransactions.add(userOneTransactionTwelve);
    //#endregion

    //#region User One Cards
    var userOneCards = <CustomCard>[];
    final userOneCardOne = CustomCard(
        name: "Citi",
        nameOnCard: "James Polk",
        number: 1234567812345678,
        exp: "08/25",
        cvv: 123,
        billing: Address(
            lineOne: "123 Mulberry St.",
            lineTwo: "",
            city: "Pittsburgh",
            state: "PA",
            zip: "12345"));
    final userOneCardTwo = CustomCard(
        name: "Citi",
        nameOnCard: "James Polk",
        number: 1234567812341234,
        exp: "08/25",
        cvv: 123,
        billing: Address(
            lineOne: "123 Mulberry St.",
            lineTwo: "",
            city: "Pittsburgh",
            state: "PA",
            zip: "12345"));
    userOneCards.add(userOneCardOne);
    userOneCards.add(userOneCardTwo);
    //#endregion

    User userOnePrime = User(
        firstName: "Diego",
        lastName: "Jurado",
        role: "Student",
        accounts: userOneAccount,
        transactions: userOneTransactions,
        cards: userOneCards,
        email:"diego.jurado@pitt.edu");
    UserViewModel userOne = UserViewModel(user: userOnePrime);
    users["diegojurado"] = userOne;
  }
}
