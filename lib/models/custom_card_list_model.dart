import 'package:flutter/material.dart';
import 'package:panther_central_ios_app/models/custom_card_model.dart';
import 'package:panther_central_ios_app/viewModel/user_view_model.dart';

class CustomCardList with ChangeNotifier {
  CustomCardList(this.user);

  final UserViewModel user;
  List<CustomCard> cards = [];

  void addCard(CustomCard card) {
    user.addCard(card);
    notifyListeners();
  }

  void updateCards() {
    cards = user.cards;
    notifyListeners();
  }
}
