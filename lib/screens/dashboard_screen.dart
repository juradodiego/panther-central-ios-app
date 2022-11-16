import 'package:flutter/material.dart';
import 'package:panther_central_ios_app/screens/load_funds_screen.dart';
import 'package:panther_central_ios_app/screens/settings_screen.dart';
import 'package:panther_central_ios_app/viewModel/user_view_model.dart';
import 'package:panther_central_ios_app/viewModel/users_list_view_model.dart';

import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  final UserViewModel? user;

  const DashboardScreen(this.user);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int _selectedIndex = 1;

  PageController pageController = PageController(initialPage: 1);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    const PC_YELLOW = Color.fromARGB(255, 255, 185, 29);
    const PC_BLUE = Color.fromARGB(255, 0, 53, 148);
    final UserViewModel? USER = widget.user;

    // TODO Fix iOS pixel measurements to fit snug

    return Scaffold(
        backgroundColor: PC_BLUE,
        /* APPBAR: PC LOGO + SETTINGS BUTTON */
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100), // Set this height
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              color: PC_BLUE,
              child: Row(
                children: <Widget>[
                  /* PC LOGO */
                  Padding(
                    padding: const EdgeInsets.only(left:10),
                    child: SizedBox(
                        width: 75,
                        height: 75,
                        child: Image.asset(
                            'asset/images/panther-central-logo.png')),
                  ),
                  Spacer(),
                  /* SETTINGS BUTTON */
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      icon: Icon(Icons.settings),
                      iconSize: 60,
                      color: PC_YELLOW,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => SettingsScreen()));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: PageView(
          controller: pageController,
          children: [
            //#region ACCOUNTS SCREEN
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.warning_rounded,
                    size: 75,
                    color: PC_YELLOW,
                  ),
                  Text(
                    "Under Construction",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: PC_YELLOW),
                  ),
                ],
              ),
            ),
            //#endregion
            //#region DASHBOARD SCREEN
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  /* PANTHER FUNDS ACCOUNT */
                  // TODO Display Account Balance
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Container(
                      height: 75,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(USER!.accounts["Panther Funds"].toString()),
                    ),
                  ),
                  /* LOAD FUNDS BUTTON */
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      height: 75,
                      width: 350,
                      decoration: BoxDecoration(
                          color: PC_YELLOW,
                          borderRadius: BorderRadius.circular(20)),
                      // TODO Change from TextButton -> ElevatedButton
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => LoadFundsScreen(USER)));
                        },
                        child: const Text(
                          'Load Funds',
                          style: TextStyle(color: PC_BLUE, fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                  /* DD ACCOUNT */
                  // TODO Display Account Balance
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      height: 75,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  /* OFF-CAMPUS DD ACCOUNT */
                  // TODO Display Account Balance
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      height: 75,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ],
              ),
            ),
            //#endregion
            //#region TRANSACTIONS SCREEN
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.warning_rounded,
                    size: 75,
                    color: PC_YELLOW,
                  ),
                  Text(
                    "Under Construction",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: PC_YELLOW),
                  ),
                ],
              ),
            )
            //#endregion
          ],
        ),

        /* NAVBAR */
        bottomNavigationBar: SizedBox(
          height: 120,
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
        ));
  }
}
