import 'package:flutter/material.dart';
import 'package:panther_central_ios_app/service/web_service.dart';
import 'package:panther_central_ios_app/viewModel/user_view_model.dart';

class UsersListViewModel extends ChangeNotifier {
  List<UserViewModel> users = <UserViewModel>[];

  Future<void> fetchUsers(String username) async {
    final results = await Webservice().fetchUsers(username);
    users = results.map((item) => UserViewModel(user: item)).toList();
    notifyListeners();
  }
}
