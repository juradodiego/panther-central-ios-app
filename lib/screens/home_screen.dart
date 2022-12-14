import 'package:flutter/material.dart';
import 'package:panther_central_ios_app/models/custom_card_list_model.dart';
import 'package:panther_central_ios_app/models/transaction_list_model.dart';

import 'package:panther_central_ios_app/custom_widgets/under_construction_widget.dart';
import 'package:panther_central_ios_app/models/transaction_model.dart';
import 'package:panther_central_ios_app/models/transactions_graph_model.dart';
import 'package:panther_central_ios_app/screens/accounts_screen.dart';
import 'package:panther_central_ios_app/screens/dashboard_screen.dart';
import 'package:panther_central_ios_app/screens/load_funds_screen.dart';
import 'package:panther_central_ios_app/screens/settings_screen.dart';
import 'package:panther_central_ios_app/screens/transactions_screen.dart';
import 'package:panther_central_ios_app/viewModel/user_view_model.dart';
import 'package:provider/provider.dart';

import '../models/user_model.dart';

const List<Widget> toggle = <Widget>[Text('D'), Text('M'), Text('Y')];

class HomeScreen extends StatefulWidget {
  final UserViewModel? user;

  const HomeScreen(this.user);

  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final List<bool> _selectedToggle = <bool>[false, true, false];

  PageController pageController = PageController(initialPage: 1);

  int _selectedIndex = 1;

  /**
   *
   */
  void _onPageChange(int page) {
    setState(() {
      _selectedIndex = page;
    });
  }

  /**
   *
   */
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    // Panther Central Theme Colors
    const Color PC_YELLOW = Color.fromARGB(255, 255, 185, 29);
    const Color PC_BLUE = Color.fromARGB(255, 0, 53, 148);

    final UserViewModel? user =
        widget.user; // UserViewModel for getting and setting data

    return Scaffold(
        backgroundColor: PC_BLUE,
        /* APPBAR: PANTHER CENTRAL LOGO + SETTINGS BUTTON */
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100), // Set this height
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              color: PC_BLUE,
              child: Row(
                children: <Widget>[
                  //#region PANTHER CENTRAL LOGO
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                        width: 75,
                        height: 75,
                        child: Image.asset(
                            'assets/images/panther-central-logo.png')),
                  ),
                  //#endregion
                  const Spacer(),
                  //#region SETTINGS SCREEN BUTTON
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      icon: const Icon(Icons.settings),
                      iconSize: 60,
                      color: PC_YELLOW,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => SettingsScreen(user)));
                      },
                    ),
                  ),
                  //#endregion
                ],
              ),
            ),
          ),
        ),
        /* BODY: DISPLAY FOR DASHBOARD, ACCOUNTS, TRANSACTIONS */
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: _onPageChange,
          children: [
            //#region ACCOUNTS SCREEN
            AccountScreen(user!),
            //#endregion
            //#region DASHBOARD SCREEN
            ChangeNotifierProvider(create: (_) => CustomCardList(user), child:DashboardScreen(user)),
            //#endregion
            //#region TRANSACTIONS SCREEN
            ChangeNotifierProvider(create: (_) => TransactionList(user), child: TransactionScreen(user)),
            //#endregion
          ],
        ),
        /* NAVBAR: NAVIGATION BUTTONS BETWEEN DASHBOARD, ACCOUNTS, TRANSACTIONS */
        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          height: 120,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
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
                icon: Icon(
                  Icons.bar_chart_sharp,
                ),
                label: 'Transactions',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: PC_BLUE,
            onTap: _onItemTapped,
            backgroundColor: PC_YELLOW,
            iconSize: 40.0,
          ),
        ));
  }
}


