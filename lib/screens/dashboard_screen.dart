import 'package:flutter/material.dart';
import 'package:panther_central_ios_app/viewModel/users_list_view_model.dart';

import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  Widget build(BuildContext context){

    const PC_YELLOW = Color.fromARGB(255,255, 185,29);
    const PC_BLUE = Color.fromARGB(255, 0, 53, 148);

    return Scaffold(
      backgroundColor: PC_BLUE,

    );
  }
}