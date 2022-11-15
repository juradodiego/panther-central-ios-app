import 'package:flutter/material.dart';
import 'package:panther_central_ios_app/screens/accounts_screen.dart';
import 'package:panther_central_ios_app/screens/dashboard_screen.dart';

import 'package:provider/provider.dart';

class TransactionsScreen extends StatefulWidget {
  @override
  _TransactionsScreenState createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen>{

  int _selectedIndex = 2; // NAVBAR INDEX

  /* NAVBAR SCREEN LINKS */
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 0) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => AccountsScreen()));
    } else if (_selectedIndex == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => DashboardScreen()));
    } else if (_selectedIndex == 2) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => TransactionsScreen()));
    }
  }

  @override
  Widget build(BuildContext context){
    const PC_YELLOW = Color.fromARGB(255, 255, 185, 29);
    const PC_BLUE = Color.fromARGB(255, 0, 53, 148);

    return Scaffold(
      backgroundColor: PC_BLUE,
        /* NAVBAR */
        bottomNavigationBar: SizedBox(
        height: 100,
        child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
        icon: Icon(Icons.attach_money),
    label: 'Accounts',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.bar_chart_sharp),
    label: 'Analytics',
    ),
    ],
    currentIndex: _selectedIndex,
    selectedItemColor: PC_BLUE,
    onTap: _onItemTapped,
    backgroundColor: PC_YELLOW,
    iconSize: 40.0,
    ),
    ),

    );
  }
}