import ;

class UserViewModel {

  final User user;

  UserViewModel({this.user});

  String get firstName {
    return this.user.firstName;
  }

  String get lastName {
    return this.user.lastName;
  }

  String get role {
    return this.user.role;
  }

  Map<String, double> get accounts {
    return this.user.accounts;
  }

  List<Transaction> get transactions {
    return this.user.transactions;
  }

  List<Cards> get cards {
    return this.user.cards;
  }
}