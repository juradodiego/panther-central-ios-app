import 'package:flutter/material.dart';
import 'package:panther_central_ios_app/screens/dashboard_screen.dart';
import 'package:panther_central_ios_app/viewModel/users_list_view_model.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Users MVVM Architecture",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: ChangeNotifierProvider(
        create: (context) => UsersListViewModel(),
        child: DashboardScreen(),
      ),
    );
  }
}
