import 'package:flutter/material.dart';
import 'package:panther_central_ios_app/service/web_service.dart';
import 'package:panther_central_ios_app/viewModel/user_view_model.dart';

class UsersListViewModel extends ChangeNotifier {

  List<UserViewModel> users = List<UserViewModel>();

  Future<void> fetchUsers(String username) async {
    final results = await Webservice().fetchUsers(username);
    this.users = results.map((item) => UserViewModel(user: item)).toList();
    notifyListeners();
  }

}
